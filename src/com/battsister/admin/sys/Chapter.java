package com.battsister.admin.sys;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.Doc;
import com.baje.sz.util.RequestUtil;
import com.baje.sz.util.StringUtil;
import com.battsister.model.Course;
import com.battsister.util.SetupUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.List;

public class Chapter {
    /**
     * 新增/编辑章节
     *
     * @param request
     * @param userid
     * @param username
     * @return
     */
    public JSONObject editChapter(HttpServletRequest request, int userid, String username) {
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
            int course_id = ru.getInt("course_id");
            String chapter_name = ru.getString("chapter_name");
            String content = ru.getString("content", "");
            content = AjaxXml.unescape(content);
            content = StringUtil.replace(content, "^…", "&");
            int order_num = ru.getInt("order_num");
            if (chapter_name == null || "".equals(chapter_name)) {
                backjson.put("type", false);
                backjson.put("msg", "请输入章节名称");
                return backjson;
            }
            if (course_id <= 0) {
                backjson.put("type", false);
                backjson.put("msg", "章节所属课程不存在");
                return backjson;
            }
            List valueList = new ArrayList();
            valueList.add(chapter_name);
            valueList.add(course_id);
            valueList.add(content);
            valueList.add(order_num);
            if (id > 0) {
                logtitle = "API--编辑章节";
                valueList.add(id);
                base.executeUpdate("update bs_chapter set name=?,course_id=?,content=?,order_num=? where id=? ", valueList);
            } else {
                valueList.add(AjaxXml.getTimestamp("now"));
                base.executeUpdate("insert into bs_chapter (name,course_id,content,order_num,add_time) values(?,?,?,?,?)", valueList);
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
     * 编辑ppt
     *
     * @param request
     * @param userid
     * @param username
     * @return
     */
    public JSONObject editPPT(HttpServletRequest request, int userid, String username) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "API--编辑ppt";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            int id = ru.getInt("id");
            Doc chapterDoc = base.executeQuery2Docs("select id from bs_chapter where id=? and isdel=0", new Object[]{id}, 1)[0];
            if (chapterDoc == null || chapterDoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "章节不存在");
                return backjson;
            }
            String title_str = ru.getString("title_str");
            String pic_str = ru.getString("pic_str");
            String num_str = ru.getString("num_str");
            String order_str=ru.getString("order_str");
            String titles[] = null;
            String pics[] = null;
            String nums[] = null;
            String order_nos[]=null;
            JSONArray pathArray = new JSONArray();
            if (pic_str != null) {
                pics = pic_str.split(",");
                if (title_str != null) {
                    titles = title_str.split(",");
                }
                if (num_str != null) {
                    nums = num_str.split(",");
                }
                if(order_str!=null){
                	order_nos = order_str.split(",");
                }
                if (pics != null) {
                    for (int i = 0; i < pics.length; i++) {
                        JSONObject json = new JSONObject();
                        if (!"".equals(pics[i].trim())) {
                            json.put("pic_dir", pics[i].trim());
                            if (titles != null && titles.length > i) {
                                json.put("title", titles[i]);
                            } else {
                                json.put("title", "");
                            }
                            if (nums != null && nums.length > i) {
                                json.put("num", nums[i]);
                            } else {
                                json.put("num", 0);
                            }
                            if (order_nos != null && order_nos.length > i) {
                                json.put("order_no", order_nos[i]);
                            } else {
                                json.put("order_no", 0);
                            }
                            pathArray.add(json);
                        }
                    }
                }
            }
            pathArray=SetupUtil.sortJSONArray(pathArray,"order_no", 2);
            base.executeUpdate("update bs_chapter set ppt_path=? where id=? ", new Object[]{pathArray.toString(), id});
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
     * 编辑视频
     *
     * @param request
     * @param userid
     * @param username
     * @return
     */
    public JSONObject editVideo(HttpServletRequest request, int userid, String username) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "API--编辑视频";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            int id = ru.getInt("id");
            Doc chapterDoc = base.executeQuery2Docs("select id from bs_chapter where id=? and isdel=0", new Object[]{id}, 1)[0];
            if (chapterDoc == null || chapterDoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "章节不存在");
                return backjson;
            }
            String title_str = ru.getString("title_str");
            String filePath_str = ru.getString("filePath_str");
            String order_no_str = ru.getString("order_no_str");
            JSONArray filePath = Course.genFilePath(filePath_str, title_str, order_no_str);
            base.executeUpdate("update bs_chapter set video_path=? where id=? ", new Object[]{filePath.toString(), id});
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
     * 章节动画编辑
     *
     * @param request
     * @param userid
     * @param username
     * @return
     */
    public JSONObject editAnimation(HttpServletRequest request, int userid, String username) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "API--编辑动画";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            int id = ru.getInt("id");
            Doc chapterDoc = base.executeQuery2Docs("select id from bs_chapter where id=? and isdel=0", new Object[]{id}, 1)[0];
            if (chapterDoc == null || chapterDoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "章节不存在");
                return backjson;
            }
            String title_str = ru.getString("title_str");
            String filePath_str = ru.getString("filePath_str");
            String order_no_str = ru.getString("order_no_str");
            JSONArray filePath = Course.genFilePath(filePath_str, title_str, order_no_str);
            base.executeUpdate("update bs_chapter set animation_path=? where id=? ", new Object[]{filePath.toString(), id});
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
     * 编辑章节word
     *
     * @param request
     * @param userid
     * @param username
     * @return
     */
    public JSONObject editWord(HttpServletRequest request, int userid, String username) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "API--编辑word";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            int id = ru.getInt("id");
            Doc chapterDoc = base.executeQuery2Docs("select id from bs_chapter where id=? and isdel=0", new Object[]{id}, 1)[0];
            if (chapterDoc == null || chapterDoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "章节不存在");
                return backjson;
            }
            String title_str = ru.getString("title_str");
            String word_str = ru.getString("word_str");
            String num_str = ru.getString("num_str");
            String order_str=ru.getString("order_str");
            String titles[] = null;
            String pics[] = null;
            String nums[] = null;
            String order_nos[]=null;
            JSONArray pathArray = new JSONArray();
            if (word_str != null) {
                pics = word_str.split(",");
                if (title_str != null) {
                    titles = title_str.split(",");
                }
                if (num_str != null) {
                    nums = num_str.split(",");
                }
                if (order_str != null) {
                    order_nos = order_str.split(",");
                }
                if (pics != null) {
                    for (int i = 0; i < pics.length; i++) {
                        JSONObject json = new JSONObject();
                        if (!"".equals(pics[i].trim())) {
                            json.put("pic_dir", pics[i].trim());
                            if (titles != null && titles.length > i) {
                                json.put("title", titles[i]);
                            } else {
                                json.put("title", "");
                            }
                            if (nums != null && nums.length > i) {
                                json.put("num", nums[i]);
                            } else {
                                json.put("num", 0);
                            }
                            if (order_nos != null && order_nos.length > i) {
                                json.put("order_no", order_nos[i]);
                            } else {
                                json.put("order_no", 0);
                            }
                            pathArray.add(json);
                        }
                    }
                }
            }
            pathArray=SetupUtil.sortJSONArray(pathArray, "order_no",2);
            base.executeUpdate("update bs_chapter set word_path=? where id=? ", new Object[]{pathArray.toString(), id});
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
     * 编辑图片
     *
     * @param request
     * @param userid
     * @param username
     * @return
     */
    public JSONObject ediPic(HttpServletRequest request, int userid, String username) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "API--编辑图片";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            int id = ru.getInt("id");
            Doc chapterDoc = base.executeQuery2Docs("select id from bs_chapter where id=? and isdel=0", new Object[]{id}, 1)[0];
            if (chapterDoc == null || chapterDoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "章节不存在");
                return backjson;
            }
            String upload_pics = ru.getString("upload_pics");
            JSONArray pic_array = new JSONArray();
            if (upload_pics != null) {
                String ss[] = upload_pics.split(",");
                if (ss != null) {
                    for (int i = 0; i < ss.length && !"".equals(ss[i]); i++) {
                        pic_array.add(ss[i]);
                    }
                }
            }
            base.executeUpdate("update bs_chapter set pics=? where id=? ", new Object[]{pic_array.toString(), id});
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

    public static void main(String[] args) {
        System.out.println(AjaxXml.getTimestamp("now"));
    }
}
