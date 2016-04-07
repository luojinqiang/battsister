package com.battsister.student;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.Doc;
import com.baje.sz.util.KeyBean;
import com.baje.sz.util.RequestUtil;
import com.battsister.admin.sys.Logdb;
import com.battsister.util.SetupUtil;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class StudentApi {

	/**
	 * 学生登录
	 * @param request
	 * @return
	 */
	public JSONObject checkStudentLogin(HttpServletRequest request){
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "派司德教育--学生登陆";
        JSONObject backjson = new JSONObject();
        try {
            dbc.openConn();
            base.setDbc(dbc, false);
            long createTime = AjaxXml.getTimestamp("now");
            String user_name = ru.getString("loginName").trim();
            String user_pwd = ru.getString("loginPassword").trim();
            if (user_name.equals("") || user_pwd.equals("")) {
                backjson.put("type", false);
                backjson.put("msg", "帐号、密码不能为空");
                return backjson;
            }
            Doc studentDoc = base.executeQuery2Docs("select id,password,account_status,name,username,login_err_times,last_login_time from bs_students where isdel=0 and username=? ", new Object[]{user_name}, 1)[0];
            if (studentDoc == null || studentDoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "帐号不存在");
                return backjson;
            }
            if (!"Y".equals(studentDoc.get("account_status"))) {
                backjson.put("type", false);
                backjson.put("msg", "帐号已被锁定");
                return backjson;
            }
            if (studentDoc.getIn("login_err_times") > 5) {
                backjson.put("type", false);
                backjson.put("msg", "密码错误超过5次已经被锁定");
                return backjson;
            }
            int login_err = studentDoc.getIn("login_err_times");
            int shengxia = 5;
            String UserPasswordDes = "";
            KeyBean m = new KeyBean();
            if (user_pwd != null&&!"".equals(user_pwd)) {
                UserPasswordDes = m.getkeyBeanofStr(user_pwd).toLowerCase();
            }
            if (UserPasswordDes.equals(studentDoc.get("password"))) {
                base.executeUpdate("update bs_students set login_err_times=0,last_login_ip=?,last_login_time=? where id=?", new Object[]{ru.getIps(), createTime, studentDoc.getIn("id")});
                Logdb.WriteSysLog(AjaxXml.getParameterStr(request), "学生登录成功", user_name, studentDoc.getIn("id"), ru.getIps(), 0, base);
                backjson.put("type", true);
                backjson.put("msg", "登陆成功");
                //将用户的登录信息放到session中，
                HttpSession session=request.getSession();
                session.setMaxInactiveInterval(60*60*3);//3小时后过期
                session.setAttribute("student_id",studentDoc.getIn("id"));
                session.setAttribute("student_name",studentDoc.get("name"));
                session.setAttribute("username",studentDoc.get("username"));
                session.setAttribute("last_login_time", AjaxXml.timeStamp2Date(studentDoc.getIn("last_login_time"), "YY04-MM-DD HH:MI"));
            } else {
                shengxia = 5 - login_err;
                if (login_err + 1 == 6) {
                    base.executeUpdate("update bs_students set login_err_times=login_err_times+1,account_status='N' where id=?", new Object[]{studentDoc.getI("id")});
                    backjson.put("type", false);
                    backjson.put("msg", "密码错误超过5次，帐号已经被锁定");
                } else {
                    base.executeUpdate("update bs_students set login_err_times=login_err_times+1 where id=?", new Object[]{studentDoc.getI("id")});
                    backjson.put("type", false);
                    backjson.put("msg", "密码错误，您还有" + shengxia + "次机会");
                }
                Logdb.WriteSysLog(AjaxXml.getParameterStr(request), "学生登录失败", user_name, studentDoc.getIn("id"), ru.getIps(), 0, base);
            }
            base.commit();
            return backjson;
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest + "\r\n ");
            backjson.put("type", false);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {
            dbc.closeConn();
        }
	}


    /**
     * 修改个人资料
     * @param request
     * @return
     */
    public JSONObject editStudentInfo(HttpServletRequest request){
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "派司德教育--学生修改个人资料";
        JSONObject backjson = new JSONObject();
        try {
            dbc.openConn();
            base.setDbc(dbc);
            String name = ru.getString("name").trim();
            String password = ru.getString("password").trim();
            String mobile = ru.getString("mobile").trim();
            String birth = ru.getString("birth").trim();
            int sex = ru.getInt("sex");
            Object student_id = request.getSession().getAttribute("student_id");
            Doc doc = new Doc()
                    .put("name", name)
                    .put("sex", sex)
                    .put("mobile", mobile)
                    .put("birth", AjaxXml.getTimestamp(birth + " 00:00:00"));
            if (!"".equals(password)) {
                doc.put("password", new KeyBean().getkeyBeanofStr(password).toLowerCase());
            }
            base.updateById("bs_students", doc, student_id);
            backjson.put("type", true);
            backjson.put("msg", "更新成功");
            return backjson;
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest + "\r\n ");
            backjson.put("type", false);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {
            dbc.closeConn();
        }
    }

    public JSONObject feedBack(HttpServletRequest request){
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "派司德教育--学生修改个人资料";
        JSONObject backjson = new JSONObject();
        try {
            dbc.openConn();
            base.setDbc(dbc, false);
            String content = ru.getString("content").trim();
            int type = ru.getInt("type");
            Object student_id = request.getSession().getAttribute("student_id");
            Doc studentDoc = base.executeQuery2Docs("select teacher_id from bs_students where id=?", new Object[]{student_id}, 1)[0];
            if (studentDoc == null || studentDoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "学生信息不存在,请重新登录");
                return backjson;
            }
            base.executeInsertByDoc("bs_sys_feedback", new Doc()
                    .put("content", content)
                    .put("type", type).put("teacher_id", studentDoc.get("teacher_id"))
                    .put("student_id", student_id)
                    .put("add_time", AjaxXml.getTimestamp("now")));
            base.commit();
            backjson.put("type", true);
            backjson.put("msg", "反馈成功");
            return backjson;
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest + "\r\n ");
            backjson.put("type", false);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {
            dbc.closeConn();
        }
    }


}
