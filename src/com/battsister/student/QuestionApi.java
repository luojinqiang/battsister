package com.battsister.student;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.Doc;
import com.baje.sz.util.RequestUtil;

import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by 78544 on 4/6/2016.
 */
public class QuestionApi {

    public JSONObject askQuestion(HttpServletRequest request){
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "派司德教育--学生提问";
        JSONObject backjson = new JSONObject();
        try {
            dbc.openConn();
            base.setDbc(dbc, false);
            String content = ru.getString("content").trim();
            int course_id = ru.getInt("course_id");
            int chapter_id = ru.getInt("chapter_id");
            Object student_id = request.getSession().getAttribute("student_id");
            Doc studentDoc = base.executeQuery2Docs("select teacher_id from bs_students where id=?", new Object[]{student_id}, 1)[0];
            if (studentDoc == null || studentDoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "学生信息不存在,请重新登录");
                return backjson;
            }
            base.executeInsertByDoc("bs_question", new Doc()
                    .put("content", content)
                    .put("course_id", course_id)
                    .put("chapter_id", chapter_id)
                    .put("teacher_id", studentDoc.get("teacher_id"))
                    .put("student_id", student_id)
                    .put("add_time", AjaxXml.getTimestamp("now")));
            base.commit();
            backjson.put("type", true);
            backjson.put("msg", "提问成功");
            return backjson;
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest + "\r\n ");
            backjson.put("type", false);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {
            dbc.closeConn();
        }
    }

    public JSONObject replyQuestion(HttpServletRequest request){
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "派司德教育--学生回复";
        JSONObject backjson = new JSONObject();
        try {
            dbc.openConn();
            base.setDbc(dbc, false);
            String content = ru.getString("content").trim();
            int question_id = ru.getInt("question_id");
            Object student_id = request.getSession().getAttribute("student_id");
            Doc studentDoc = base.executeQuery2Docs("select teacher_id from bs_students where id=?", new Object[]{student_id}, 1)[0];
            if (studentDoc == null || studentDoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "学生信息不存在,请重新登录");
                return backjson;
            }
            base.executeInsertByDoc("bs_question_reply", new Doc()
                    .put("content", content)
                    .put("question_id", question_id)
                    .put("teacher_id", studentDoc.get("teacher_id"))
                    .put("student_id", student_id)
                    .put("add_time", AjaxXml.getTimestamp("now"))
                    .put("reply_type", 0));
            base.commit();
            backjson.put("type", true);
            backjson.put("msg", "回复成功");
            return backjson;
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest + "\r\n ");
            backjson.put("type", false);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {
            dbc.closeConn();
        }
    }
    /**
     * 学生端--删除问题
     * @param request
     * @return
     */
    public JSONObject delQuestion(HttpServletRequest request){
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "派司德教育--学生端--删除问题";
        JSONObject backjson = new JSONObject();
        try {
            dbc.openConn();
            base.setDbc(dbc);
            Object student_id = request.getSession().getAttribute("student_id");
            Doc studentDoc = base.executeQuery2Docs("select teacher_id from bs_students where id=?", new Object[]{student_id}, 1)[0];
            if (studentDoc == null || studentDoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "学生信息不存在,请重新登录");
                return backjson;
            }
            int id=ru.getInt("id");
            base.executeUpdate("update bs_question set isdel=1 where id=? ",new Object[]{id});
            backjson.put("type", true);
            backjson.put("msg", "删除成功");
            return backjson;
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest + "\r\n ");
            backjson.put("type", false);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {
            dbc.closeConn();
        }
    }
}
