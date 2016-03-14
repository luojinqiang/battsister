package com.battsister.util;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.tools.ant.types.FileList;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.AppConf;
import com.baje.sz.util.Doc;
import com.baje.sz.util.RequestUtil;
import com.baje.sz.util.StringUtil;
import com.battsister.admin.sys.Logdb;
import com.qiniu.common.QiniuException;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.FileListing;
import com.qiniu.util.Auth;
/**
 * 系统数据字典类
 *
 * @author xhq-pc
 */
public class BasicType {

    /**
     * 管理员说的状态
     * hy_sys_user表的is_lock字段
     *
     * @param i
     * @return
     */
    private static UploadManager uploadManage=null;//七牛上传文件的主要对象，一般在一个应用中只需要一个
    public synchronized static UploadManager getUploadManage() {//获取七牛上传文件的对象
    	if(uploadManage==null){
    		uploadManage=new UploadManager();
    	}
		return uploadManage;
	}
    public final static String myspace_url="http://7xrnsw.com2.z0.glb.qiniucdn.com/";//七牛myspace空间的域名，暂时只有后台在用
    public final static String space_name="battsister";//空间名
    public final static String video_prefix="video";//视频前缀
    public final static String animation_prefix="animation";//动画前缀
    public static String getSysUserLock(int i) {
        if (i == 1) {
            return "锁定";
        } else if (i == 0) {
            return "正常";
        } else {
            return "";
        }
    }

    /**
     * 日志类型
     * hy_sys_log表的log_type
     *
     * @param i
     * @return
     */
    public static String getSysLogType(int i) {
        if (i == 0) {
            return "管理后台日志";
        } else {
            return "";
        }
    }

    /**
     * 系统关键字类型
     *
     * @param i
     * @return
     */
    public static String getKeywordType(int i) {
        if (i == 0) {
            return "不能出现";
        } else if (i == 1) {
            return "替换字符";
        } else {
            return "";
        }
    }
    
    /**
     * 删除的Basic方法
     * @param request
     * @param userid
     * @param username
     * @param gym_group_id
     * @param gym_id
     * @return
     */
  public static JSONObject delBasic(HttpServletRequest request, int userid, String username,String table,String logtitle){
      Dbc dbc = DbcFactory.getBbsInstance();
      Base base = new Base();
      JSONObject backjson = new JSONObject();
      String ajaxRequest = "";
      try {
          dbc.openConn("mysqlss");
          base.setDbc(dbc, false);
          ajaxRequest = AjaxXml.getParameterStr(request);
          RequestUtil ru = new RequestUtil(request);
          int id=ru.getInt("id");
          Doc doc = base.executeQuery2Docs("select id from "+table+" where id=? and isdel=0", new Object[]{id}, 1)[0];
          if (doc == null || doc.isEmpty()) {
              backjson.put("type", false);
              backjson.put("msg", "删除的对象不存在");
              return backjson;
          }
          base.executeUpdate("update "+table+" set isdel=1 where id=?", new Object[]{id});
          Logdb.WriteSysLog(ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
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
   * 批量删除的basic方法
   * @param request
   * @param userid
   * @param username
   * @param gym_group_id
   * @param gym_id
   * @param table
   * @param id
   * @param logtitle
   * @return
   */
 public static JSONObject batchDelBasic(HttpServletRequest request, int userid, String username,String table,String logtitle){
	 Dbc dbc = DbcFactory.getBbsInstance();
     Base base = new Base();
     JSONObject backjson = new JSONObject();
     String ajaxRequest = "";
     try {
         dbc.openConn("mysqlss");
         base.setDbc(dbc, false);
         ajaxRequest = AjaxXml.getParameterStr(request);
         RequestUtil ru = new RequestUtil(request);
         String idstr = ru.getString("ids");
         StringBuffer wenhao = new StringBuffer();
         List sqllist = new ArrayList();
         String[] idArr = StringUtil.strs2array(idstr, ",");
         if (idArr.length <= 0) {
             backjson.put("type", false);
             backjson.put("msg", "请选择要删除的对象");
             return backjson;
         }
         for (int i = 0; i < idArr.length; i++) {
             if (i == 0) {
                 wenhao.append("?");
             } else {
                 wenhao.append(",?");
             }
             sqllist.add(idArr[i]);
         }
         base.executeUpdate("update "+table+" set isdel=1 where id in (" + wenhao + ")", sqllist);
         Logdb.WriteSysLog(ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
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
  * 获取七牛空间的资源列表，1是获取视频，2是获取图片
  * @param type
  * @return
  */
 public static JSONArray getQiNiuResourse(int type,String prefix){
	 	if(prefix==null||"".equals(prefix.trim())){
	 		prefix=type==1?BasicType.video_prefix:BasicType.animation_prefix;
	 	}
	 	JSONArray resourceArray=new JSONArray();
	 	//获取七牛空间的文件
	    BucketManager bucketManager=new BucketManager(getAuth());
	    FileListing fileList=null;
		try {
			fileList = bucketManager.listFiles(BasicType.space_name,prefix, "", 200, "");
		} catch (QiniuException e) {
			LogUtility.log(e,"getQiNiuResourse is failure");
			return resourceArray;
		}
	    if(fileList!=null&&fileList.items!=null){
	    	for(int i=0;i<fileList.items.length;i++){
	    		JSONObject json=new JSONObject();
	    		json.put("key", fileList.items[i].key);
	    		resourceArray.add(json);
	    	}
	    }
	 return resourceArray;
 }
 
 /**
  * 获取七牛的凭证
  * @return
  */
 public static Auth getAuth(){
	 return Auth.create(AppConf.getconf().get("AccessKey"),AppConf.getconf().get("SecretKey"));
 }
 
 public static void main(String[] args) {
	JSONArray array=new JSONArray();
	JSONObject json=new JSONObject();
	json.put("little_chapter_id",12);
	json.put("add_time", "1422199009");
	array.add(json);
	System.out.println(array);
	/**
	 * [{"curse_id":"123","chapters":[{"chapter_id":"123","add_time":"1456751564"}]}]
	 */
	
 }
}

