package com.battsister.model;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.util.Doc;
import com.baje.sz.util.RequestUtil;
import com.battsister.basic.BasicImp;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * Created by 78544 on 3/3/2016.
 */
public class Course extends BasicImp{
    {
        setTableName("bs_course");
    }

    private static RequestUtil ru = null;

    public JSONObject edit(HttpServletRequest request, int userid, String username) {
        ru = new RequestUtil(request);
        JSONObject backJson = new JSONObject();
        int id = ru.getInt("id");
        String name = ru.getString("name");
        Doc doc = new Doc();
        doc.put("name", name);
        doc.put("pic", ru.getString("pic"));
        doc.put("order_num", ru.getString("order_num"));
        doc.put("content", ru.getString("content"));
        doc.put("is_recommend", ru.getInt("is_recommend"));
        Doc whereDoc = new Doc(2);
        whereDoc.put("name", name);
        whereDoc.put("isdel", 0);
        JSONObject courseObj = queryByWhere(whereDoc);
        if (!courseObj.isEmpty()) {
            if (courseObj.getInt("id") != id) {
                backJson.put("type", false);
                backJson.put("msg", "该课程名称已经存在");
                return backJson;
            }
        }
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
