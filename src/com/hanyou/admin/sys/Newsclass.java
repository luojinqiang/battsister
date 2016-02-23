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
import com.hanyou.util.Vdb_List;

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
    public String editNews(HttpServletRequest request, int userid, String username, int gym_group_id, int gym_id) {
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
            //String content	= ru.getString("content").trim();
            //String content	= ru.getString("content").trim();
            int lanmuid = AjaxXml.getid();
            int ordernum = ru.getInt("ordernum");
            //int paixu=ru.getInt("paixu");
            //content=AjaxXml.unescape(content);
            if (classname.equals("")) {
                return "请输入栏目标题$$err";
            }
            //content=StringUtil.replace(content, "^…", "&");
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

            Logdb.WriteSysLog(gym_group_id, gym_id, ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
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
    public JSONObject delNewsClass(HttpServletRequest request, int userid, String username, int gym_group_id, int gym_id) {
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
            Logdb.WriteSysLog(gym_group_id, gym_id, ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
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
    public String batchDelNewsClass(HttpServletRequest request, int userid, String username, int gym_group_id, int gym_id) {
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
            Logdb.WriteSysLog(gym_group_id, gym_id, ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
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
     * 发布新闻
     *
     * @param request
     * @param waibao_id
     * @param loupan_id
     * @param userid
     * @param username
     * @return
     */
    public String htmlNews(HttpServletRequest request, int userid, String username, int gym_group_id, int gym_id) {
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "生成栏目";
        try {
            ajaxRequest = AjaxXml.getParameterStr(request);
            int ids = ru.getInt("id");
            if (ids == 0) {
                return "请选择要生成的栏目$$err";
            }
            String fanhui = fabuNewsclass(ids);
            //Log_db.WriteSysLog(ajaxRequest,logtitle,username,userid,ru.getIps(),waibao_id,loupan_id,base);
            //base.commit();
            return fanhui + "$$ok";
        } catch (Exception e) {
            //base.rollback();
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest + "\r\n ");
            return "操作出错$$err";
        }
    }


    public String fabuNewsclass(int id) {
        Selectic select = new Selectic();
        String ajaxRequest = "";
        String logtitle = "发布新闻栏目";
        try {


            Doc classnews = select.Get_Doc("id,classname,classename,ordernum,parentid,parentpath,readme,keyword," +
                            "templet,savepath,picpath,htmlpage,otherhtml,classnavicontent,content"
                    , " hy_news_class", " where id=" + id, "");
            if (classnews == null) {
                return "请输入栏目标题";
            }
            if (classnews.get("templet").equals("xx_moban.html") && classnews.get("classnavicontent").length() < 20) {
                return "栏目模版不存在";
            }
            if (classnews.get("savepath").equals("")) {
                //return "保存路径不存在";
            }
            if (classnews.get("htmlpage").equals("")) {
                return "保存文件名不存在";
            }

            int pn = 10;
            int count = 0;
            String gwherestr = "";


            String table = "hy_news";
            String wheres = "isdel=0 ";
            wheres = wheres + " and newsclass=" + id + "";
            if (classnews.get("readme").indexOf(",") > -1) {
                String[] redd = classnews.get("readme").split(",");
                if (redd[0].indexOf("pn=") > -1) {
                    String[] redds = redd[0].split("pn=");
                    pn = Integer.parseInt(redds[1]);
                }
                if (redd[1].indexOf("counts=") > -1) {
                    String[] redds = redd[1].split("counts=");
                    count = Integer.parseInt(redds[1]);
                }
                if (redd.length == 3) {
                    wheres = redd[2];
                }
            }

            String file = "id,newstitle,newsclass,markpic,paixu,createtime,content";
            String order = "order by createtime desc";
            String idd = "id";
            int counts = select.Get_count(idd, table, wheres, "");
            if (counts > count) {
                counts = count;
            }
            if (pn == 0) {
                pn = 1;
            }
            int totalpage = (counts / pn) + 1;

            if (counts % pn == 0) {
                totalpage = (counts / pn);
            }
            int pages = 1;
            for (int i = 1; i <= totalpage; i++) {
                List lists2 = new ArrayList();
                List list = select.Get_mssqlList(pages, pn, counts, table, wheres, file, order, idd, "");
                if (list == null || list.size() == 0) {

                } else {
                    // for (Iterator its = list.listIterator();its.hasNext();){
                    //		Doc doc = (Doc)its.next();
                    //doc.put("addtime",AjaxXml.Get_Date(doc.get("addtime"),"YY04-MM-DD"));
                    //System.out.println(doc.get("addtime"));
                    //		lists2.add(doc);
                    // }
                }


                CreatlanmuHtml_str(classnews, lists2, pages, counts, pn);
                pages = pages + 1;
            }
            //System.out.println(counts);
            if (counts == 0) {
                List aaa = new ArrayList();
                CreatlanmuHtml_str(classnews, aaa, pages, counts, pn);
            }


            return logtitle + "成功$$ok";
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest + "\r\n ");
            return "操作出错";
        }
    }


    public static String CreatlanmuHtml_str(Doc news, List lists, int pages, int counts, int pn) throws Exception {
        String tempStr = "";
        Doc otherhtml = new Doc();
        //System.out.println(news.get("otherhtml"));
        if (news.get("otherhtml") != null) {
            String[] otherhtmls = news.get("otherhtml").split("@;@");
            for (int i = 0; i < otherhtmls.length; i++) {
                if (otherhtmls[i].indexOf("@=@") > 0) {
                    otherhtml.put(otherhtmls[i].split("@=@")[0], otherhtmls[i].split("@=@")[1]);
                } else {
                    otherhtml.put("otherhtmls", otherhtmls[i]);
                }
            }
        }
        TemplateUtil tu = new TemplateUtil();
        Vdb_List db_list = new Vdb_List();
        DateUtil date = new DateUtil();
        db_list.Setclass(news.getIn("id"));
        db_list.Setclassname(news.get("classname"));

        //System.out.println("ss1");
        tu.put("db_list", db_list);
        tu.put("class", news);
        tu.put("otherhtml", otherhtml);
        //tu.put("Getzhuanti",GetzhuantiPage(news.getIn("id")));
        tu.put("nowdate", date.getCurTime());
        tu.put("newlist", lists);
        tu.put("counts", counts + "");
        tu.put("Lanmupages", GetlanmuPage(pages, 5, pn, counts, "", news.get("htmlpage") + "_{page}.html", news.get("classname")));
//int page,int m,int maxrows,int count,String target,String action,String title		
        //tu.setPath(AppConf.getconf().get("VMpath")+news.get("templet"));
        if (news.get("classnavicontent").length() > 20) {
            tu.setPath(AppConf.getconf().get("VMpath") + "/web/" + news.getIn("waibao_id") + "/" + news.get("id") + ".vm");
        } else {
            tu.setPath(AppConf.getconf().get("VMpath") + news.get("templet"));
        }
        //System.out.println(news.get("classnavicontent")+"ss2"+counts);
        tempStr = tu.generate("utf-8");
        try {
            if (counts == 0) {
                FileUtil.writeByString(AppConf.getconf().get("Filepath") + news.get("savepath") + "/" + news.get("htmlpage") + ".html", tempStr);
            } else {
                FileUtil.writeByString(AppConf.getconf().get("Filepath") + news.get("savepath") + "/" + news.get("htmlpage") + "_" + pages + ".html", tempStr);
            }
            if (pages == 1) {
                FileUtil.writeByString(AppConf.getconf().get("Filepath") + news.get("savepath") + "/" + news.get("htmlpage") + ".html", tempStr);
            }
            return "";
        } catch (Exception e) {
            e.printStackTrace();
            return "err.html";
        }

    }

    public static String GetlanmuPage(int page, int m, int maxrows, int count, String target, String action, String title) {
        StringBuffer tmpStr = new StringBuffer();
        //m=12;
        if (count == 0) {
            return "";
        }

        int p = 1;
        if (page == 0)
            page = 1;
        if (target.equals(""))
            target = "page1";
        int totalpage = (count / maxrows) + 1;

        if (count % maxrows == 0) {
            totalpage = (count / maxrows);
        }
        if (page > totalpage)
            page = totalpage;

        p = (page) / m;
        tmpStr.append("<div class=\"fenye\"><span class=\"break\">共" + count + "条记录</span>&nbsp;");

        if (page == 1) {
            tmpStr.append("<A HREF=\"" + action.replaceAll("\\{page\\}", "1") + "\" title=\"" + title + "\" class=\"first\">首</A>&nbsp;");
        } else {
            tmpStr.append("<A HREF=\"" + action.replaceAll("\\{page\\}", "1") + "\" title=\"" + title + "\" class=\"first\">首</A>&nbsp;");
        }
        if (p * m > 0) {
            tmpStr.append("<A HREF=\"" + action.replaceAll("\\{page\\}", String.valueOf(p * m)) + "\" title=\"上" + m + "页" + title + "\" class=\"next\">上" + m + "</A>&nbsp;");
        }
        int i = 0;
        for (i = p * m + 1; i < p * m + m; i++) {
            if (i == page) {
                tmpStr.append("<span class=\"this-page\">" + i + "</span>&nbsp;");
            } else {
                tmpStr.append("<A HREF=\"" + action.replaceAll("\\{page\\}", String.valueOf(i)) + "\" title=\"第" + i + "页" + title + "\">" + i + "</A>&nbsp;");
            }
            if (i >= totalpage) {
                break;
            }
        }
        if (i < totalpage) {
            tmpStr.append("<A HREF=\"" + action.replaceAll("\\{page\\}", String.valueOf(i)) + "\" title=\"下" + m + "页" + title + "\" class=\"next\">下" + m + "</A>&nbsp;");
        }
        if ((page == totalpage || totalpage == 0) && page > 1) {
            tmpStr.append("<span class=\"this-page\">尾</span>&nbsp;");
        } else {
            tmpStr.append("<A HREF='" + action.replaceAll("\\{page\\}", String.valueOf(totalpage)) + "' title=尾页" + title + " class=\"last\">尾</a>&nbsp;");
        }
        //tmpStr.append("</ul><input name=\""+target+"\" id=\""+target+"\" type=\"text\" class=\"input_but_p\" size=\"4\" />");
        //tmpStr.append("<input type=\"button\" name=\"submit\" value=\"跳转\" onclick=\"window.location.href='"+action+"' + document.getElementById('"+target+"').value + '';\"/>");
        tmpStr.append("</div>");
        return tmpStr.toString();
    }

    public static void main(String[] args) {
        // TODO 自动生成方法存根
        try {
            //System.out.println("xxx");
            //System.out.println(AppConf.getconf().get("privatekey"));
            //DesEncrypter des = new DesEncrypter(AppConf.getconf().get("privatekey"));
            //String UserNameDes = des.encrypt("111111");
            //System.out.println(UserNameDes);

            KeyBean m = new KeyBean();
            System.out.println(m.getkeyBeanofStr("dkw847329"));
            MD5 md5 = new MD5();
            System.out.println(md5.toDigest("action=logintoq&huserid=test0302&t=3user254f-7b26-49be-cc75-13cf2r084285"));

            if (md5.toDigest("orderid=123456&t=1a49a127f-7b26-49be-b575-13cf9b084285").equals("c0597afeba2d232b5bd833ba4e6be9f7")) {
                System.out.println("一样a");
            } else {
                System.out.println("不一样");
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
    }
}
