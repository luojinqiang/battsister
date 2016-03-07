package com.hanyou.basic;

import com.baje.sz.util.Doc;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.poi.ss.formula.functions.T;

import java.util.List;

/**
 *
 * Created by 78544 on 3/3/2016.
 */
public interface BasicInterface {

    int add(Doc doc);

    int updateByWhere(Doc columnDoc, Doc whereDoc);
    void updateById(Doc columnDoc, Object id);

    int deleteById(Object id);

    JSONObject queryById(Object id);

    JSONObject queryByWhere(Doc whereDoc);

    JSONArray queryArrayByWhere(Doc where);

    int queryCountByWhere(Doc whereDoc);
}
