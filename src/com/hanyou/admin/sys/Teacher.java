package com.hanyou.admin.sys;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.KeyBean;
import com.baje.sz.util.RequestUtil;

public class Teacher {
    /**
     * 会员编辑增加
     * @param request
     * @param userid
     * @param username
     * @param gym_group_id
     * @param gym_id
     * @return
     */
    public JSONObject editTeacher(HttpServletRequest request, int userid, String username) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "API--教师账号--增加";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            int id = ru.getInt("id");
            String user_name=ru.getString("username");
            String name=ru.getString("name");
            String account_status=ru.getString("account_status");
            int sex=ru.getInt("sex");
            String birth=ru.getString("birth");
            int birthTemp=0;
            if(birth!=null&&!"".equals(birth)){
            	birthTemp=AjaxXml.getTimestamp(birth+" 00:00:00");
            }
            String headpic=ru.getString("headpic");
            String password=ru.getString("password");
            String password1=ru.getString("password1");
            List valueList = new ArrayList();
            valueList.add(user_name);
            valueList.add(name);
            valueList.add(account_status);
            valueList.add(sex);
            valueList.add(birthTemp);
            valueList.add(headpic);
            String addString="";
            String insertString="";
            String insertSql="";
            if(password!=null&&!"".equals(password)){
            	if(!password.equals(password1)){
            		 backjson.put("type",false);
                     backjson.put("msg", "两次密码输入不一致");
                     return backjson;
            	}else{
            		addString=",password=? ";
            		insertString=",?";
            		insertSql=",password";
            		password= new KeyBean().getkeyBeanofStr(password).toLowerCase();
            		valueList.add(password);
            	}
            }
            if (id > 0) {
                logtitle = "API--教师账号--编辑";
                valueList.add(id);
                base.executeUpdate("update bs_teachers set username=?,name=?,account_status=?,sex=?,birth=?,headpic=?"+addString+" where id=? ", valueList);
            } else {
                valueList.add(AjaxXml.getTimestamp("now"));
                base.executeUpdate("insert into bs_teachers (username,name,account_status,sex,"
                        + " birth,headpic"+insertSql+",addtime) values(?,?,?,?,?,?"+insertString+",?)", valueList);
            }
            Logdb.WriteSysLog(ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
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
}
