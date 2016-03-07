package com.hanyou.model;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.util.Doc;
import com.baje.sz.util.RequestUtil;
import com.hanyou.basic.BasicImp;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * Created by 78544 on 3/3/2016.
 */
public class course extends BasicImp{
    {
        setTableName("course");
    }

    private static RequestUtil ru = null;

    private JSONObject edit(HttpServletRequest request, int userid , String username) {
        ru = new RequestUtil(request);
        int id = ru.getInt("id");
        Doc doc = new Doc();
        doc.put("name", ru.getString("name"));
        doc.put("pic", ru.getString("pic"));
        doc.put("order", ru.getString("order"));
        doc.put("content", ru.getString("content"));
        doc.put("is_recommend", ru.getInt("is_recommend"));
        if (id > 0) {
            doc.put("add_time", AjaxXml.getTimestamp("now"));
            add(doc);
        } else {
            updateById(doc, id);
        }
        return null;
    }
}
