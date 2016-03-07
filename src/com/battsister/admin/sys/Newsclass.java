package com.battsister.admin.sys;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.RequestUtil;
public class Newsclass {
    /**
     * 修改新闻栏目
     *
     * @param request
     * @param waibao_id
     * @param loupan_id
     * @param userid
     * @param username
     * @return
     */
    public JSONObject editNews(HttpServletRequest request, int userid, String username) {
        Dbc dbc = DbcFactory.getRDbcInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "API-添加新闻栏目";
        JSONObject backjson=new JSONObject();
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc, false);
            ajaxRequest = AjaxXml.getParameterStr(request);
            int id = ru.getInt("id");
            int parentid = ru.getInt("parentid");
            String classname = ru.getString("classname").trim();
            String classename = ru.getString("classename").trim();
            String keyword = ru.getString("keyword").trim();
            int ordernum = ru.getInt("ordernum");
            if (classname.equals("")) {
            	backjson.put("type",false);
            	backjson.put("msg","请输入栏目标题");
                return backjson;
            }
            String sql = "insert into bs_news_class (classname,classename," +
                    "keyword,ordernum,previd,nextid,parentid,depth,"
                    + "rootid,child,addtime) values (?,?,?,?,?,?,?," +
                    "?,?,?,?)";
            List list = new ArrayList();
            list.add(classname);
            list.add(classename);
            list.add(keyword);
            list.add(ordernum);
            if (id > 0) {
                sql = "update bs_news_class set classname=?,classename=?,keyword=?," +
                        "ordernum=? where id=?";

                list.add(new Integer(id));
                logtitle = "编辑新闻栏目";
            } else {
                list.add(0);
                list.add(0);
                list.add(parentid);
                list.add(0);
                list.add(0);
                list.add(0);
                list.add(AjaxXml.getTimestamp("now"));

            }
            base.executeUpdate(sql, list);
            Logdb.WriteSysLog(ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
            base.commit();
            backjson.put("type",true);
        	backjson.put("msg","操作成功");
            return backjson;
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest + "\r\n ");
            backjson.put("type",false);
        	backjson.put("msg","系统忙，请稍后重试");
            return backjson;
        } finally {
            dbc.closeConn();
        }
    }
}
