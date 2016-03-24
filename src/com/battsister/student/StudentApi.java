package com.battsister.student;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
            long createTime = SetupUtil.getTimestamp("");
            String user_name = ru.getString("user_name").trim();
            String user_pwd = ru.getString("user_pwd").trim();
            if (user_name.equals("") || user_pwd.equals("")) {
                backjson.put("type", false);
                backjson.put("msg", "帐号、密码不能为空");
                return backjson;
            }
            Doc teacherDoc = base.executeQuery2Docs("select id,password,account_status,name,username,login_err_times from bs_students where isdel=0 and username=? ", new Object[]{user_name}, 1)[0];
            if (teacherDoc == null || teacherDoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "帐号不存在");
                return backjson;
            }
            if (!"Y".equals(teacherDoc.getIn("account_status"))) {
                backjson.put("type", false);
                backjson.put("msg", "帐号已被锁定");
                return backjson;
            }
            if (teacherDoc.getIn("login_err_times") > 5) {
                backjson.put("type", false);
                backjson.put("msg", "密码错误超过5次已经被锁定");
                return backjson;
            }
            int login_err = teacherDoc.getIn("login_err_times");
            int shengxia = 5;
            String UserPasswordDes = "";
            KeyBean m = new KeyBean();
            if (user_pwd != null&&!"".equals(user_pwd)) {
                UserPasswordDes = m.getkeyBeanofStr(user_pwd).toLowerCase();
            }
            if (UserPasswordDes.equals(teacherDoc.get("password"))) {
                base.executeUpdate("update bs_students set login_err_times=0,last_login_ip=?,last_login_time=? where id=?", new Object[]{ru.getIps(), createTime, teacherDoc.getI("id")});
                Logdb.WriteSysLog(AjaxXml.getParameterStr(request), "教师登录成功", user_name, teacherDoc.getIn("id"), ru.getIps(), 0, base);
                backjson.put("type", true);
                backjson.put("msg", "登陆成功");
                //将用户的登录信息放到session中，
                HttpSession session=request.getSession();
                session.setMaxInactiveInterval(60*60*3);//3小时后过期
                session.setAttribute("student_id",teacherDoc.getIn("id"));
                session.setAttribute("student_name",teacherDoc.get("name"));
                session.setAttribute("username",teacherDoc.get("username"));
            } else {
                shengxia = 5 - login_err;
                if (login_err + 1 == 6) {
                    base.executeUpdate("update bs_students set login_err_times=login_err_times+1,account_status='N' where id=?", new Object[]{teacherDoc.getI("id")});
                    backjson.put("type", false);
                    backjson.put("msg", "密码错误超过5次，帐号已经被锁定");
                } else {
                    base.executeUpdate("update bs_students set login_err_times=login_err_times+1 where id=?", new Object[]{teacherDoc.getI("id")});
                    backjson.put("type", false);
                    backjson.put("msg", "密码错误，您还有" + shengxia + "次机会");
                }
                Logdb.WriteSysLog(AjaxXml.getParameterStr(request), "学生登录失败", user_name, teacherDoc.getIn("id"), ru.getIps(), 0, base);
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
}
