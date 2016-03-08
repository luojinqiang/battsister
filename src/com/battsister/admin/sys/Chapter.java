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
import com.baje.sz.util.StringUtil;

import net.sf.json.JSONObject;

public class Chapter {
	/**
	 * 新增/编辑章节
	 * @param request
	 * @param userid
	 * @param username
	 * @return
	 */
	public JSONObject editChapter(HttpServletRequest request, int userid, String username){
		  Dbc dbc = DbcFactory.getBbsInstance();
	        Base base = new Base();
	        JSONObject backjson = new JSONObject();
	        String ajaxRequest = "";
	        String logtitle = "API--新增章节";
	        try {
	            dbc.openConn("mysqlss");
	            base.setDbc(dbc);
	            ajaxRequest = AjaxXml.getParameterStr(request);
	            RequestUtil ru = new RequestUtil(request);
	            int id = ru.getInt("id");
	            int course_id=ru.getInt("course_id");
	            String chapter_name=ru.getString("chapter_name");
	            String desc=ru.getString("desc");
	            desc = AjaxXml.unescape(desc);
	            desc = StringUtil.replace(desc, "^…", "&");
	            int order_num=ru.getInt("order_num");
	            if(chapter_name==null||"".equals(chapter_name)){
	            	backjson.put("type", false);
	  	            backjson.put("msg", "请输入章节名称");
	  	            return backjson;
	            }
	            if(course_id<=0){
	            	backjson.put("type", false);
	  	            backjson.put("msg", "请选择章节所属课程");
	  	            return backjson;
	            }
	            List valueList=new ArrayList();
	            valueList.add(chapter_name);
	            valueList.add(course_id);
	            valueList.add(desc);
	            valueList.add(order_num);
	            if(id>0){
	            	logtitle = "API--编辑章节";
	            	valueList.add(id);
	            	base.executeUpdate("update bs_chapter set name=?,course_id=?,desc=?,order_num=? where id=? ", valueList);
	            }else{
	            	valueList.add(AjaxXml.getTimestamp("now"));
	            	base.executeUpdate("insert into bs_cooperation_unit (name,course_id,desc,order_num,add_time) values(?,?,?,?,?)", valueList);
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
