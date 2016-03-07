package com.battsister.admin.sys;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.Doc;
import com.baje.sz.util.RequestUtil;
import com.battsister.util.SetupUtil;

public class Keyword {
    /**
     * 关键字-编辑
     *
     * @param request
     * @param userid
     * @param username
     * @param gym_group_id
     * @param gym_id
     * @return
     */
    public JSONObject keywordEdit(HttpServletRequest request, int userid, String username) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        String ajaxRequest = "";
        String logtitle = "API-后台-关键字-添加";
        JSONObject backjson = new JSONObject();
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            RequestUtil ru = new RequestUtil(request);
            int id = ru.getInt("id");
            String keyword = ru.getString("keyword");
            String replace_word = ru.getString("replace_word");
            int key_type = ru.getInt("key_type");
            Doc gdoc = base.executeQuery2Docs("select id from bs_sys_keyword where keyword=? and isdel=0", new Object[]{keyword}, 1)[0];
            if (gdoc != null && !gdoc.isEmpty()) {
                if (id > 0) {
                    if (id != gdoc.getIn("id")) {
                        backjson.put("type", false);
                        backjson.put("msg", "关键字已经存在");
                        return backjson;
                    }
                } else {
                    backjson.put("type", false);
                    backjson.put("msg", "关键字已经存在");
                    return backjson;
                }
            }
            String sql = "insert into hy_sys_keyword(keyword,replace_word,key_type,add_time) values (?,?,?,?)";
            List sqllist = new ArrayList();
            sqllist.add(keyword);
            sqllist.add(replace_word);
            sqllist.add(new Integer(key_type));
            if (id > 0) {
                logtitle = "API-后台-关键字-编辑";
                sql = "update bs_sys_keyword set keyword=?,replace_word=?,key_type=? where id=?";
                sqllist.add(id);
            } else {
                sqllist.add(SetupUtil.getTimestamp(""));
            }
            base.executeUpdate(sql, sqllist);
            Logdb.WriteSysLog(ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
            base.commit();
            backjson.put("type", true);
            backjson.put("msg", "操作成功");
            return backjson;
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, logtitle);
            backjson.put("type", false);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {
            dbc.closeConn();
        }
    }
    /**
     * 判断关键字是否存在
     *
     * @param keyword
     * @param base
     * @return
     * @throws Exception
     */
    public static JSONObject checkKeyword(String keyword, Base base) throws Exception {
        JSONObject backjson = new JSONObject();
        if (keyword.equals("")) {
            backjson.put("type", false);
            backjson.put("keyword", "");
            backjson.put("replace_word", "");
            return backjson;
        }
        List list = base.executeQuery2List("select keyword,replace_word from bs_sys_keyword where  isdel=0", new Object[]{});
        if (list != null && !list.isEmpty()) {
            for (Iterator its = list.iterator(); its.hasNext(); ) {
                Doc doc = (Doc) its.next();
                if (keyword.indexOf(doc.get("keyword")) > -1) {
                    backjson.put("type", true);
                    backjson.put("keyword", doc.get("keyword"));
                    backjson.put("replace_word", doc.get("replace_word"));
                    return backjson;
                }
            }
        }
        backjson.put("type", false);
        backjson.put("keyword", "");
        backjson.put("replace_word", "");
        return backjson;
    }
    public static void main(String[] args) {
		System.out.println(AjaxXml.getTimestamp(""));
	}
}
