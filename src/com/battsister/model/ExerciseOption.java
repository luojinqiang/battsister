package com.battsister.model;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.util.Doc;
import com.baje.sz.util.RequestUtil;
import com.battsister.basic.BasicImp;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * Created by 78544 on 3/10/2016.
 */
public class ExerciseOption extends BasicImp {
    {
        setTableName("bs_exercise_option");
    }

    private static RequestUtil ru = null;
    public JSONObject edit(HttpServletRequest request, int userid, String username) {
        ru = new RequestUtil(request);
        JSONObject backJson = new JSONObject();
        int id = ru.getInt("id");
        int course_id = ru.getInt("course_id");
        int chapter_id = ru.getInt("chapter_id");
        int elId = ru.getInt("elId");
        int type = ru.getInt("type");
        String name = ru.getString("name");
        /*Doc whereDoc = new Doc(5);
        whereDoc.put("exercise_library_id", elId);
        whereDoc.put("course_id", course_id);
        whereDoc.put("chapter_id", chapter_id);
        whereDoc.put("name", name);
        whereDoc.put("isdel", 0);
        JSONObject exerciseObj = queryByWhere(whereDoc);
        if (!exerciseObj.isEmpty()) {
            if (exerciseObj.getInt("id") != id) {
                backJson.put("type", false);
                backJson.put("msg", "该选项已经存在");
                return backJson;
            }
        }*/

        if (type == 0 && ru.getInt("is_answer") == 1) {
            Doc doc = new Doc();
            doc.put("is_answer", 0);
            Doc wdoc = new Doc();
            wdoc.put("isdel", 0);
            wdoc.put("exercise_library_id", elId);
            wdoc.put("course_id", course_id);
            wdoc.put("chapter_id", chapter_id);
            updateByWhere(doc, wdoc);
        }
        Doc doc = new Doc();
        doc.put("name", name);
        doc.put("exercise_library_id", elId);
        doc.put("pic", ru.getString("name_pic"));
        doc.put("order_num", ru.getInt("order_num"));
        doc.put("course_id", course_id);
        doc.put("chapter_id", chapter_id);
        doc.put("is_answer", ru.getInt("is_answer"));
        if (id == 0) {
            doc.put("add_time", AjaxXml.getTimestamp("now"));
            add(doc);
        } else {
            updateById(doc, id);
        }
        backJson.put("type", true);
        backJson.put("msg", "操作成功");
        return backJson;
    }
}
