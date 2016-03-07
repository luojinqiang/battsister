package com.battsister.admin.sys;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.RequestUtil;

import net.sf.json.JSONObject;

public class Cooperation {
	/**
	 * 合作院校、企业新增/编辑
	 * @param request
	 * @param userid
	 * @param username
	 * @return
	 */
	public JSONObject editCooperation(HttpServletRequest request, int userid, String username){
		  Dbc dbc = DbcFactory.getBbsInstance();
	        Base base = new Base();
	        JSONObject backjson = new JSONObject();
	        String ajaxRequest = "";
	        String logtitle = "API--合作院校、企业--增加";
	        try {
	            dbc.openConn("mysqlss");
	            base.setDbc(dbc);
	            ajaxRequest = AjaxXml.getParameterStr(request);
	            RequestUtil ru = new RequestUtil(request);
	            int id = ru.getInt("id");
	            String name=ru.getString("name");
	            String weburl=ru.getString("weburl");
	            int type=ru.getInt("type");
	            String pic=ru.getString("pic");
	            if(name==null||"".equals(name)){
	            	backjson.put("type", false);
	 	            backjson.put("msg", "请输入名称");
	 	            return backjson;
	            }
	            if(pic==null||"".equals(pic)){
	            	backjson.put("type", false);
	 	            backjson.put("msg", "请上传院校/企业logo图片");
	 	            return backjson;
	            }
	            List valueList=new ArrayList();
	            valueList.add(name);
	            valueList.add(weburl);
	            valueList.add(type);
	            valueList.add(pic);
	            if(id>0){
	            	logtitle = "API--合作院校、企业--编辑";
	            	valueList.add(id);
	            	base.executeUpdate("update bs_cooperation_unit set name=?,weburl=?,type=?,pic=? where id=? ", valueList);
	            }else{
	            	valueList.add(AjaxXml.getTimestamp("now"));
	            	base.executeUpdate("insert into bs_cooperation_unit (name,weburl,type,pic,create_time) values(?,?,?,?,?)", valueList);
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
