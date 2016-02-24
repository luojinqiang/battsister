package com.hanyou.admin.sys;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.*;
import com.hanyou.util.SetupUtil;

import net.sf.json.JSONObject;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
        String logtitle = "后台登陆";
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

            Doc admindoc = base.executeQuery2Docs("select id,gym_group_id,gym_id,user_pwd,user_flag,islock,login_err from hy_sys_user where isdel=0 and user_name=? ", new Object[]{user_name}, 1)[0];
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

            if (UserPasswordDes.equals(admindoc.get("user_pwd"))) {
                AddCookie.writeCookie("adminwebcookies", AjaxXml.escape(user_name) + "|" + UserNameDes + "|" + admindoc.getIn("id"), AppConf.getconf().get("webcookies"), response, 0);    // 添加cookies
                base.executeUpdate("update hy_sys_user set login_err=0,last_login_ip=?,last_login_time=? where id=?", new Object[]{ru.getIps(), createTime, admindoc.getI("id")});
                Logdb.WriteSysLog(admindoc.getIn("gym_group_id"), admindoc.getIn("gym_id"), AjaxXml.getParameterStr(request), "登录成功", user_name, admindoc.getIn("id"), ru.getIps(), 0, base);
                backjson.put("type", true);
                backjson.put("msg", "登陆成功");
            } else {
                shengxia = 5 - login_err;
                if (login_err + 1 == 6) {
                    base.executeUpdate("update hy_sys_user set login_err=login_err+1,islock=1 where id=?", new Object[]{admindoc.getI("id")});
                    backjson.put("type", false);
                    backjson.put("msg", "密码错误超过5次，帐号已经被锁定");
                } else {
                    base.executeUpdate("update hy_sys_user set login_err=login_err+1 where id=?", new Object[]{admindoc.getI("id")});
                    backjson.put("type", false);
                    backjson.put("msg", "密码错误，您还有" + shengxia + "次机会");
                }

                Logdb.WriteSysLog(admindoc.getIn("gym_group_id"), admindoc.getIn("gym_id"), AjaxXml.getParameterStr(request), "登录失败", user_name, admindoc.getIn("id"), ru.getIps(), 0, base);
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

        // System.out.println("request="+request);
        Cookie[] urscookies = request.getCookies();

        if (null == urscookies) {
            return -1;
        }

        Cookie urscookie = null;

        for (int i = 0; i < urscookies.length; i++) {

            // System.out.println("urscookies[i].getName()="+urscookies[i].getName());
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
    public JSONObject editAdminUser(HttpServletRequest request, int user_id, String user_name, int gym_group_id, int gym_id) {
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
            int gymGroupId = ru.getInt("gym_group_id");
            int gymId = ru.getInt("gym_id");
            if (gym_group_id > 0) {
                gymGroupId = gym_group_id;
            }
            if (gym_id > 0) {
                gymId = gym_id;
            }

            KeyBean m = new KeyBean();
            String p_t = "";
            List list = new ArrayList();
            if (!user_pwd.equals(user_pwd2)) {
                backjson.put("type", false);
                backjson.put("msg", "操作失败，2次密码不相同");
                return backjson;
            }
            Doc user = base.executeQuery2Docs("select id from hy_sys_user where user_name=?", new Object[]{username}, 1)[0];
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
            String sql = "insert into hy_sys_user(user_name,user_pwd,user_flag,create_ip,create_time,islock,gym_group_id,gym_id) values (?,?,?,?,?,?,?,?)";
            if (id == 0) {
                if (user_pwd.equals("")) {
                    backjson.put("type", false);
                    backjson.put("msg", "操作失败，密码不能为空");
                    return backjson;
                }
                String pass1 = m.getkeyBeanofStr(user_pwd).toLowerCase();
                // list.add(AjaxXml.getid());
                list.add(username);
                list.add(pass1);
                list.add(user_flag);
                list.add(cip);
                list.add(createTime);
                list.add(0);
                list.add(gymGroupId);
                list.add(gymId);
            } else {
                logtitle = "编辑管理员";
                if (!user_pwd.equals("")) {    // 密码为空则不修改密码
                    String pass1 = m.getkeyBeanofStr(user_pwd).toLowerCase();

                    p_t = "user_pwd=?,";
                    list.add(pass1);
                }
                sql = "update hy_sys_user set " + p_t + "user_name=?,user_flag=?,login_err=?,islock=?,gym_group_id=?,gym_id=? where id=?";
                list.add(username);
                list.add(user_flag);
                list.add(login_err);
                list.add(islock);
                list.add(gymGroupId);
                list.add(gymId);
                list.add(id);
            }
            Logdb.WriteSysLog(gym_group_id, gym_id, AjaxXml.getParameterStr(request), logtitle, user_name, user_id, ru.getIps(), 0, base);
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


    public JSONObject editPassword(HttpServletRequest request, int user_id, String user_name, int gym_group_id, int gym_id) {
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

                base.executeUpdate(" update hy_sys_user set user_pwd=? where id=? ", list);

            }
            Logdb.WriteSysLog(gym_group_id, gym_id, AjaxXml.getParameterStr(request), logtitle, user_name, user_id, ru.getIps(), 0, base);
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

    // 删除后台管理员
    public String Delsysuser(HttpServletRequest request, String username, int userid, int gym_group_id, int gym_id) {
        Dbc dbc = DbcFactory.getRDbcInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);

        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc, false);
            String ids = ru.getString("ids");
            String[] idarr = StringUtil.strs2array(ids, ",");
            int i = 0;
            StringBuffer wenhao = new StringBuffer("");
            List sqllist = new ArrayList();

            for (i = 0; i < idarr.length; i++) {
                if (i == 0) {
                    wenhao.append("?");
                } else {
                    wenhao.append(",?");
                }

                sqllist.add(idarr[i]);
            }
            base.executeUpdate("update hy_sys_user set isdel=1 where id in (" + wenhao.toString() + ")", sqllist);
            Logdb.WriteSysLog(gym_group_id, gym_id, AjaxXml.getParameterStr(request), "删除后台管理员" + i + "条", username, userid, ru.getIps(), 0, base);
            base.commit();
            return "删除成功$$ok";
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
            LogUtility.log(e, "删除后台管理员");

            return "删除失败$$err";
        } finally {
            dbc.closeConn();
        }
    }

    /**
     * 乐跑屋第三方申请加盟
     *
     * @return
     */
    public JSONObject thirdPartyApply(HttpServletRequest request) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "添加管理员";
        JSONObject backjson = new JSONObject();
        try {
            dbc.openConn();
            base.setDbc(dbc);
            String companyName = ru.getString("companyName");
            String companyAddress = ru.getString("companyAddress");
            String contactMan = ru.getString("contactMan");
            String contactPhone = ru.getString("contactPhone");
            String otherExplain = ru.getString("otherExplain");
            String provinceName=ru.getString("provinceName");
            String cityName=ru.getString("cityName");
            String areaName=ru.getString("areaName");
            String email=ru.getString("email","");
            String weixin_id=ru.getString("weixin_id","");//微信id
            if (companyName == null || "".equals(companyName)) {
                backjson.put("type", false);
                backjson.put("msg", "请输入公司名称");
                return backjson;
            }
            if (companyAddress == null || "".equals(companyAddress)) {
                backjson.put("type", false);
                backjson.put("msg", "请输入公司地址");
                return backjson;
            }
            if (contactMan == null || "".equals(contactMan)) {
                backjson.put("type", false);
                backjson.put("msg", "请输入联系人");
                return backjson;
            }
            if (contactPhone == null || "".equals(contactPhone)) {
                backjson.put("type", false);
                backjson.put("msg", "请输入联系电话");
                return backjson;
            } else {
                Pattern p1 = Pattern.compile("^[0][1-9]{2,3}-[0-9]{5,10}$");
                Matcher m = p1.matcher(contactPhone);
                if (!AjaxXml.checkPhone(contactPhone) && !m.matches()) {
                    backjson.put("type", false);
                    backjson.put("msg", "请输入正确的联系电话");
                    return backjson;
                }
            }
            JSONObject json = new JSONObject();
            json.put("companyName", companyName);
            json.put("provinceName",provinceName);
            json.put("cityName",cityName);
            json.put("areaName",areaName);
            json.put("companyAddress", companyAddress);
            json.put("contactMan", contactMan);
            json.put("contactPhone", contactPhone);
            json.put("email", email);
            json.put("weixin_id",weixin_id!=null&&!"".equals(weixin_id)?weixin_id:0);
            json.put("otherExplain", otherExplain == null || "".equals(otherExplain) ? "" : otherExplain);
            base.executeUpdate("insert into hy_sys_feedback (content,type,create_time) values (?,?,?)", new Object[]{json.toString(), 1, AjaxXml.getTimestamp("now")});
            backjson.put("type", true);
            backjson.put("msg", "申请成功");
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
     * 删除第三方加盟申请
     *
     * @param request
     * @param userid
     * @param username
     * @param gym_group_id
     * @param gym_id
     * @return
     */
    public JSONObject thirdPartyApplyDel(HttpServletRequest request, int userid, String username, int gym_group_id, int gym_id) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "第三方加盟申请-删除";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc, false);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            int id = ru.getInt("id");
            Doc doc = base.executeQuery2Docs("select id from hy_sys_feedback where id=? and isdel=0", new Object[]{id}, 1)[0];
            if (doc == null || doc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "申请不存在");
                return backjson;
            }
            base.executeUpdate("update hy_sys_feedback set isdel=1 where id=?", new Object[]{id});
            Logdb.WriteSysLog(gym_group_id, gym_id, ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
            base.commit();
            backjson.put("type", true);
            backjson.put("msg", "操作成功");
            return backjson;
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest);
            backjson.put("type", false);
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
    public JSONObject getMainInfo(int gym_group_id,int gym_id){
        Dbc dbc = DbcFactory.getRDbcInstance();
        Base base = new Base();
        JSONObject backjson=new JSONObject();
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc,false);
            String today_date=AjaxXml.Get_Date("now","YY04-MM-DD");
            Doc infoDoc=base.executeQuery2Docs("select count(*) as 'counts' ,sum(mem_today) as 'mem_today' from (select id,case DATE_FORMAT(FROM_UNIXTIME(mem_addtime),'%Y-%m-%d') when '"+today_date+"' then 1 else 0 end as 'mem_today' from hy_member where isdel=0 ) a ",new Object[]{},1)[0];
            int memNum=0;//总的用户数
            int memNum_totday=0;//今日新增
            if(infoDoc!=null){
            	memNum=infoDoc.getIn("counts");
            	memNum_totday=infoDoc.getIn("mem_today");
            }
            backjson.put("memNum",memNum);
            backjson.put("memNum_totday",memNum_totday);
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
