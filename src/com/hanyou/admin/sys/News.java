package com.hanyou.admin.sys;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;
import com.baje.sz.ajax.AjaxDate;
import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.Doc;
import com.baje.sz.util.KeyBean;
import com.baje.sz.util.MD5;
import com.baje.sz.util.RequestUtil;
import com.baje.sz.util.StringUtil;
import com.hanyou.util.SetupUtil;

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
    public String editNews(HttpServletRequest request, int userid, String username) {
        Dbc dbc = DbcFactory.getRDbcInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "添加新闻";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc, false);
            ajaxRequest = AjaxXml.getParameterStr(request);
            int id = ru.getInt("id");
            String newstitle = ru.getString("newstitle").trim();
            String content = ru.getString("contentx").trim();
            String keywords = ru.getString("keywords").trim();
            String bossname = ru.getString("bossname").trim();
            String smallfile = ru.getString("smallfile").trim();
            String bigfile = ru.getString("bigfile").trim();
            String templet = ru.getString("templet").trim();
            String savepath = ru.getString("savepath").trim();
            int newsclass = ru.getInt("newsclass");
            int ordernum = ru.getInt("ordernum");
            int newstype = ru.getInt("newstype");
            int fromtype = ru.getInt("fromtype");
            String urladdress = ru.getString("urladdress");
            String classnavicontent = ru.getString("classnavicontent");
            content = AjaxXml.unescape(content);
            if (newstitle.equals("")) {
                return "请输入标题和内容$$err";
            }
            content = StringUtil.replace(content, "^…", "&");
            //System.out.println("contents:"+content);
            String sql = "insert into hy_news (newstitle,content,newsclass," +
                    "smallfile,bigfile,ordernum,templet,savepath,newstype,keywords,bossname," +
                    "urladdress,classnavicontent,adduser,adduserid,addtime)" +
                    " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            List list = new ArrayList();
            list.add(newstitle);
            list.add(content);
            list.add(newsclass);
            list.add(smallfile);
            list.add(bigfile);
            list.add(ordernum);
            list.add(templet);
            list.add(savepath);
            list.add(newstype);
            list.add(keywords);
            list.add(bossname);
            list.add(urladdress);
            list.add(classnavicontent);
            if (id > 0) {
                sql = "update hy_news set newstitle=?,content=?,newsclass=?," +
                        "smallfile=?,bigfile=?,ordernum=?,templet=?,savepath=?,newstype=?,keywords=?," +
                        "bossname=?,urladdress=?,classnavicontent=? where id=?";
                list.add(id);
                logtitle = "编辑新闻";
            } else {
                list.add(username);
                list.add(userid);
                list.add(SetupUtil.getTimestamp(""));
            }
            base.executeUpdate(sql, list);
            Logdb.WriteSysLog(ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
            base.commit();
            return logtitle + "成功$$ok";
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest + "\r\n ");
            return "操作出错$$err";
        } finally {
            dbc.closeConn();
        }
    }



    /**
     * 批量删除新闻
     *
     * @param request
     * @param waibao_id
     * @param loupan_id
     * @param userid
     * @param username
     * @return
     */
    public String delNewsBatch(HttpServletRequest request, int userid, String username, int gym_group_id, int gym_id) {
        Dbc dbc = DbcFactory.getRDbcInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "删除新闻";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc, false);
            ajaxRequest = AjaxXml.getParameterStr(request);
            String ids = ru.getString("id");
            if (ids == null || ids.equals("")) {
                return "请选择要删除的新闻$$err";
            }
            String[] idarr = StringUtil.strs2array(ids, ",");
            StringBuffer wenhao = new StringBuffer();
            List ulist = new ArrayList();
            for (int i = 0; i < idarr.length; i++) {
                if (i == 0) {
                    wenhao.append("?");
                } else {
                    wenhao.append(",?");
                }
                ulist.add(new Integer(idarr[i]));
            }
            base.executeUpdate("update hy_news set isdel=1 where id in (" + wenhao.toString() + ")", ulist);
            Logdb.WriteSysLog(ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
            base.commit();
            return logtitle + "成功$$ok";
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest + "\r\n ");
            return "操作出错$$err";
        } finally {
            dbc.closeConn();
        }
    }
    //刪除news
    public JSONObject delNews(HttpServletRequest request, int userid, String username) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "news-删除";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc, false);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            int id = ru.getInt("id");
            Doc doc = base.executeQuery2Docs("select id from hy_news where id=? and isdel=0", new Object[]{id}, 1)[0];
            if (doc == null || doc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "该news不存在");
                return backjson;
            }

            base.executeUpdate("update hy_news set isdel=1 where id=?", new Object[]{id});
            Logdb.WriteSysLog(ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
            base.commit();
            backjson.put("type", true);
            backjson.put("msg", "删除成功");
            return backjson;
        } catch (Exception e) {
            base.rollback();
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
     * 批量删除信息栏目
     *
     * @param request
     * @param waibao_id
     * @param loupan_id
     * @param userid
     * @param username
     * @return
     */
    public String batchDelNews(HttpServletRequest request, int userid, String username) {
        Dbc dbc = DbcFactory.getRDbcInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "删除栏目";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc, false);
            ajaxRequest = AjaxXml.getParameterStr(request);
            String ids = ru.getString("id");
            if (ids == null || ids.equals("")) {
                return "请选择要删除的栏目$$err";
            }
            String[] idarr = StringUtil.strs2array(ids, ",");
            StringBuffer wenhao = new StringBuffer();
            List ulist = new ArrayList();
            for (int i = 0; i < idarr.length; i++) {
                if (i == 0) {
                    wenhao.append("?");
                } else {
                    wenhao.append(",?");
                }
                ulist.add(new Integer(idarr[i]));
            }
            base.executeUpdate("delete from hy_news where id in (" + wenhao.toString() + ")", ulist);
            Logdb.WriteSysLog(ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
            base.commit();
            return logtitle + "成功$$ok";
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest + "\r\n ");
            return "操作出错$$err";
        } finally {
            dbc.closeConn();
        }
    }
   
}
