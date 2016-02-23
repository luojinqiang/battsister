package com.hanyou.util;

import com.baje.sz.util.Doc;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by haihui on 2015-06-05.
 */
public class SleepBasicType {
    /**
     * 睡眠质量
     *
     * @param type
     * @return
     */
    public static String getSleepZhiliang(int type) {
        if (type == 1) {
            return "很好";
        } else if (type == 2) {
            return "好";
        } else if (type == 3) {
            return "一般";
        } else if (type == 4) {
            return "差";
        } else if (type == 5) {
            return "很差";
        } else {
            return "其他";
        }
    }

    /**
     * 睡眠质量列表
     *
     * @return
     */
    public static List getSleepZhiliangList() {
        List backlist = new ArrayList();
        try {
            for (int i = 1; i < 6; i++) {
                Doc doc = new Doc();
                doc.put("id", i);
                doc.put("classname", getSleepZhiliang(i));
                backlist.add(doc);
            }
            return backlist;
        } catch (Exception e) {
            com.baje.sz.ajax.LogUtility.log(e, "getSleepZhiliangList，查询LIST");
            return backlist;
        }

    }
}
