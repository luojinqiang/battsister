package com.battsister.util;

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
import com.g.Tojpg.Pdf2Jpg;
import com.qiniu.common.QiniuException;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.FileListing;
import com.qiniu.util.Auth;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * 系统数据字典类
 *
 * @author cqf
 */
public class BasicType {

    /**
     * 管理员说的状态
     * hy_sys_user表的is_lock字段
     *
     * @param i
     * @return
     */
    private static UploadManager uploadManage = null;//七牛上传文件的主要对象，一般在一个应用中只需要一个

    public synchronized static UploadManager getUploadManage() {//获取七牛上传文件的对象
        if (uploadManage == null) {
            uploadManage = new UploadManager();
        }
        return uploadManage;
    }

    public final static String myspace_url = "http://7xrnsw.com2.z0.glb.qiniucdn.com/";//七牛myspace空间的域名，暂时只有后台在用
    public final static String space_name = "battsister";//空间名
    public final static String video_prefix = "video";//视频前缀
    public final static String animation_prefix = "animation";//动画前缀

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
     *
     * @param request
     * @param userid
     * @param username
     * @return
     */
    public static JSONObject delBasic(HttpServletRequest request, int userid, String username, String table, String logtitle) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc, false);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            int id = ru.getInt("id");
            Doc doc = base.executeQuery2Docs("select id from " + table + " where id=? and isdel=0", new Object[]{id}, 1)[0];
            if (doc == null || doc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "删除的对象不存在");
                return backjson;
            }
            base.executeUpdate("update " + table + " set isdel=1 where id=?", new Object[]{id});
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
     *
     * @param request
     * @param userid
     * @param username
     * @param table
     * @param logtitle
     * @return
     */
    public static JSONObject batchDelBasic(HttpServletRequest request, int userid, String username, String table, String logtitle) {
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
            base.executeUpdate("update " + table + " set isdel=1 where id in (" + wenhao + ")", sqllist);
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
     *
     * @param type
     * @return
     */
    public static JSONArray getQiNiuResourse(int type, String prefix) {
        if (prefix == null || "".equals(prefix.trim())) {
            prefix = type == 1 ? BasicType.video_prefix : BasicType.animation_prefix;
        }
        JSONArray resourceArray = new JSONArray();
        //获取七牛空间的文件
        BucketManager bucketManager = new BucketManager(getAuth());
        FileListing fileList = null;
        try {
            fileList = bucketManager.listFiles(BasicType.space_name, prefix, "", 200, "");
        } catch (QiniuException e) {
            LogUtility.log(e, "getQiNiuResourse is failure");
            return resourceArray;
        }
        if (fileList != null && fileList.items != null) {
            for (int i = 0; i < fileList.items.length; i++) {
                JSONObject json = new JSONObject();
                json.put("key", fileList.items[i].key);
                resourceArray.add(json);
            }
        }
        return resourceArray;
    }

    /**
     * 获取视频、动画资源文件（三级目录）
     *
     * @return
     */
    public static JSONObject getVideoAnimationFiles() {
        JSONObject backjson = new JSONObject();
        String filePath="E://battsisterProject//battsister//file";
        if("linux".equals(AppConf.getconf().get("servertype"))){
        	filePath=AppConf.getconf().get("filePath");
        }
        File fileDir = new File(AppConf.getconf().get("filePath"));
        if (!fileDir.exists()) {
            fileDir.mkdirs();
        }
        //获取该路径下的文件夹
        File[] CourseDirs = fileDir.listFiles();
        JSONArray courseDirArray=new JSONArray();
        if(CourseDirs!=null){
        	for(File courseDir:CourseDirs){
        		if(courseDir.isDirectory()){
        			JSONObject courseDirJson=new JSONObject();
        			courseDirJson.put("courseDirName",courseDir.getName());
        			File chapterDirs[]=courseDir.listFiles();
        			JSONArray chapterDirArray=new JSONArray();
        			if(chapterDirs!=null){
        				for(File chapterDir:chapterDirs){
        					if(chapterDir.isDirectory()){
        						JSONObject chapterDirJson=new JSONObject();
        						chapterDirJson.put("chapterDirName",chapterDir.getName());
        						File files[]=chapterDir.listFiles();
        						JSONArray fileArray=new JSONArray();
        						if(files!=null){
        							for(File file:files){
        								if(file.isFile()){
        									JSONObject fileJson=new JSONObject();
        									fileJson.put("fileName",file.getName());
        									fileJson.put("filePath","/file/"+courseDirJson.optString("courseDirName")+"/"
        									+chapterDirJson.optString("chapterDirName")+"/"+fileJson.optString("fileName"));
        									fileArray.add(fileJson);
        								}
        							}
        						}
        						chapterDirJson.put("fileArray", fileArray);
        						chapterDirArray.add(chapterDirJson);
        					}
        				}
        			}
        			courseDirJson.put("chapterDirArray", chapterDirArray);
        			courseDirArray.add(courseDirJson);//课程文件夹
        		}
        	}
        }
        backjson.put("type",true);
        backjson.put("courseDirArray", courseDirArray);
        return backjson;
   }
    /**
     * 获取视频，动画的路径
     *
     * @param key
     * @return
     */
    public static String getResoursePath(String key) {
        return BasicType.myspace_url + key;
    }

    /**
     * 获取选项
     *
     * @param i
     * @return
     */
    public static String getOption(int i) {
        String opt = "";
        switch (i) {
            case 0:
                opt = "A";
                break;
            case 1:
                opt = "B";
                break;
            case 2:
                opt = "C";
                break;
            case 3:
                opt = "D";
                break;
            case 4:
                opt = "E";
                break;
            case 5:
                opt = "F";
                break;
            case 6:
                opt = "G";
                break;
            case 7:
                opt = "H";
                break;
            case 8:
                opt = "I";
                break;
            case 9:
                opt = "J";
                break;
            case 10:
                opt = "K";
                break;
            default:
                opt = "";
                break;
        }
        return opt;
    }

    /**
     * 取得答题所用时间
     *
     * @param seconds
     * @return
     */
    public static String getAnswerTime(int seconds) {
        if (seconds <= 60) {
            return seconds + "秒";
        } else {
            if (seconds % 60 == 0) {
                return seconds / 60 + "分钟";
            } else {
                int min = seconds / 60;
                return min + "分钟" + (seconds - min * 60) + "秒";
            }
        }
    }

    /**
     * 获取七牛的凭证
     *
     * @return
     */
    public static Auth getAuth() {
        return Auth.create(AppConf.getconf().get("AccessKey"), AppConf.getconf().get("SecretKey"));
    }

    /**
     * 获取文档的路径
     *
     * @param dir
     * @return
     */
    public static String getWordPptPath(String dir, int i) {
        return "/document/images/" + dir + "/" + ("test-" + i) + "" + Pdf2Jpg.SUFF_IMAGE + "";
    }

    public static String getValueByKey(String jsonString, String key) {
        if (jsonString != null && !"".equals(jsonString)) {
            JSONObject json = JSONObject.fromObject(jsonString);
            if (json != null) {
                return json.optString(key);
            }
        }
        return "";
    }

    public static void main(String[] args) {
       System.out.println( getVideoAnimationFiles());
    }
}

