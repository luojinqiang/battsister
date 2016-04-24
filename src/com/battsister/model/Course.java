package com.battsister.model;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.Doc;
import com.baje.sz.util.RequestUtil;
import com.baje.sz.util.StringUtil;
import com.battsister.admin.sys.Logdb;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * Created by 78544 on 3/3/2016.
 */
public class Course{

	/**
	 *  新增/编辑课程
	 * @param request
	 * @param userid
	 * @param username
	 * @return
	 */
    public JSONObject edit(HttpServletRequest request, int userid, String username) {
		  Dbc dbc = DbcFactory.getBbsInstance();
	        Base base = new Base();
	        JSONObject backjson = new JSONObject();
	        String ajaxRequest = "";
	        String logtitle = "API--新增课程";
	        try {
	            dbc.openConn("mysqlss");
	            base.setDbc(dbc);
	            ajaxRequest = AjaxXml.getParameterStr(request);
	            RequestUtil ru = new RequestUtil(request);
	            int id = ru.getInt("id");
	            String name=ru.getString("name");
	            String pic=ru.getString("pic");
	            String content=ru.getString("content");
	            content = AjaxXml.unescape(content);
	            content = StringUtil.replace(content, "^…", "&");
	            int is_recommend=ru.getInt("is_recommend");
	            int order_num=ru.getInt("order_num");
	            String introduce=ru.getString("introduce");
	            Doc updateDoc=new Doc();
	            updateDoc.put("name",name);
	            updateDoc.put("pic",pic);
	            updateDoc.put("content", content);
	            updateDoc.put("is_recommend", is_recommend);
	            updateDoc.put("order_num", order_num);
	            updateDoc.put("introduce",introduce);
	            if(id>0){
	            	logtitle="编辑课程";
	            	Doc whereDoc=new Doc();
	            	whereDoc.put("id",id);
	            	base.executeUpdateByDoc("bs_course",updateDoc, whereDoc);
	            }else{
	            	updateDoc.put("add_time",AjaxXml.getTimestamp("now"));
	            	base.executeInsertByDoc("bs_course",updateDoc);
	            }
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
     * 编辑课程实训文档
     * @param request
     * @param userid
     * @param username
     * @return
     */
    public JSONObject editPracticWord(HttpServletRequest request, int userid, String username) {
		  Dbc dbc = DbcFactory.getBbsInstance();
	        Base base = new Base();
	        JSONObject backjson = new JSONObject();
	        String ajaxRequest = "";
	        String logtitle = "API--编辑课程实训文档";
	        try {
	            dbc.openConn("mysqlss");
	            base.setDbc(dbc);
	            ajaxRequest = AjaxXml.getParameterStr(request);
	            RequestUtil ru = new RequestUtil(request);
	            int id = ru.getInt("id");
	            Doc courseDoc=base.executeQuery2Docs("select id from bs_course where id=? and isdel=0 ",new Object[]{id},1)[0];
	            if(courseDoc==null||courseDoc.isEmpty()){
	            	 backjson.put("type", false);
	 	            backjson.put("msg", "该课程不存在");
	 	            return backjson;
	            }
	            String[] dir=ru.getStrings("word_dir");
                String[] titles = ru.getStrings("title");
                JSONArray array = new JSONArray();
                JSONObject object;
				if (dir.length > 0) {
                    int i = 0;
					for (String s : dir) {
                        object = new JSONObject();
                        object.put("word_dir", s);
                        object.put("title", titles[i]);
                        array.add(object);
                        i ++;
					}
				}
	            base.executeUpdate("update bs_course set practical_word_path=? where id=? ",new Object[]{array.toString(),id});
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
     * 编辑视频
     * @param request
     * @param userid
     * @param username
     * @return
     */
    public JSONObject editVideo(HttpServletRequest request, int userid, String username){
		  Dbc dbc = DbcFactory.getBbsInstance();
	        Base base = new Base();
	        JSONObject backjson = new JSONObject();
	        String ajaxRequest = "";
	        String logtitle = "API--编辑实训视频";
	        try {
	            dbc.openConn("mysqlss");
	            base.setDbc(dbc);
	            ajaxRequest = AjaxXml.getParameterStr(request);
	            RequestUtil ru = new RequestUtil(request);
	            int id = ru.getInt("id");
	            Doc chapterDoc=base.executeQuery2Docs("select id from bs_course where id=? and isdel=0",new Object[]{id},1)[0];
	            if(chapterDoc==null||chapterDoc.isEmpty()){
	            	backjson.put("type", false);
	 	            backjson.put("msg", "该课程不存在");
	 	            return backjson;
	            }
	            String title_str=ru.getString("title_str");
	            String filePath_str=ru.getString("filePath_str");
	            String titles[]=null;
	            String filePaths[]=null;
	            JSONArray filePathArray=new JSONArray();
	            if(filePath_str!=null){
	            	filePaths=filePath_str.split(",");
	            	if(title_str!=null){
	            		titles=title_str.split(",");
	            	}
	            	if(filePaths!=null){
	            		for(int i=0;i<filePaths.length;i++){
	            			JSONObject json=new JSONObject();
	            			if(!"".equals(filePaths[i].trim())){
	            				json.put("filePath",filePaths[i].trim());
	            				if(titles!=null&&titles.length>i){
	            					json.put("title", titles[i]);
	            				}else{
	            					json.put("title","");
	            				}
	            				filePathArray.add(json);
	            			}
	            		}
	            	}
	            }
	            base.executeUpdate("update bs_course set practical_video_path=? where id=? ",new Object[]{filePathArray.toString(),id});
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
    * 课程--教学指南编辑
    * @param request
    * @return
    */
    public JSONObject editTeachingGuide(HttpServletRequest request, int userid, String username){
		  Dbc dbc = DbcFactory.getBbsInstance();
	        Base base = new Base();
	        JSONObject backjson = new JSONObject();
	        String ajaxRequest = "";
	        String logtitle = "API--课程--教学指南编辑";
	        try {
	            dbc.openConn("mysqlss");
	            base.setDbc(dbc);
	            ajaxRequest = AjaxXml.getParameterStr(request);
	            RequestUtil ru = new RequestUtil(request);
	            int id = ru.getInt("id");
	            Doc chapterDoc=base.executeQuery2Docs("select id from bs_course where id=? and isdel=0",new Object[]{id},1)[0];
	            if(chapterDoc==null||chapterDoc.isEmpty()){
	            	backjson.put("type", false);
	 	            backjson.put("msg", "课程不存在");
	 	            return backjson;
	            }
	            String title=ru.getString("title");
	            String word_dir=ru.getString("word_dir");
	            int num=ru.getInt("num");
	            JSONObject json=new JSONObject();
	            if(word_dir!=null&&!"".equals(word_dir)){
	            	json.put("title", title);
	 	            json.put("word_dir", word_dir);
	 	            json.put("num", num);
	            }
	            base.executeUpdate("update bs_course set teaching_guide=? where id=? ",new Object[]{json.toString(),id});
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
	 * 课程--学习指导编辑
	 * @param request
	 * @param userid
	 * @param username
     * @return
     */
	public JSONObject editLearningGuide(HttpServletRequest request, int userid, String username){
		Dbc dbc = DbcFactory.getBbsInstance();
		Base base = new Base();
		JSONObject backjson = new JSONObject();
		String ajaxRequest = "";
		String logtitle = "API--课程--学习指导编辑";
		try {
			dbc.openConn("mysqlss");
			base.setDbc(dbc);
			ajaxRequest = AjaxXml.getParameterStr(request);
			RequestUtil ru = new RequestUtil(request);
			int id = ru.getInt("id");
			Doc chapterDoc=base.executeQuery2Docs("select id from bs_course where id=? and isdel=0",new Object[]{id},1)[0];
			if(chapterDoc==null||chapterDoc.isEmpty()){
				backjson.put("type", false);
				backjson.put("msg", "课程不存在");
				return backjson;
			}
			String title=ru.getString("title");
			String word_dir=ru.getString("word_dir");
			int num=ru.getInt("num");
			JSONObject json=new JSONObject();
			if(word_dir!=null&&!"".equals(word_dir)){
				json.put("title", title);
				json.put("word_dir", word_dir);
				json.put("num", num);
			}
			base.executeUpdate("update bs_course set learning_guide=? where id=? ",new Object[]{json.toString(),id});
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
     * 课程--教案编辑
     * @param request
     * @param userid
     * @param username
     * @return
     */
    public JSONObject editTeachingPlan(HttpServletRequest request, int userid, String username){
		  Dbc dbc = DbcFactory.getBbsInstance();
	        Base base = new Base();
	        JSONObject backjson = new JSONObject();
	        String ajaxRequest = "";
	        String logtitle = "API--课程--教案编辑";
	        try {
	            dbc.openConn("mysqlss");
	            base.setDbc(dbc);
	            ajaxRequest = AjaxXml.getParameterStr(request);
	            RequestUtil ru = new RequestUtil(request);
	            int id = ru.getInt("id");
	            Doc chapterDoc=base.executeQuery2Docs("select id from bs_course where id=? and isdel=0",new Object[]{id},1)[0];
	            if(chapterDoc==null||chapterDoc.isEmpty()){
	            	backjson.put("type", false);
	 	            backjson.put("msg", "课程不存在");
	 	            return backjson;
	            }
	            String title=ru.getString("title");
	            String word_dir=ru.getString("word_dir");
	            int num=ru.getInt("num");
	            JSONObject json=new JSONObject();
	            if(word_dir!=null&&!"".equals(word_dir)){
	            	json.put("title", title);
	 	            json.put("word_dir", word_dir);
	 	            json.put("num", num);
	            }
	            base.executeUpdate("update bs_course set teaching_plan=? where id=? ",new Object[]{json.toString(),id});
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
     * 教学评价编辑
     * @param request
     * @param userid
     * @param username
     * @return
     */
    public JSONObject editTeachingEvalution(HttpServletRequest request, int userid, String username){
		  Dbc dbc = DbcFactory.getBbsInstance();
	        Base base = new Base();
	        JSONObject backjson = new JSONObject();
	        String ajaxRequest = "";
	        String logtitle = "API--课程--教学评价编辑";
	        try {
	            dbc.openConn("mysqlss");
	            base.setDbc(dbc);
	            ajaxRequest = AjaxXml.getParameterStr(request);
	            RequestUtil ru = new RequestUtil(request);
	            int id = ru.getInt("id");
	            Doc chapterDoc=base.executeQuery2Docs("select id from bs_course where id=? and isdel=0",new Object[]{id},1)[0];
	            if(chapterDoc==null||chapterDoc.isEmpty()){
	            	backjson.put("type", false);
	 	            backjson.put("msg", "课程不存在");
	 	            return backjson;
	            }
	            String title=ru.getString("title");
	            String word_dir=ru.getString("word_dir");
	            int num=ru.getInt("num");
	            JSONObject json=new JSONObject();
	            if(word_dir!=null&&!"".equals(word_dir)){
	            	json.put("title", title);
	 	            json.put("word_dir", word_dir);
	 	            json.put("num", num);
	            }
	            base.executeUpdate("update bs_course set teaching_evalution=? where id=? ",new Object[]{json.toString(),id});
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
