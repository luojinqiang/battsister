package com.battsister.admin.sys;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.Doc;
import com.baje.sz.util.RequestUtil;
import com.baje.sz.util.StringUtil;

public class InfoApi {
	
	/**
	 * 编辑首页banner图
	 * @param request
	 * @param userid
	 * @param username
	 * @return
	 */
	public JSONObject editBannerPics(HttpServletRequest request, int userid, String username){
		 Dbc dbc = DbcFactory.getBbsInstance();
	        Base base = new Base();
	        JSONObject backjson = new JSONObject();
	        String ajaxRequest = "";
	        String logtitle = "API--编辑首页banner图";
	        try {
	            dbc.openConn("mysqlss");
	            base.setDbc(dbc);
	            ajaxRequest = AjaxXml.getParameterStr(request);
	            RequestUtil ru = new RequestUtil(request);
	            String bigfile1=ru.getString("bigfile1");
	            String smallfile1=ru.getString("smallfile1");
	            String bigfile2=ru.getString("bigfile2");
	            String smallfile2=ru.getString("smallfile2");
	            String bigfile3=ru.getString("bigfile3");
	            String smallfile3=ru.getString("smallfile3");
	            String bigfile4=ru.getString("bigfile4");
	            String smallfile4=ru.getString("smallfile4");
	            if(bigfile1==null||"".equals(bigfile1)){
	            	backjson.put("type", false);
	  	            backjson.put("msg", "请上传第一张大图");
	  	            return backjson;
	            }
	            if(smallfile1==null||"".equals(smallfile1)){
	            	backjson.put("type", false);
	  	            backjson.put("msg", "请上传第一张小图");
	  	            return backjson;
	            }
	            if(bigfile2==null||"".equals(bigfile2)){
	            	backjson.put("type", false);
	  	            backjson.put("msg", "请上传第二张大图");
	  	            return backjson;
	            }
	            if(smallfile2==null||"".equals(smallfile2)){
	            	backjson.put("type", false);
	  	            backjson.put("msg", "请上传第二张小图");
	  	            return backjson;
	            }
	            if(bigfile3==null||"".equals(bigfile3)){
	            	backjson.put("type", false);
	  	            backjson.put("msg", "请上传第三张大图");
	  	            return backjson;
	            }if(smallfile3==null||"".equals(smallfile3)){
	            	backjson.put("type", false);
	  	            backjson.put("msg", "请上传第三张小图");
	  	            return backjson;
	            }if(bigfile4==null||"".equals(bigfile4)){
	            	backjson.put("type", false);
	  	            backjson.put("msg", "请上传第四张大图");
	  	            return backjson;
	            }
	            if(smallfile4==null||"".equals(smallfile4)){
	            	backjson.put("type", false);
	  	            backjson.put("msg", "请上传第四张小图");
	  	            return backjson;
	            }
	            JSONArray picArray=new JSONArray();
	            for(int i=1;i<=4;i++){
	            	JSONObject json=new JSONObject();
	            	json.put("pic",ru.getString("bigfile"+i));
	            	json.put("pic_lit",ru.getString("smallfile"+i));
	            	picArray.add(json);
	            }
	            Doc infoDoc=base.executeQuery2Docs("select id from bs_info limit 1",new Object[]{},1)[0];
	            if(infoDoc!=null&&!infoDoc.isEmpty()){
	            	base.executeUpdate("update bs_info set banner_pics=? where id=? ",new Object[]{picArray.toString(),infoDoc.getIn("id")});
	            }else{
	            	base.executeUpdate("insert into bs_info (banner_pics) values(?)", new Object[]{picArray.toString()});
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
	/**
	 * 编辑考试大纲、习题库介绍等
	 * @param request
	 * @param userid
	 * @param username
	 * @return
	 */
	public JSONObject editIntroduce(HttpServletRequest request, int userid, String username){
		 Dbc dbc = DbcFactory.getBbsInstance();
	        Base base = new Base();
	        JSONObject backjson = new JSONObject();
	        String ajaxRequest = "";
	        String logtitle = "API--编辑考试大纲、习题库介绍等";
	        try {
	            dbc.openConn("mysqlss");
	            base.setDbc(dbc);
	            ajaxRequest = AjaxXml.getParameterStr(request);
	            RequestUtil ru = new RequestUtil(request);
	            int type=ru.getInt("type");
	            String content = ru.getString("contentx").trim();
	            content = AjaxXml.unescape(content);
	            content = StringUtil.replace(content, "^…", "&");
	            Doc updateDoc=new Doc();
	            if(type==1){
	            	updateDoc.put("course_outline", content);
	            }else {
	            	updateDoc.put("exercises_introduce", content);
	            }
	            Doc whereDoc=new Doc();
	            Doc infoDoc=base.executeQuery2Docs("select id from bs_info limit 1",new Object[]{},1)[0];
	            if(infoDoc!=null&&!infoDoc.isEmpty()){
	            	whereDoc.put("id", infoDoc.getIn("id"));
	            	base.executeUpdateByDoc("bs_info", updateDoc, whereDoc);
	            }else{
	            	base.executeInsertByDoc("bs_info",updateDoc);;
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
