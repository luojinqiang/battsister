package com.hanyou.util;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.util.*;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Vdb_List {
    public int pages = 0;
    public int counts = 0;
    public int pn = 0;
    public int classid = 0;
    public int newsid = 0;
    public Doc classlist = new Doc();
    public String classname = "";

    public void Setclass(int classid) {
        this.classid = classid;
        List list = new ArrayList();
        //List list=Class_db.Getclass("/xml/row[@parentid='"+classid+"']",0);
        int i = 1;
        if (list != null) {
            for (Iterator its = list.listIterator(); its.hasNext(); ) {
                Doc doc = (Doc) its.next();
                classlist.put("id" + i, doc.get("id"));
                classlist.put("classname" + i, doc.get("classname"));
                i = i + 1;
            }
        }
    }

    public void Setnews(int newsid) {
        this.newsid = newsid;
    }

    public void Setnews(String newsid) {
        this.newsid = Integer.parseInt(newsid);
    }

    public void Setclassname(String classname) {
        this.classname = classname;
    }

    public String Setdate(String date, String str) {
        String dates = "";
        try {
            dates = AjaxXml.Get_Date(date, str);
        } catch (Exception e) {
            e.printStackTrace();
            dates = date;
        }
        return dates;
    }

    public String Setclassid(String classid) {
        String dates = "";
        try {
            StringBuffer tmpStr = new StringBuffer();
            Selectic select = new Selectic();
            String[] bbsclass = classid.split(",");
            for (int i = 0; i < bbsclass.length; i++) {
                if (!bbsclass[i].equals("")) {
                    Doc bbs2 = select.Get_Doc("id,parentid,classname,keyword,savepath,picpath,htmlpage", "wnk_web_newsclass", "where classname='" + bbsclass[i] + "'", "mysqlss");
                    if (bbs2 == null) {
                        tmpStr.append("");
                    } else {
                        tmpStr.append(" <a href=\"" + bbs2.get("savepath") + "/" + bbs2.get("htmlpage") + ".html\" title=\"" + bbs2.get("classname") + "\">" + bbs2.get("classname") + "</a> ");
                    }
                }
            }
            return tmpStr.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return dates;
        }

    }

    public List Setlist_h(String date) {
        List lists2 = new ArrayList();
        try {
            //lists2=Class_db.Getdocadmin(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lists2;
    }

    public String Includehtmlfile(String path) {
        return FileUtil.read(AppConf.getconf().get("Htmlpath") + path);
    }

    public String Includevmfile(String path) {
        return FileUtil.read(AppConf.getconf().get("Htmlpath") + path);
    }

    public List getArlList(String str) {
        String[] tmpStrs = StringUtil.strs2array(str, ";");
        String table = tmpStrs[0].substring(tmpStrs[0].indexOf("=") + 1);
        String file = tmpStrs[1].substring(tmpStrs[1].indexOf("=") + 1);
        String where = tmpStrs[2].substring(tmpStrs[2].indexOf("=") + 1);
        String db = tmpStrs[3].substring(tmpStrs[3].indexOf("=") + 1);
        List lists;
        List lists2 = new ArrayList();
        Selectic select = new Selectic();
        try {
            where = where.replaceAll("@classid@", String.valueOf(classid));
            where = where.replaceAll("@newsid@", String.valueOf(newsid));
            where = where.replaceAll("@classname@", classname);

            if (Ubb.Isinstr(where, "@classnext")) {
                String ids = Ubb.guolva(where, "@classnext(\\d)@", "1");
                if (classlist.get("id" + ids) != null)
                    where = where.replaceAll("@classnext" + ids + "@", classlist.get("id" + ids));
                else
                    where = where.replaceAll("@classnext" + ids + "@", String.valueOf(classid));

            }


            lists = select.Get_List(file, table, where, db);
            if (lists == null || lists.size() == 0) {
                return null;
            } else {
                for (Iterator its = lists.listIterator(); its.hasNext(); ) {
                    Doc doc = (Doc) its.next();

                    lists2.add(doc);
                }
            }
            return lists2;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List getcArlList(String str) {
        String[] tmpStrs = StringUtil.strs2array(str, ";");
        String table = tmpStrs[0].substring(tmpStrs[0].indexOf("=") + 1);
        String file = tmpStrs[1].substring(tmpStrs[1].indexOf("=") + 1);
        String where = tmpStrs[2].substring(tmpStrs[2].indexOf("=") + 1);
        String db = tmpStrs[3].substring(tmpStrs[3].indexOf("=") + 1);
        List lists;
        List lists2 = new ArrayList();
        Selectic select = new Selectic();
        try {
            where = where.replaceAll("@classid@", String.valueOf(classid));
            where = where.replaceAll("@newsid@", String.valueOf(newsid));
            where = where.replaceAll("@classname@", classname);

            if (Ubb.Isinstr(where, "@classnext")) {
                String ids = Ubb.guolva(where, "@classnext(\\d)@", "1");
                if (classlist.get("id" + ids) != null)
                    where = where.replaceAll("@classnext" + ids + "@", classlist.get("id" + ids));
                else
                    where = where.replaceAll("@classnext" + ids + "@", String.valueOf(classid));

            }
            lists = select.Get_List(file, table, where, db);
            if (lists == null || lists.size() == 0) {
                return null;
            } else {
                for (Iterator its = lists.listIterator(); its.hasNext(); ) {
                    Doc doc = (Doc) its.next();
                    if (doc.get("addtime") != null) {
                        doc.put("addtime", AjaxXml.Get_Date(doc.get("addtime"), "YY04-MM-DD"));
                    }
                    lists2.add(doc);
                }
            }
            return lists2;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Doc getArldoc(String str) {
        String[] tmpStrs = StringUtil.strs2array(str, ";");
        String table = tmpStrs[0].substring(tmpStrs[0].indexOf("=") + 1);
        String file = tmpStrs[1].substring(tmpStrs[1].indexOf("=") + 1);
        String where = tmpStrs[2].substring(tmpStrs[2].indexOf("=") + 1);
        String db = tmpStrs[3].substring(tmpStrs[3].indexOf("=") + 1);
        Doc doc = new Doc();
        Selectic select = new Selectic();
        try {
            where = where.replaceAll("@classid@", String.valueOf(classid));
            where = where.replaceAll("@newsid@", String.valueOf(newsid));
            where = where.replaceAll("@classname@", classname);

            if (Ubb.Isinstr(where, "@classnext")) {
                String ids = Ubb.guolva(where, "@classnext(\\d)@", "1");
                if (classlist.get("id" + ids) != null)
                    where = where.replaceAll("@classnext" + ids + "@", classlist.get("id" + ids));
                else
                    where = where.replaceAll("@classnext" + ids + "@", String.valueOf(classid));

            }
            doc = select.Get_Doc(file, table, where, db);
            //System.out.println(file);
            //System.out.println(table);
            //System.out.println(where);
            //System.out.println(db);

            return doc;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
