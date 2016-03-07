package com.battsister.admin.sys;
import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.*;
import com.battsister.util.SetupUtil;

import net.sf.json.JSONObject;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

/**
 * 后台管理员类
 *
 * @author
 */
public class AdminLogin {
    private String user_name = "guest";
    private int adminuserid = 0;
    private int gym_group_id = 0;
    private int gym_id = 0;

    public String getuser_name() {
        return user_name;
    }

    public int getuserid() {
        return adminuserid;
    }

    public int getGymGroupid() {
        return gym_group_id;
    }

    public int getGymid() {
        return gym_id;
    }

    public void setuser_name(String user_name) {
        this.user_name = user_name;
    }

    public void setUid(int userid) {
        this.adminuserid = userid;
    }

    public void setGymGroupid(int gym_group_id) {
        this.gym_group_id = gym_group_id;
    }

    public void setGymid(int gym_id) {
        this.gym_id = gym_id;
    }

    public JSONObject checkAdminLogin(HttpServletRequest request, HttpServletResponse response) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "派司德教育--后台登陆";
        JSONObject backjson = new JSONObject();
        try {
            dbc.openConn();
            base.setDbc(dbc, false);
            long createTime = SetupUtil.getTimestamp("");
            String user_name = ru.getString("user_name").trim();
            String user_pwd = ru.getString("user_pwd").trim();
            if (user_name.equals("") || user_pwd.equals("")) {
                backjson.put("type", false);
                backjson.put("msg", "帐号、密码不能为空");
                return backjson;
            }
            Doc admindoc = base.executeQuery2Docs("select id,password,flag,islock,login_err from bs_sys_user where isdel=0 and username=? ", new Object[]{user_name}, 1)[0];
            if ((admindoc == null) || admindoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "帐号不存在");
                return backjson;
            }
            if (admindoc.getIn("islock") == 1) {
                backjson.put("type", false);
                backjson.put("msg", "帐号已被锁定");
                return backjson;
            }
            if (admindoc.getIn("login_err") > 5) {
                backjson.put("type", false);
                backjson.put("msg", "密码错误超过5次已经被锁定");
                return backjson;
            }
            int login_err = admindoc.getIn("login_err");
            int shengxia = 5;
            DesEncrypter des = new DesEncrypter(AppConf.getconf().get("privatekey"));
            String et_username = AjaxXml.escape(user_name);
            String UserNameDes = des.encrypt(et_username);
            String UserPasswordDes = "";
            KeyBean m = new KeyBean();
            if ((user_pwd != null) && (user_pwd.length() != 0)) {
                UserPasswordDes = m.getkeyBeanofStr(user_pwd).toLowerCase();
            }
            if (UserPasswordDes.equals(admindoc.get("password"))) {
                AddCookie.writeCookie("adminwebcookies", AjaxXml.escape(user_name) + "|" + UserNameDes + "|" + admindoc.getIn("id"), AppConf.getconf().get("webcookies"), response, 0);    // 添加cookies
                base.executeUpdate("update bs_sys_user set login_err=0,last_login_ip=?,last_login_time=? where id=?", new Object[]{ru.getIps(), createTime, admindoc.getI("id")});
                Logdb.WriteSysLog(AjaxXml.getParameterStr(request), "登录成功", user_name, admindoc.getIn("id"), ru.getIps(), 0, base);
                backjson.put("type", true);
                backjson.put("msg", "登陆成功");
                //将用户的权限,用户名添加到session对象中(休眠一小时后重新登录)
                HttpSession session=request.getSession();
                session.setMaxInactiveInterval(3600);
                session.setAttribute("user_id",admindoc.getIn("id"));
                session.setAttribute("user_name",user_name);
                session.setAttribute("user_flag",admindoc.get("flag",""));
            } else {
                shengxia = 5 - login_err;
                if (login_err + 1 == 6) {
                    base.executeUpdate("update bs_sys_user set login_err=login_err+1,islock=1 where id=?", new Object[]{admindoc.getI("id")});
                    backjson.put("type", false);
                    backjson.put("msg", "密码错误超过5次，帐号已经被锁定");
                } else {
                    base.executeUpdate("update bs_sys_user set login_err=login_err+1 where id=?", new Object[]{admindoc.getI("id")});
                    backjson.put("type", false);
                    backjson.put("msg", "密码错误，您还有" + shengxia + "次机会");
                }

                Logdb.WriteSysLog(AjaxXml.getParameterStr(request), "登录失败", user_name, admindoc.getIn("id"), ru.getIps(), 0, base);
            }
            base.commit();
            return backjson;
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest + "\r\n ");
            backjson.put("type", true);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {
            dbc.closeConn();
        }
    }
    public int checkLogin(HttpServletRequest request, HttpServletResponse response) {
        int _jsp = this.verifyJsp(request, response);
        if (_jsp == 0) {
            return _jsp;
        } else {
            return -1;
        }
    }
    public int verifyJsp(HttpServletRequest request, HttpServletResponse response) {
        boolean haveurs = false;
        Cookie[] urscookies = request.getCookies();
        if (null == urscookies) {
            return -1;
        }
        Cookie urscookie = null;
        for (int i = 0; i < urscookies.length; i++) {
            if (urscookies[i].getName().equals("adminwebcookies")) {
                urscookie = urscookies[i];
                haveurs = true;

                break;
            }
        }

        if (!haveurs) {
            return -2;
        }

        String ursstr = urscookie.getValue();

        try {
            DesEncrypter des = new DesEncrypter(AppConf.getconf().get("privatekey"));
            List list = StringUtil.strs2list(ursstr, "|");

            if ((list == null) || (list.size() == 0)) {
                return -1;
            } else {
                String user_name = (String) list.get(0);
                String adminuserid = (String) list.get(2);

                if ((user_name == null) || (user_name.length() == 0)) {
                    return -1;
                }

                user_name = AjaxXml.unescape(user_name);
                this.setuser_name(AjaxXml.unescape(user_name));
                this.setUid(Integer.parseInt(adminuserid));
            }

            return 0;
        } catch (Exception e) {
            e.printStackTrace();

            return -1;
        }
    }

    public String logout(HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestUtil ru = new RequestUtil(request);
            AddCookie.writeCookie("adminwebcookies", "", AppConf.getconf().get("webcookies"), response, 0);    // 添加cookies
            HttpSession session = request.getSession();
            session.invalidate();
            return "退出登录成功";
        } catch (Exception e) {
            e.printStackTrace();

            return "异常错误";                                                                     // 异常错误;
        }
    }

    /*
     * 编辑管理员
     */
    public JSONObject editAdminUser(HttpServletRequest request, int user_id, String user_name) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "添加管理员";
        JSONObject backjson = new JSONObject();
        try {
            dbc.openConn();
            base.setDbc(dbc, false);
            long createTime = SetupUtil.getTimestamp("");
            int id = ru.getInt("id");
            String username = ru.getString("user_name");
            String user_pwd = ru.getString("user_pwd");
            String user_pwd2 = ru.getString("user_pwd2");
            String flags = ru.getString("user_flag");
            String user_flag = "," + flags + ",";
            int islock = ru.getInt("islock");
            int login_err = ru.getInt("login_err");
            String cip = ru.getIps();
            KeyBean m = new KeyBean();
            String p_t = "";
            List list = new ArrayList();
            if (!user_pwd.equals(user_pwd2)) {
                backjson.put("type", false);
                backjson.put("msg", "操作失败，2次密码不相同");
                return backjson;
            }
            Doc user = base.executeQuery2Docs("select id from bs_sys_user where username=?", new Object[]{username}, 1)[0];
            if ((user != null) && !user.isEmpty()) {
                if (id > 0) {
                    if (id != user.getIn("id")) {
                        backjson.put("type", false);
                        backjson.put("msg", "操作失败，帐号已经存在");
                        return backjson;
                    }
                } else {
                    backjson.put("type", false);
                    backjson.put("msg", "操作失败，帐号已经存在");
                    return backjson;
                }
            }
            String sql = "insert into bs_sys_user(username,password,flag,create_ip,create_time,islock) values (?,?,?,?,?,?)";
            if (id == 0) {
                if (user_pwd.equals("")) {
                    backjson.put("type", false);
                    backjson.put("msg", "操作失败，密码不能为空");
                    return backjson;
                }
                String pass1 = m.getkeyBeanofStr(user_pwd).toLowerCase();
                list.add(username);
                list.add(pass1);
                list.add(user_flag);
                list.add(cip);
                list.add(createTime);
                list.add(0);
            } else {
                logtitle = "编辑管理员";
                if (!user_pwd.equals("")) {    // 密码为空则不修改密码
                    String pass1 = m.getkeyBeanofStr(user_pwd).toLowerCase();

                    p_t = "password=?,";
                    list.add(pass1);
                }
                sql = "update bs_sys_user set " + p_t + "username=?,flag=?,login_err=?,islock=? where id=?";
                list.add(username);
                list.add(user_flag);
                list.add(login_err);
                list.add(islock);
                list.add(id);
            }
            Logdb.WriteSysLog(AjaxXml.getParameterStr(request), logtitle, user_name, user_id, ru.getIps(), 0, base);
            base.executeUpdate(sql, list);
            base.commit();
            backjson.put("type", true);
            backjson.put("msg", "操作成功");

            return backjson;
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest + "\r\n ");
            backjson.put("type", true);
            backjson.put("msg", "系统忙，请稍候再试");

            return backjson;
        } finally {
            dbc.closeConn();
        }
    }
    /**
     * 后台管理员--更改密码
     * @param request
     * @param user_id
     * @param user_name
     * @param gym_group_id
     * @param gym_id
     * @return
     */
    public JSONObject editPassword(HttpServletRequest request, int user_id, String user_name) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "";
        JSONObject backjson = new JSONObject();

        try {
            dbc.openConn();
            base.setDbc(dbc);
            KeyBean m = new KeyBean();
            long createTime = SetupUtil.getTimestamp("");
            String user_pwd = ru.getString("user_pwd");
            String user_pwd2 = ru.getString("user_pwd2");
            List list = new ArrayList();

            if (!user_pwd.equals(user_pwd2)) {
                backjson.put("type", false);
                backjson.put("msg", "操作失败，2次密码不相同");
                return backjson;
            }
            if (user_pwd.equals("")) {
                backjson.put("type", false);
                backjson.put("msg", "操作失败，密码不能为空");
                return backjson;
            }
            if (user_id > 0) {
                String pass1 = m.getkeyBeanofStr(user_pwd).toLowerCase();
                logtitle = "修改密码";
                list.add(pass1);
                list.add(user_id);

                base.executeUpdate(" update bs_sys_user set password=? where id=? ", list);

            }
            Logdb.WriteSysLog( AjaxXml.getParameterStr(request), logtitle, user_name, user_id, ru.getIps(), 0, base);
            backjson.put("type", true);
            backjson.put("msg", "操作成功");
            return backjson;
        } catch (Exception e) {

            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest + "\r\n ");
            backjson.put("type", true);
            backjson.put("msg", "系统忙，请稍候再试");

            return backjson;
        } finally {
            dbc.closeConn();
        }
    }


    /**
     * 获取首页的信息
     * @param gym_group_id
     * @param gym_id
     * @return
     */
    public JSONObject getMainInfo(){
        Dbc dbc = DbcFactory.getRDbcInstance();
        Base base = new Base();
        JSONObject backjson=new JSONObject();
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc,false);
            String today_date=AjaxXml.Get_Date("now","YY04-MM-DD");
            Doc infoDoc=base.executeQuery2Docs("select count(*) as 'counts' ,sum(mem_today) as 'mem_today' from (select id,case DATE_FORMAT(FROM_UNIXTIME(addtime),'%Y-%m-%d') when '"+today_date+"' then 1 else 0 end as 'mem_today' from bs_teachers where isdel=0 ) a ",new Object[]{},1)[0];
            int teacherNum=0;//总的用户数
            int teacherNum_totday=0;//今日新增
            if(infoDoc!=null){
            	teacherNum=infoDoc.getIn("counts");
            	teacherNum_totday=infoDoc.getIn("mem_today");
            }
            backjson.put("teacherNum",teacherNum);
            backjson.put("teacherNum_totday",teacherNum_totday);
            return backjson;
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
            LogUtility.log(e, "获取首页需要的信息");
            return backjson;
        } finally {
            dbc.closeConn();
        }
    
    }
}
