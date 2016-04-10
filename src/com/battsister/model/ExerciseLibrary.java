package com.battsister.model;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.util.Doc;
import com.baje.sz.util.RequestUtil;
import com.battsister.basic.BasicImp;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * Created by 78544 on 3/3/2016.
 */
public class ExerciseLibrary extends BasicImp{
    {
        setTableName("bs_exercise_library");
    }

    private static RequestUtil ru = null;

    public JSONObject edit(HttpServletRequest request, int userid, String username) {
        ru = new RequestUtil(request);
        JSONObject backJson = new JSONObject();
        int id = ru.getInt("id");
        int course_id = ru.getInt("course_id");
        int chapter_id = ru.getInt("chapter_id");
        int type = ru.getInt("type");
        String name = ru.getString("name");
        Doc whereDoc = new Doc(5);
        whereDoc.put("type", type);
        whereDoc.put("course_id", course_id);
        whereDoc.put("chapter_id", chapter_id);
        whereDoc.put("name", name);
        whereDoc.put("isdel", 0);
        JSONObject exerciseObj = queryByWhere(whereDoc);
        if (!exerciseObj.isEmpty()) {
            if (exerciseObj.getInt("id") != id) {
                backJson.put("type", false);
                backJson.put("msg", "该问题已经存在");
                return backJson;
            }
        }

        Doc doc = new Doc()
                .put("name", name)
                .put("name_pic", ru.getString("name_pic"))
                .put("order_num", ru.getInt("order_num"))
                .put("thoughts", ru.getString("thoughts"))
                .put("course_id", course_id)
                .put("chapter_id", chapter_id)
                .put("type", type)
                .put("answer", ru.getInt("answer"));
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

    public JSONArray getPageArray(int page, int pn, Doc whereDoc) {
        JSONArray array = queryPageByWhere(page, pn, whereDoc);
        if (!array.isEmpty()) {

        }
        return array;
    }
}
