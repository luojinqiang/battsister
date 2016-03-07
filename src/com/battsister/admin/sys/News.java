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
import com.baje.sz.util.StringUtil;

public class News {
    /**
     * 新闻修改新闻
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
        JSONObject backjson=new JSONObject();
        String logtitle = "API-添加新闻";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            int id = ru.getInt("id");
            String newstitle = ru.getString("newstitle").trim();
            String content = ru.getString("contentx").trim();
            String keywords = ru.getString("keywords").trim();
            String bossname = ru.getString("bossname").trim();
            String smallfile = ru.getString("smallfile").trim();
            String bigfile = ru.getString("bigfile").trim();
            int newsclass = ru.getInt("newsclass");
            int ordernum = ru.getInt("ordernum");
            content = AjaxXml.unescape(content);
            if (newstitle.equals("")) {
            	backjson.put("type",false);
            	backjson.put("msg","请输入标题和内容");
                return backjson;
            }
            content = StringUtil.replace(content, "^…", "&");
            String sql = "insert into bs_news (newstitle,content,newsclass," +
                    "smallfile,bigfile,ordernum,keywords,bossname," +
                    "adduser,adduserid,addtime)" +
                    " values (?,?,?,?,?,?,?,?,?,?,?)";
            List list = new ArrayList();
            list.add(newstitle);
            list.add(content);
            list.add(newsclass);
            list.add(smallfile);
            list.add(bigfile);
            list.add(ordernum);
            list.add(keywords);
            list.add(bossname);
            if (id > 0) {
                sql = "update bs_news set newstitle=?,content=?,newsclass=?," +
                        "smallfile=?,bigfile=?,ordernum=?,keywords=?," +
                        "bossname=? where id=?";
                list.add(id);
                logtitle = "编辑新闻";
            } else {
                list.add(username);
                list.add(userid);
                list.add(AjaxXml.getTimestamp("now"));
            }
            base.executeUpdate(sql, list);
            Logdb.WriteSysLog(ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
            backjson.put("type",true);
        	backjson.put("msg","操作成功");
            return backjson;
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest + "\r\n ");
            backjson.put("type",false);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {
            dbc.closeConn();
        }
    }
}