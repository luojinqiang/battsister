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
import com.baje.sz.util.Doc;
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
            int is_top=ru.getInt("is_top");
            String note=ru.getString("note");
            content = AjaxXml.unescape(content);
            if (newstitle.equals("")) {
            	backjson.put("type",false);
            	backjson.put("msg","请输入标题和内容");
                return backjson;
            }
            if(note==null||"".equals(note)){
            	backjson.put("type",false);
            	backjson.put("msg","请输入新闻简介");
                return backjson;
            }else if(note.length()>50){
            	backjson.put("type",false);
            	backjson.put("msg","新闻简介需50字以内");
                return backjson;
            }
            if(id>0){//排序不能相同
            	Doc doc=base.executeQuery2Docs("select id from bs_news where ordernum=? and id !=? and isdel=0 and newsclass=? ",new Object[]{ordernum,id,newsclass},1)[0];
            	if(doc!=null&&!doc.isEmpty()){
            		backjson.put("type",false);
                	backjson.put("msg","排序存在重复");
                    return backjson;
            	}
            }else{
            	Doc doc=base.executeQuery2Docs("select id from bs_news where ordernum=? and isdel=0 and newsclass=? ",new Object[]{ordernum,newsclass},1)[0];
            	if(doc!=null&&!doc.isEmpty()){
            		backjson.put("type",false);
                	backjson.put("msg","排序存在重复");
                    return backjson;
            	}
            }
            if(is_top==1){//2016-06-06置顶只能6篇文章
            	List<Doc> listTop=base.executeQuery2List("select id from bs_news where newsclass=? and isdel=0 and is_top=1 ", new Object[]{newsclass});
            	if(id>0){//更新
            		if(listTop!=null){
                		boolean is_exist=false;
                		for(Doc doc:listTop){
                			if(doc.getIn("id")==id){
                				is_exist=true;
                			}
                		}
                		if(!is_exist&&listTop.size()>=6){
                			backjson.put("type",false);
                        	backjson.put("msg","只能置顶6篇文章");
                            return backjson;
                		}
                	}
            	}else{//添加
            		if(listTop!=null&&listTop.size()>=6){
            			backjson.put("type",false);
                    	backjson.put("msg","只能置顶6篇文章");
                        return backjson;
            		}
            	}
            }
            content = StringUtil.replace(content, "^…", "&");
            String sql = "insert into bs_news (newstitle,content,newsclass," +
                    "smallfile,bigfile,ordernum,keywords,bossname,note,is_top," +
                    "adduser,adduserid,addtime)" +
                    " values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
            List list = new ArrayList();
            list.add(newstitle);
            list.add(content);
            list.add(newsclass);
            list.add(smallfile);
            list.add(bigfile);
            list.add(ordernum);
            list.add(keywords);
            list.add(bossname);
            list.add(note);
            list.add(is_top);
            if (id > 0) {
                sql = "update bs_news set newstitle=?,content=?,newsclass=?," +
                        "smallfile=?,bigfile=?,ordernum=?,keywords=?," +
                        "bossname=?,note=?,is_top=?  where id=?";
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
