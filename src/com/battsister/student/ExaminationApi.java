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

/**
 * Created by 78544 on 4/12/2016.
 */
public class ExaminationApi {

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
            int time_use = ru.getInt("time_use");
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
                return backjson;
            }
            Doc examDoc = base.executeQuery2Docs("select id,option_array,type from bs_exercise_exam where id=? and isdel=0", new Object[]{qid}, 1)[0];
            if (examDoc == null || examDoc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "试题不存在");
                return backjson;
            }
            Doc answerDoc = base.executeQuery2Docs("select id,answer,is_commit,time_use from bs_examination_answer where examination_id=? and student_id=?", new Object[]{examinationId, student_id}, 1)[0];

            JSONArray answerArray = new JSONArray();
            JSONObject answerObj = new JSONObject();
            JSONArray array = new JSONArray();
            answerObj.put("exam_id", qid);
            answerObj.put("type", type);
            JSONArray option_array = JSONArray.fromObject(examDoc.get("option_array"));
            String[] aids = aid.split(",");
            if (option_array.size() > 0 && aid.split(",").length > 0) {
                JSONObject optionObj;
                for (Object object : option_array) {
                    optionObj = JSONObject.fromObject(object);
                    for (String s : aids) {
                        if (s.equals(optionObj.getString("id"))) {
                            array.add(optionObj);
                            break;
                        }
                    }
                }
                answerObj.put("option", array);
            }
            if (answerDoc == null || answerDoc.isEmpty()) {
                answerArray.add(answerObj);
                base.executeInsertByDoc("bs_examination_answer", new Doc()
                        .put("answer", answerArray.toString())
                        .put("time_use", time_use)
                        .put("student_id", student_id)
                        .put("add_time", AjaxXml.getTimestamp("now"))
                        .put("examination_id", examinationId));
            } else {
                answerArray = JSONArray.fromObject(answerDoc.get("answer"));
                //判断是否存在答过的，如果有将其修改
                answerArray.add(answerObj);
                base.executeUpdateByDoc("bs_examination_answer",
                        new Doc()
                                .put("answer", answerArray.toString())
                                .put("time_use", time_use)
                        , new Doc()
                                .put("examination_id", examinationId)
                                .put("student_id", student_id));

            }
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
}
