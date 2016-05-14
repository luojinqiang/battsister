package com.battsister.student;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.Doc;
import com.baje.sz.util.RequestUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by 78544 on 4/12/2016.
 */
public class ExaminationApi {

    public JSONObject saveTime(HttpServletRequest request) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "派司德教育--学生考试答题使用时间更新";
        JSONObject backjson = new JSONObject();
        try {
            dbc.openConn();
            base.setDbc(dbc, false);
            int examinationId = ru.getInt("examinationId");
            int time_use = ru.getInt("time_use");

            Object student_id = request.getSession().getAttribute("student_id");
            Doc studentDoc = base.executeQuery2Docs("select teacher_id from bs_students where id=?", new Object[]{student_id}, 1)[0];
            if (studentDoc == null || studentDoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "学生信息不存在,请重新登录");
                backjson.put("errorCode", -1);
                return backjson;
            }
            Doc answerDoc = base.executeQuery2Docs("select id,answer,is_commit,time_use from bs_examination_answer where examination_id=? and student_id=?", new Object[]{examinationId, student_id}, 1)[0];

            if (answerDoc == null || answerDoc.isEmpty()) {
                base.executeInsertByDoc("bs_examination_answer", new Doc()
                        .put("time_use", time_use)
                        .put("student_id", student_id)
                        .put("add_time", AjaxXml.getTimestamp("now"))
                        .put("examination_id", examinationId));
            } else {
                base.executeUpdateByDoc("bs_examination_answer",
                        new Doc().put("time_use", time_use),
                        new Doc().put("examination_id", examinationId).put("student_id", student_id));
            }
            base.commit();
            backjson.put("type", true);
            backjson.put("msg", "更新成功");
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


    public JSONObject answerExam(HttpServletRequest request) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "派司德教育--学生考试答题";
        JSONObject backjson = new JSONObject();
        try {
            dbc.openConn();
            base.setDbc(dbc, false);
            int examinationId = ru.getInt("examinationId");
            int qid = ru.getInt("qid");
            int type = ru.getInt("type");
            String aid = ru.getString("aid").trim();
            if ("".equals(aid)) {
                backjson.put("type", false);
                backjson.put("msg", "请选择答案");
                return backjson;
            }
            Object student_id = request.getSession().getAttribute("student_id");
            Doc studentDoc = base.executeQuery2Docs("select teacher_id from bs_students where id=?", new Object[]{student_id}, 1)[0];
            if (studentDoc == null || studentDoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "学生信息不存在,请重新登录");
                backjson.put("errorCode", -1);
                return backjson;
            }
            Doc examDoc = base.executeQuery2Docs("select id,option_array,type from bs_exercise_exam where id=? and isdel=0", new Object[]{qid}, 1)[0];
            if (examDoc == null || examDoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "试题不存在");
                return backjson;
            }
            Doc answerDoc = base.executeQuery2Docs("select id,answer,is_commit,time_use from bs_examination_answer where examination_id=? and student_id=?", new Object[]{examinationId, student_id}, 1)[0];

            JSONObject answerObj = new JSONObject();
            JSONArray optionIds = new JSONArray();
            String[] aids = aid.split(",");
            if (aid.split(",").length > 0) {
                for (String s : aids) {
                    optionIds.add(s);
                }
            }
            if (answerDoc == null || answerDoc.isEmpty()) {
                answerObj.put(qid, optionIds);
                base.executeInsertByDoc("bs_examination_answer", new Doc()
                        .put("answer", answerObj.toString())
                        .put("student_id", student_id)
                        .put("add_time", AjaxXml.getTimestamp("now"))
                        .put("examination_id", examinationId));
            } else {
                if (!"".equals(answerDoc.get("answer"))) {
                    answerObj = JSONObject.fromObject(answerDoc.get("answer"));
                }
                answerObj.put(qid, optionIds);
                base.executeUpdateByDoc("bs_examination_answer",
                        new Doc()
                                .put("answer", answerObj.toString())
                        , new Doc()
                                .put("examination_id", examinationId)
                                .put("student_id", student_id));

            }
            base.commit();
            backjson.put("type", true);
            backjson.put("msg", "答题成功");
            backjson.put("questionNum", answerObj.size());
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


    public JSONObject commitExam(HttpServletRequest request) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "派司德教育--学生交卷";
        JSONObject backjson = new JSONObject();
        try {
            dbc.openConn();
            base.setDbc(dbc, false);
            int examinationId = ru.getInt("examinationId");
            int time_use = ru.getInt("time_use");

            Object student_id = request.getSession().getAttribute("student_id");
            Doc studentDoc = base.executeQuery2Docs("select teacher_id from bs_students where id=?", new Object[]{student_id}, 1)[0];
            if (studentDoc == null || studentDoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "学生信息不存在,请重新登录");
                backjson.put("errorCode", -1);
                return backjson;
            }

            List<Doc> examList = base.executeQuery2List("select id,name,name_pic,type,option_array,answer,order_num,thoughts from bs_exercise_exam where examination_id=? and isdel=0 order by type asc", new Object[]{examinationId});
            if (examList == null || examList.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "试题不存在");
                return backjson;
            }

            Doc answerDoc = base.executeQuery2Docs("select id,answer,is_commit,time_use from bs_examination_answer where examination_id=? and student_id=?", new Object[]{examinationId, student_id}, 1)[0];
            if (answerDoc == null || answerDoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "请先作答");
                return backjson;
            }
            int isWrong = 0;
            int isRight = 0;
            JSONObject answerObj;
            boolean isOk;
            if (!"".equals(answerDoc.get("answer"))) {
                answerObj = JSONObject.fromObject(answerDoc.get("answer"));
                JSONArray examOptionArray;
                JSONArray myOptionArray;
                JSONObject optionObj;
                JSONArray examAnswerArray;
                for (Doc doc : examList) {
                    isOk = false;
                    if (doc.getIn("type") != 2) {
                        examAnswerArray = new JSONArray();
                        examOptionArray = JSONArray.fromObject(doc.get("option_array"));
                        for (Object o : examOptionArray) {
                            optionObj = JSONObject.fromObject(o);
                            if ("1".equals(optionObj.getString("is_answer"))) {
                                examAnswerArray.add(optionObj.getString("id"));
                            }
                        }
                        myOptionArray = answerObj.opt(doc.getString("id")) == null ? null : answerObj.getJSONArray(doc.getString("id"));
                        if (myOptionArray != null && myOptionArray.equals(examAnswerArray)) {
                            isOk = true;
                        } else {
                            isOk = false;
                        }
                    } else {
                        if (answerObj.opt(doc.getString("id")) != null) {
                            if (answerObj.getJSONArray(doc.getString("id")).contains(doc.getString("answer"))) {
                                isOk = true;
                            } else {
                                isOk = false;
                            }
                        } else {
                            isOk = false;
                        }
                    }
                    if (isOk) {
                        isRight++;
                    } else {
                        isWrong++;
                    }
                }
            } else {
                isWrong = examList.size();
            }


            base.executeUpdateByDoc("bs_examination_answer",
                    new Doc()
                            .put("is_wrong", isWrong)
                            .put("is_right", isRight)
                            .put("is_commit", 1)
                            .put("time_use", time_use)
                            .put("commit_time", AjaxXml.getTimestamp("now"))
                    , new Doc()
                            .put("examination_id", examinationId)
                            .put("student_id", student_id));
            base.commit();
            backjson.put("type", true);
            backjson.put("msg", "答题成功");
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

    public static void main(String[] args) {
        JSONArray a = new JSONArray();
        a.add("1");
        a.add("2");

        JSONArray b = new JSONArray();
        b.add("1");
        b.add("2");
        System.out.println(a.equals(b));
    }
}
