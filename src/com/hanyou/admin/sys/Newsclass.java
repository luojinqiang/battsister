package com.hanyou.admin.sys;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.AppConf;
import com.baje.sz.util.DateUtil;
import com.baje.sz.util.Doc;
import com.baje.sz.util.FileUtil;
import com.baje.sz.util.KeyBean;
import com.baje.sz.util.MD5;
import com.baje.sz.util.RequestUtil;
import com.baje.sz.util.Selectic;
import com.baje.sz.util.StringUtil;
import com.baje.sz.util.TemplateUtil;
import com.hanyou.util.SetupUtil;

@SuppressWarnings("unchecked")
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
    public String editNews(HttpServletRequest request, int userid, String username) {
        Dbc dbc = DbcFactory.getRDbcInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "添加新闻栏目";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc, false);
            ajaxRequest = AjaxXml.getParameterStr(request);
            int id = ru.getInt("id");
            int idtype = ru.getInt("idtype");
            int waibao = ru.getInt("waibao_id");
            int parentid = ru.getInt("parentid");
            String classname = ru.getString("classname").trim();
            String classename = ru.getString("classename").trim();
            String readme = ru.getString("readme").trim();
            String keyword = ru.getString("keyword").trim();
            String templet = ru.getString("templet").trim();
            String savepath = ru.getString("savepath").trim();
            String picpath = ru.getString("pic_url_column").trim();
            String htmlpage = ru.getString("htmlpage").trim();
            String otherhtml = ru.getString("otherhtml").trim();
            String content = ru.getString("contents").trim();
            String classnavicontent = ru.getString("classnavicontent").trim();
            int lanmuid = AjaxXml.getid();
            int ordernum = ru.getInt("ordernum");
            if (classname.equals("")) {
                return "请输入栏目标题$$err";
            }
            String sql = "insert into hy_news_class (classname,classename," +
                    "readme,keyword,templet,savepath,picpath,htmlpage," +
                    "otherhtml,content,classnavicontent,ordernum,previd,nextid,idtype,parentid,parentpath,depth,rootid,child,addtime,id) values (?,?,?,?,?,?,?,?," +
                    "?,?,?,?,?,?,?,?,?," +
                    "?,?,?,?,?)";
            List list = new ArrayList();
            list.add(classname);
            list.add(classename);

            list.add(readme);
            list.add(keyword);
            list.add(templet);
            list.add(savepath);
            list.add(picpath);
            list.add(htmlpage);
            list.add(otherhtml);
            list.add(content);
            list.add(classnavicontent);
            list.add(ordernum);
            if (id > 0) {
                sql = "update hy_news_class set classname=?,classename=?,readme=?,keyword=?," +
                        "templet=?,savepath=?,picpath=?,htmlpage=?,otherhtml=?,content=?,classnavicontent=?,ordernum=? where id=?";

                list.add(new Integer(id));
                lanmuid = id;
                logtitle = "编辑新闻栏目";
            } else {
                list.add(0);
                list.add(0);
                list.add(idtype);
                list.add(parentid);
                list.add("");
                list.add(0);
                list.add(0);
                list.add(0);

                list.add(AjaxXml.getTimestamp("now"));

                list.add(new Integer(lanmuid));

            }
            //System.out.println(sql);
            //System.out.println(list);

            base.executeUpdate(sql, list);

            if (classnavicontent.length() > 20) {
                FileUtil.writeByString(AppConf.getconf().get("VMpath") + "/web/" + waibao + "/" + lanmuid + ".vm", classnavicontent);
            }

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
     * 删除信息栏目
     *
     * @param request
     * @param userid
     * @param username
     * @param gym_group_id
     * @param gym_id
     * @return
     */
    public JSONObject delNewsClass(HttpServletRequest request, int userid, String username) {
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
            Doc doc = base.executeQuery2Docs("select id from hy_news_class where id=? and isdel=0", new Object[]{id}, 1)[0];
            if (doc == null || doc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "该news不存在");
                return backjson;
            }

            base.executeUpdate("update hy_news_class set isdel=1 where id=?", new Object[]{id});
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
    public String batchDelNewsClass(HttpServletRequest request, int userid, String username) {
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
            base.executeUpdate("delete from hy_news_class where id in (" + wenhao.toString() + ")", ulist);
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
