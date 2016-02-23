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

@SuppressWarnings("unchecked")
public class News {


    public static String newsType(int i) {
        try {
            if (i == 1) {
                return "栏目文章";
            } else if (i == 2) {
                return "WEB产品";
            } else if (i == 3) {
                return "应用商品";//开发者上传的
            } else if (i == 4) {
                return "血压指导";
            } else if (i == 5) {
                return "血糖指导";
            } else if (i == 6) {
                return "安卓渠道版本";
            } else {
                return "";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

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
    public String editNews(HttpServletRequest request, int userid, String username, int gym_group_id, int gym_id) {
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
            //int waibao = ru.getInt("waibao_id");
            //if (waibao==0){
            //	waibao=waibao_id;
            //}
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
                //list.add(new Integer(waibao));
                //list.add(new Integer(AjaxXml.getid()));
            }
            base.executeUpdate(sql, list);
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


    /*
     * 应用商品是否下架
     * @param request
     * @param userid
     * @param username
     */
    public JSONObject isadded(HttpServletRequest request, int userid, String username, int gym_group_id, int gym_id) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "应用商品-下架设置";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc, false);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            int id = ru.getInt("id");
            int is_added = ru.getInt("is_added");
            Doc doc = base.executeQuery2Docs("select id,is_new,newstype from hy_shop where id=? and isdel=0", new Object[]{id}, 1)[0];
            if (doc == null || doc.isEmpty()) {
                backjson.put("type", false);
                backjson.put("msg", "应用商品不存在");
                return backjson;
            }
            base.executeUpdate("update hy_shop set is_added=? where id=?", new Object[]{is_added, id});
            Logdb.WriteSysLog(gym_group_id, gym_id, ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
            base.commit();
            /*自动推送boss
			 if(doc.getIn("is_new")>-1 && doc.getIn("news_status")==0){
				int boss_flag=2;////动作1：增加 2：修改 3：删除
				int status=0;//状态：0: 正常(有用)1: 申请2: 暂停(有用)3: 预注销4: 注销(有用)5:屏蔽
				if(is_added==0){
					status=0;
				}else{
					status=2;
				}
				Thread thread = new Thread(new BossApi(id, boss_flag, status));
				thread.start();
			}*/

            backjson.put("type", true);
            backjson.put("msg", "操作成功");
            return backjson;
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
            //LogUtility.log(e, logtitle);
            backjson.put("type", false);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
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
     * 批量删除图片
     *
     * @param request
     * @param waibao_id
     * @param loupan_id
     * @param userid
     * @param username
     * @return
     */
    public String delNewspic(HttpServletRequest request, int userid, String username, int gym_group_id, int gym_id) {
        Dbc dbc = DbcFactory.getRDbcInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "删除图片";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc, false);
            ajaxRequest = AjaxXml.getParameterStr(request);
            int logid = ru.getInt("id");
            int picid = ru.getInt("picid");
            String ss = " logid=?";
            List ulist = new ArrayList();
            if (logid == 0) {
                return "请选择要删除的图片$$err";
            }
            ulist.add(logid);
            if (picid > 0) {
                ss = ss + " and id=?";
                ulist.add(picid);
            }
            base.executeUpdate("update hy_news_upfile set isdel=1 where " + ss, ulist);
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
     * 记录读取新闻的用户
     *
     * @param request
     * @param waibao_id
     * @param loupan_id
     * @param userid
     * @param username
     * @return
     */
    public String readNews(HttpServletRequest request, int userid, String username, int gym_group_id, int gym_id) {
        Dbc dbc = DbcFactory.getRDbcInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        String ajaxRequest = "";
        String logtitle = "记录用户查看新闻";
        try {
            dbc.openConn();
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            int id = ru.getInt("id");
            base.executeUpdate("update xitong_news set readuser=CAST(readuser AS VARCHAR(8000))+? where id=?", new Object[]{userid + ",", id});
            return "OK";
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
    public JSONObject delNews(HttpServletRequest request, int userid, String username, int gym_group_id, int gym_id) {
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
    public String batchDelNews(HttpServletRequest request, int userid, String username, int gym_group_id, int gym_id) {
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
