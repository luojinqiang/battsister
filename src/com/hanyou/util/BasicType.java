package com.hanyou.util;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.Doc;
import com.baje.sz.util.RequestUtil;
import com.baje.sz.util.StringUtil;
import com.hanyou.admin.sys.Logdb;
import com.qiniu.storage.UploadManager;
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
    public final static String myspace_url="http://7xouve.com1.z0.glb.clouddn.com/";//七牛myspace空间的域名，暂时只有后台在用
    public final static String space_name="myspace";//空间名
    public final static String pipeline_name="mps";//数据处理的专用队列名
    
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
  public static JSONObject delBasic(HttpServletRequest request, int userid, String username, int gym_group_id, int gym_id,String table,String logtitle){
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
          Logdb.WriteSysLog(gym_group_id, gym_id, ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
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
 public static JSONObject batchDelBasic(HttpServletRequest request, int userid, String username, int gym_group_id, int gym_id,String table,String logtitle){
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
         Logdb.WriteSysLog(gym_group_id, gym_id, ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
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
}

