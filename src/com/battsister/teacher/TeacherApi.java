package com.battsister.teacher;

import java.util.List;

import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.AppConf;
import com.baje.sz.util.Doc;
import com.baje.sz.util.KeyBean;
import com.baje.sz.util.RequestUtil;
import com.baje.sz.util.SendEmail;
import com.battsister.admin.sys.Logdb;

public class TeacherApi {
	/**
	 * 教师登录
	 * @param request
	 * @return
	 */
	public JSONObject checkTeacherLogin(HttpServletRequest request){
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "派司德教育--教师登陆";
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
            Doc teacherDoc = base.executeQuery2Docs("select id,password,account_status,name,username,login_err_times,last_login_time from bs_teachers where isdel=0 and username=? ", new Object[]{user_name}, 1)[0];
            if (teacherDoc == null || teacherDoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "帐号不存在");
                return backjson;
            }
            if (!"Y".equals(teacherDoc.get("account_status"))) {
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
                base.executeUpdate("update bs_teachers set login_err_times=0,last_login_ip=?,login_times=login_times+1,last_login_time=? where id=?", new Object[]{ru.getIps(), createTime, teacherDoc.getI("id")});
                Logdb.WriteSysLog(AjaxXml.getParameterStr(request), "教师登录成功", user_name, teacherDoc.getIn("id"), ru.getIps(), 0, base);
                backjson.put("type", true);
                backjson.put("msg", "登陆成功");
                //将用户的登录信息放到session中，
                HttpSession session=request.getSession();
                session.setMaxInactiveInterval(60*60*3);//3小时后过期
                session.setAttribute("teacher_id",teacherDoc.getIn("id"));
                session.setAttribute("teacher_name",teacherDoc.get("name"));
                session.setAttribute("username",teacherDoc.get("username"));
                session.setAttribute("last_login_time",teacherDoc.getIn("last_login_time"));
            } else {
                shengxia = 5 - login_err;
                if (login_err + 1 == 6) {
                    base.executeUpdate("update bs_teachers set login_err_times=login_err_times+1,account_status='N' where id=?", new Object[]{teacherDoc.getI("id")});
                    backjson.put("type", false);
                    backjson.put("msg", "密码错误超过5次，帐号已经被锁定");
                } else {
                    base.executeUpdate("update bs_teachers set login_err_times=login_err_times+1 where id=?", new Object[]{teacherDoc.getI("id")});
                    backjson.put("type", false);
                    backjson.put("msg", "密码错误，您还有" + shengxia + "次机会");
                }
                Logdb.WriteSysLog(AjaxXml.getParameterStr(request), "老师登录失败", user_name, teacherDoc.getIn("id"), ru.getIps(), 0, base);
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
     * 教师更新信息
     * @param request
     * @return
     */
    public JSONObject updateInfo(HttpServletRequest request){
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "派司德教育--教师更新信息";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            Object teacher_id =request.getSession().getAttribute("teacher_id");
            Doc teacherDoc=base.executeQuery2Docs("select id,username from bs_teachers where id=? and isdel=0", new Object[]{teacher_id},1)[0];
            if(teacherDoc==null||teacherDoc.isEmpty()){
            	 backjson.put("type", false);
                 backjson.put("msg", "教师账号不存在");
                 return backjson;
            }
            String name=ru.getString("name");
            String email=ru.getString("email");
            String password=ru.getString("password");
            String password_comfirm=ru.getString("password_comfirm");
            int sex=ru.getInt("sex");
            if(name==null||name.trim().equals("")){
            	 backjson.put("type", false);
                 backjson.put("msg", "姓名不能为空");
                 return backjson;
            }
            if(email==null||email.equals("")){
            	 backjson.put("type", false);
                 backjson.put("msg", "邮箱地址不能为空");
                 return backjson;
            }else if(!AjaxXml.checkEmail(email)){
            	 backjson.put("type", false);
                 backjson.put("msg", "邮箱地址格式不正确");
                 return backjson;
            }
            Doc updateDoc=new Doc();
            updateDoc.put("name",name);
            updateDoc.put("email", email);
            updateDoc.put("sex", sex);
            if(password!=null&&!password.trim().equals("")){
            	if(!password.equals(password_comfirm)){
            		 backjson.put("type", false);
                     backjson.put("msg", "两次输入密码不一致");
                     return backjson;
            	}else{
            		 updateDoc.put("password",new KeyBean().getkeyBeanofStr(password).toLowerCase());
            	}
            }
            Doc whereDoc=new Doc();
            whereDoc.put("id",teacher_id);
            base.executeUpdateByDoc("bs_teachers", updateDoc,whereDoc);
            Logdb.WriteSysLog(AjaxXml.getParameterStr(request), "教师更改个人信息", teacherDoc.get("username"), teacherDoc.getIn("id"), ru.getIps(), 0, base);
            backjson.put("type", true);
            backjson.put("msg", "操作成功");
            return backjson;
        } catch (Exception e) {
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
     * 删除学生
     * @param request
     * @return
     */
    public JSONObject delStudent(HttpServletRequest request){
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "派司德教育--删除学生";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            int student_id=ru.getInt("student_id");
            Object teacher_id =request.getSession().getAttribute("teacher_id");
            Doc teacherDoc=base.executeQuery2Docs("select id,username from bs_teachers where id=? and isdel=0", new Object[]{teacher_id},1)[0];
            if(teacherDoc==null||teacherDoc.isEmpty()){
            	 backjson.put("type", false);
                 backjson.put("msg", "教师账号不存在");
                 return backjson;
            }
            base.executeUpdate("update bs_students set isdel=1 where id=? and teacher_id=? ",new Object[]{student_id,teacher_id});
            Logdb.WriteSysLog(AjaxXml.getParameterStr(request), "教师删除学生", teacherDoc.get("username"), teacherDoc.getIn("id"), ru.getIps(), 0, base);
            backjson.put("type", true);
            backjson.put("msg", "操作成功");
            return backjson;
        } catch (Exception e) {
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
     * 删除全部学生
     * @param request
     * @return
     */
    public JSONObject delAllStudent(HttpServletRequest request){
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "派司德教育--删除全部学生";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            Object teacher_id =request.getSession().getAttribute("teacher_id");
            Doc teacherDoc=base.executeQuery2Docs("select id,username from bs_teachers where id=? and isdel=0", new Object[]{teacher_id},1)[0];
            if(teacherDoc==null||teacherDoc.isEmpty()){
            	 backjson.put("type", false);
                 backjson.put("msg", "教师账号不存在");
                 return backjson;
            }
            base.executeUpdate("update bs_students set isdel=1 where teacher_id=? ",new Object[]{teacher_id});
            Logdb.WriteSysLog(AjaxXml.getParameterStr(request), "教师删除全部学生", teacherDoc.get("username"), teacherDoc.getIn("id"), ru.getIps(), 0, base);
            backjson.put("type", true);
            backjson.put("msg", "操作成功");
            return backjson;
        } catch (Exception e) {
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
     * 添加学生
     * @param request
     * @return
     */
    public JSONObject addStudent(HttpServletRequest request){
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "派司德教育--添加学生";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            Object teacher_id =request.getSession().getAttribute("teacher_id");
            Doc teacherDoc=base.executeQuery2Docs("select id,username,school_id from bs_teachers where id=? and isdel=0", new Object[]{teacher_id},1)[0];
            if(teacherDoc==null||teacherDoc.isEmpty()){
            	 backjson.put("type", false);
                 backjson.put("msg", "教师账号不存在");
                 return backjson;
            }
            String username=ru.getString("username");
            String name=ru.getString("name");
            String mobile=ru.getString("mobile");
            int sex=ru.getInt("sex");
            if(username==null||"".equals(username)){
            	 backjson.put("type", false);
                 backjson.put("msg", "请输入学生学号");
                 return backjson;
            }
            if(name==null||"".equals(name)){
           	 	backjson.put("type", false);
                backjson.put("msg", "请输入学生姓名");
                return backjson;
            }
            if(mobile!=null&&!"".equals(mobile)){
            	if(!AjaxXml.checkPhone2(mobile)){
            		backjson.put("type", false);
                    backjson.put("msg", "请输入正确格式的学生手机号码");
                    return backjson;
            	}
            }
            if(sex!=1&&sex!=2){
            	backjson.put("type", false);
                backjson.put("msg", "请选择学生性别");
                return backjson;
           	}
            Doc insertDoc=new Doc();
            insertDoc.put("username", username);
            insertDoc.put("password",new KeyBean().getkeyBeanofStr(username).toLowerCase());
            insertDoc.put("name",name);
            insertDoc.put("mobile",mobile);
            insertDoc.put("sex",sex);
            insertDoc.put("account_status","Y");
            insertDoc.put("school_id",teacherDoc.getIn("school_id"));
            insertDoc.put("teacher_id",teacher_id);
            insertDoc.put("addtime",AjaxXml.getTimestamp("now"));
            base.executeInsertByDoc("bs_students",insertDoc);
            Logdb.WriteSysLog(AjaxXml.getParameterStr(request), "添加学生", teacherDoc.get("username"), teacherDoc.getIn("id"), ru.getIps(), 0, base);
            backjson.put("type", true);
            backjson.put("msg", "操作成功");
            return backjson;
        } catch (Exception e) {
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
     * 更新学生信息
     * @param request
     * @return
     */
    public JSONObject updateStudent(HttpServletRequest request){
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "派司德教育--修改学生";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            Object teacher_id =request.getSession().getAttribute("teacher_id");
            Doc teacherDoc=base.executeQuery2Docs("select id,username from bs_teachers where id=? and isdel=0", new Object[]{teacher_id},1)[0];
            if(teacherDoc==null||teacherDoc.isEmpty()){
            	 backjson.put("type", false);
                 backjson.put("msg", "教师账号不存在");
                 return backjson;
            }
            String username=ru.getString("username");
            String name=ru.getString("name");
            String mobile=ru.getString("mobile");
            int sex=ru.getInt("sex");
            String password=ru.getString("password");
            int student_id=ru.getInt("student_id");
            if(username==null||"".equals(username)){
            	 backjson.put("type", false);
                 backjson.put("msg", "请输入学生学号");
                 return backjson;
            }
            if(name==null||"".equals(name)){
           	 	backjson.put("type", false);
                backjson.put("msg", "请输入学生姓名");
                return backjson;
            }
            if(mobile!=null&&!"".equals(mobile)){
            	if(!AjaxXml.checkPhone2(mobile)){
            		backjson.put("type", false);
                    backjson.put("msg", "请输入正确格式的学生手机号码");
                    return backjson;
            	}
            }
            if(sex!=1&&sex!=2){
            	backjson.put("type", false);
                backjson.put("msg", "请选择学生性别");
                return backjson;
           	}
            Doc updateDoc=new Doc();
            updateDoc.put("username", username);
            updateDoc.put("name",name);
            updateDoc.put("mobile",mobile);
            updateDoc.put("sex",sex);
            if(password!=null&&!"".equals(password)){
           	 updateDoc.put("password",new KeyBean().getkeyBeanofStr(password).toLowerCase());
            }
            Doc whereDoc=new Doc();
            whereDoc.put("id",student_id);
            whereDoc.put("teacher_id",teacher_id);
            base.executeUpdateByDoc("bs_students",updateDoc,whereDoc);
            Logdb.WriteSysLog(AjaxXml.getParameterStr(request), "修改学生", teacherDoc.get("username"), teacherDoc.getIn("id"), ru.getIps(), 0, base);
            backjson.put("type", true);
            backjson.put("msg", "操作成功");
            return backjson;
        } catch (Exception e) {
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
     * 反馈问题
     * @param request
     * @return
     */
    public JSONObject feedBack(HttpServletRequest request){
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "派司德教育--反馈问题";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            Object teacher_id =request.getSession().getAttribute("teacher_id");
            Doc teacherDoc=base.executeQuery2Docs("select id,username from bs_teachers where id=? and isdel=0", new Object[]{teacher_id},1)[0];
            if(teacherDoc==null||teacherDoc.isEmpty()){
            	 backjson.put("type", false);
                 backjson.put("msg", "教师账号不存在");
                 return backjson;
            }
            int type=ru.getInt("type");
            String content=ru.getString("content");
            if(type!=1&&type!=2){
            	 backjson.put("type", false);
                 backjson.put("msg", "请选择您的反馈类型");
                 return backjson;
            }
            if(content==null||"".equals(content)){
            	 backjson.put("type", false);
                 backjson.put("msg", "请输入您要反馈的内容");
                 return backjson;
            }
            if(content.length()>500){
            	 backjson.put("type", false);
                 backjson.put("msg", "您的反馈内容大于500字，请尽量简短点");
                 return backjson;
            }
            Doc insertDoc=new Doc();
            insertDoc.put("type",type);
            insertDoc.put("teacher_id",teacher_id);
            insertDoc.put("content",content);
            insertDoc.put("add_time",AjaxXml.getTimestamp("now"));
            base.executeInsertByDoc("bs_sys_feedback",insertDoc);
            Logdb.WriteSysLog(AjaxXml.getParameterStr(request), "教师反馈", teacherDoc.get("username"), teacherDoc.getIn("id"), ru.getIps(), 0, base);
            backjson.put("type", true);
            backjson.put("msg", "操作成功");
            return backjson;
        } catch (Exception e) {
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
     * 教师忘记密码获取验证码
     * @param request
     * @return
     */
    public JSONObject getVerify(HttpServletRequest request){
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "派司德教育--教师忘记密码获取验证码";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            String email=ru.getString("email");
            if(email==null||"".equals(email)){
            	 backjson.put("type", false);
                 backjson.put("msg", "请输入您的预留电子邮箱");
                 return backjson;
            }else if(!AjaxXml.checkEmail(email)){
            	 backjson.put("type", false);
                 backjson.put("msg", "您输入的电子邮箱格式不正确");
                 return backjson;
            }
            Doc mdoc = base.executeQuery2Docs("select id from bs_teachers where email=? and isdel=0", new Object[]{email}, 1)[0];
            if (mdoc == null || mdoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "该邮箱未绑定账户");
                return backjson;
            }
            boolean send = false;
            String de_email_con_value = AjaxXml.Getrandom(6);
            SendEmail sw = new SendEmail();
            String subject = MimeUtility.encodeWord("派司德科技邮箱找回密码（此邮件回复无效）", "UTF-8", "Q");//标题
            sw.setSubject(subject);
            //内容
            String content = "您在派司德科技教育平台找回密码的邮箱验证码是:" + de_email_con_value;
            sw.setContent(content);
            String strFrom = AppConf.getconf().get("emailfrom");//发送的邮箱
            String smtp = AppConf.getconf().get("emailsmtp");//发送协议
            String user = AppConf.getconf().get("emailfrom");//发送的邮箱
            String epass = AppConf.getconf().get("emailpwd");//密码
            boolean smail = sw.sendMail_x(email, strFrom, smtp, user, epass);
            if (!smail) {
                backjson.put("type", false);
                backjson.put("msg", "邮件发送失败，请稍候再试");
                return backjson;
            }
            send = true;
            if (send) {
            	Doc insertDoc=new Doc();
            	insertDoc.put("teacher_id",mdoc.getIn("id"));
            	insertDoc.put("send_time",AjaxXml.getTimestamp("now"));
            	insertDoc.put("shou_mobile",email);
            	insertDoc.put("verify",de_email_con_value);
            	insertDoc.put("content",content);
            	insertDoc.put("create_time", AjaxXml.getTimestamp("now"));
            	insertDoc.put("type", 1);
            	base.executeInsertByDoc("bs_sms",insertDoc);
            	Logdb.WriteSysLog(AjaxXml.getParameterStr(request), "教师忘记密码获取验证码", "", 0, ru.getIps(), 0, base);
                backjson.put("type", true);
                backjson.put("msg", "邮件发送成功，请登录邮箱验证");
                return backjson;
            } else {
                backjson.put("type", false);
                backjson.put("msg", "邮件发送失败，请稍候再试");
                return backjson;
            }
        } catch (Exception e) {
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
     * 检查验证码是否正确
     * @param request
     * @return
     */
    public JSONObject checkVerify(HttpServletRequest request){
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "派司德教育--检查验证码是否正确";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
        	String verify=ru.getString("verify");
        	if(verify==null||"".equals(verify)){
        		 backjson.put("type", false);
                 backjson.put("msg", "请输入验证码");
                 return backjson;
        	}
        	Doc verifyDoc=base.executeQuery2Docs("select id,send_time,teacher_id from bs_sms where verify=? order by send_time desc limit 1",new Object[]{verify},1)[0];
        	if(verifyDoc==null||verifyDoc.isEmpty()){
        		 backjson.put("type", false);
                 backjson.put("msg", "验证码不正确");
                 return backjson;
        	}
            Logdb.WriteSysLog(AjaxXml.getParameterStr(request), "检查验证码是否正确", "", verifyDoc.getIn("teacher_id"), ru.getIps(), 0, base);
            backjson.put("type", true);
            backjson.put("msg", "验证正确");
            return backjson;
        } catch (Exception e) {
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
     * 忘记密码--重新设置密码
     * @param request
     * @return
     */
    public JSONObject setPass(HttpServletRequest request){
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "派司德教育--重新设置密码";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
        	String verify=ru.getString("verify");
        	String pass=ru.getString("pass");
        	String pass_comfirm=ru.getString("pass_comfirm");
        	Doc verifyDoc=base.executeQuery2Docs("select id,send_time,teacher_id from bs_sms where verify=? order by send_time desc limit 1",new Object[]{verify},1)[0];
        	if(verifyDoc==null||verifyDoc.isEmpty()){
        		 backjson.put("type", false);
                 backjson.put("msg", "验证码不正确");
                 return backjson;
        	}
        	if(pass==null||"".equals(pass)){
        		 backjson.put("type", false);
                 backjson.put("msg", "新密码未输入");
                 return backjson;
        	}
        	if(!pass.equals(pass_comfirm)){
        		 backjson.put("type", false);
                 backjson.put("msg", "两次输入密码不一致");
                 return backjson;
        	}
        	pass=new KeyBean().getkeyBeanofStr(pass).toLowerCase();
        	base.executeUpdate("update bs_teachers set password=? where id=? ",new Object[]{pass,verifyDoc.getIn("teacher_id")});
            Logdb.WriteSysLog(AjaxXml.getParameterStr(request), "重新设置密码","",verifyDoc.getIn("teacher_id"), ru.getIps(), 0, base);
            backjson.put("type", true);
            backjson.put("msg", "验证正确");
            return backjson;
        } catch (Exception e) {
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
     * 发起考试
     * @param request
     * @return
     */
    public JSONObject sendExamination(HttpServletRequest request){
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "派司德教育--发起考试";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            Object teacher_id =request.getSession().getAttribute("teacher_id");
            Doc teacherDoc=base.executeQuery2Docs("select id,username,course_flag from bs_teachers where id=? and isdel=0", new Object[]{teacher_id},1)[0];
            if(teacherDoc==null||teacherDoc.isEmpty()){
            	 backjson.put("type", false);
                 backjson.put("msg", "教师账号不存在");
                 return backjson;
            }
            int type=ru.getInt("type");
            int id=ru.getInt("id");
            String name=ru.getString("name");
            String end_time=ru.getString("end_time");
            if(name==null||"".equals(name)){
            	 backjson.put("type", false);
                 backjson.put("msg", "请输入考试名称");
                 return backjson;
            }
            if(end_time==null||"".equals(end_time)){
            	backjson.put("type", false);
                backjson.put("msg", "请选择考试截至时间");
                return backjson;
           }
            if(teacherDoc.get("course_flag")==null||"".equals(teacherDoc.get("course_flag"))){
            	 backjson.put("type", false);
                 backjson.put("msg", "您尚未购买该课程");
                 return backjson;
            }else if(!teacherDoc.get("course_flag").contains(id+"")){//简要判断
            	 backjson.put("type", false);
                 backjson.put("msg", "您尚未购买该课程");
                 return backjson;
            }
            StringBuffer buffer=new StringBuffer("");
            List<Doc> list=null;
            if(type==1){//按照课程考试
            	list=base.executeQuery2List("select id,type from bs_exercise_library where course_id=? and isdel=0 order by type asc ",new Object[]{id});
            	if(list==null||list.isEmpty()){
            		 backjson.put("type", false);
                     backjson.put("msg", "该课程尚未有试题，敬请期待");
                     return backjson;
            	}
            	int selectNum=0;//单选题数量，最多40道
            	int boxNum=0;//多选题数量，最多40道
            	int judgeNum=0;//选择题数量，最多偶20道
            	if(list.size()>=100){
            		for(Doc doc:list){
            			switch (doc.getIn("type")) {
    					case 0:
    						if(selectNum<40){
    							buffer.append(doc.getIn("id")+",");
    						}
    						break;
    					case 1:
    						if(boxNum<40){
    							buffer.append(doc.getIn("id")+",");
    						}
    						break;
    					case 2:
    						if(judgeNum<20){
    							buffer.append(doc.getIn("id")+",");
    						}
    						break;
    					}
            		}
            	}else{
            		for(Doc doc:list){//不够100道题目全选
    					buffer.append(doc.getIn("id")+",");
            		}
            	}
            }else{//按照章节考试
            	list=base.executeQuery2List("select id,type from bs_exercise_library where chapter_id=? and isdel=0 order by type asc ",new Object[]{id});
            	if(list==null||list.isEmpty()){
            		 backjson.put("type", false);
                     backjson.put("msg", "该课程尚未有试题，敬请期待");
                     return backjson;
            	}
            	for(Doc doc:list){//章节全选
					buffer.append(doc.getIn("id")+",");
        		}
            }
            //插入一个考试
            Doc insertDoc=new Doc();
            insertDoc.put("name",name);
            insertDoc.put("type",type);
            insertDoc.put("question",type);
            String  ids="";
            if(!buffer.equals("")){
            	ids=buffer.substring(0,buffer.length()-1);
            }else{
            	 backjson.put("type", false);
                 backjson.put("msg", "该课程尚未有试题，敬请期待");
                 return backjson;
            }
            insertDoc.put("question",ids);
            insertDoc.put("limit_time",type==0?60:40);
            insertDoc.put("end_time",AjaxXml.getTimestamp(end_time+" 23:59:59"));
            insertDoc.put("teacher_id",teacher_id);
            insertDoc.put("add_time",AjaxXml.getTimestamp("now"));
            base.executeInsertByDoc("bs_examination", insertDoc);
            Logdb.WriteSysLog(AjaxXml.getParameterStr(request), "发起考试",teacherDoc.get("username"),teacherDoc.getIn("id"), ru.getIps(), 0, base);
            backjson.put("type", true);
            backjson.put("msg", "发起成功");
            return backjson;
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest);
            backjson.put("type", false);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {
            dbc.closeConn();
        }
    }
    public static void main(String[] args) {
		StringBuffer buffer=new StringBuffer("1,2,3,4,5,6,");
		System.out.println(buffer.substring(0,buffer.length()-1));
	}
}
