package com.battsister.admin.sys;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.RequestUtil;

public class School {
	/**
	 * 学校新增编辑
	 * @param request
	 * @param userid
	 * @param username
	 * @return
	 */
	 public JSONObject editSchool(HttpServletRequest request, int userid, String username) {
	        Dbc dbc = DbcFactory.getBbsInstance();
	        Base base = new Base();
	        JSONObject backjson = new JSONObject();
	        String ajaxRequest = "";
	        String logtitle = "API--学校--增加";
	        try {
	            dbc.openConn("mysqlss");
	            base.setDbc(dbc);
	            ajaxRequest = AjaxXml.getParameterStr(request);
	            RequestUtil ru = new RequestUtil(request);
	            int id = ru.getInt("id");
	            String name=ru.getString("name");
	            String contact=ru.getString("contact");
	            String tel=ru.getString("tel");
	            String email=ru.getString("email");
	            String fax=ru.getString("fax");
	            String address=ru.getString("address");
	            String weburl=ru.getString("weburl");
	            String beizhu=ru.getString("beizhu");
	            List valueList = new ArrayList();
	            valueList.add(name);
	            valueList.add(address);
	            valueList.add(tel);
	            valueList.add(fax);
	            valueList.add(email);
	            valueList.add(contact);
	            valueList.add(beizhu);
	            valueList.add(weburl);
	            if (id > 0) {
	                logtitle = "API--学校--编辑";
	                valueList.add(id);
	                base.executeUpdate("update bs_schools set name=?,address=?,tel=?,fax=?,email=?,contact=?,beizhu=?,weburl=? where id=? ", valueList);
	            } else {
	                valueList.add(AjaxXml.getTimestamp("now"));
	                base.executeUpdate("insert into bs_schools (name,address,tel,fax,email,contact,beizhu,weburl,add_time) values(?,?,?,?,?,?,?,?,?)", valueList);
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
