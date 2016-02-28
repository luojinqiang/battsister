package com.hanyou.util;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.db.Base;
import com.baje.sz.util.AppConf;
import com.baje.sz.util.Doc;
import com.hanyou.util.Magup;
import com.soft4j.httpupload4j.SmartUpload;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.imageio.ImageIO;
import javax.servlet.jsp.PageContext;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class UpfileSmart {
    public JSONArray picUpfile(SmartUpload su, PageContext pageContext, int userid, String username, Base base) throws Exception {
        com.soft4j.httpupload4j.File suFile = null;
        JSONObject backjson = new JSONObject();
        String logtitle = "上传图片";
        String ips = "";
        int pic_log_id = su.getRequest().getParameterInt("pic_log_id");
        String pic_msg = su.getRequest().getParameter("pic_msg");
        String file_path = su.getRequest().getParameter("Path");
        if (file_path.equals("")) {
            file_path = "upload/" + AjaxXml.Get_Date("now", "YY04MM") + "/" + AjaxXml.Get_Date("now", "DD");
        }
        String impa = "/" + file_path;// 图片路径
        String file_name = "";// 图片名字
        String file_readme = "";// 图片路径
        String db_file_name = "";
        String file_ext = "";// 图片后缀
        String file_remark = "";// 图片备注
        String photofile = "";// 域名
        String imgSPaht = AppConf.getconf().get("Filepath") + impa;
        long filesize = 0;
        // String filename="";
        // String realFileName="";
        // String fileFix="";
        String checkName = "";
        File imgsfile = new File(imgSPaht);
        if (!imgsfile.exists()) {
            imgsfile.mkdirs();
        }

        int filenum = su.getRequest().getParameterInt("filenum");
        for (int i = 0; i < su.getFiles().getCount(); i++) {
            suFile = su.getFiles().getFile(i);
            if (suFile.isMissing()) {
                continue;
            }
            filesize = suFile.getSize() / 1024;
            file_name = AjaxXml.Get_Date("now", "HH-MI-SS_") + AjaxXml.Getrandom(4);
            file_readme = suFile.getFileName();
            db_file_name = file_name;
            file_ext = file_readme.substring(file_readme.lastIndexOf(".") + 1, file_readme.length());
            if (!file_ext.toLowerCase().equals("jpg") && !file_ext.toLowerCase().equals("gif") && !file_ext.toLowerCase().equals("png") && !file_ext.toLowerCase().equals("bmp") && !file_ext.toLowerCase().equals("jpeg")) {
                continue;
            }
            suFile.saveAs(imgSPaht + "/" + file_name + "." + file_ext, SmartUpload.SAVE_PHYSICAL);
            if (file_ext.toLowerCase().equals("png") && filesize > 200) {
                Magup.cutImage(imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + ".jpg", 0.7);
                file_ext = "jpg";
            }
            String newfile = imgSPaht + "/" + file_name + "." + file_ext;
            newfile = impa + "/" + file_name + "." + file_ext;
            // filename=newfile;
            int width = 0;
            int height = 0;
            try {
                File picture = new File(imgSPaht + "/" + file_name + "." + file_ext);
                BufferedImage sourceImg = ImageIO.read(new FileInputStream(picture));
                width = sourceImg.getWidth();
                height = sourceImg.getHeight();
            } catch (Exception e) {
                System.out.print("........." + e);
            }

            if (width > 550) {// 宽大于550
                Magup.cutImage(550, imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_550." + file_ext, 0.7);
                Magup.cutImage(100, imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_100." + file_ext, 0.7);
                file_readme = "/" + file_path + "/" + file_name + "." + file_ext;
            } else {
                Magup.cutImage(imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_550." + file_ext, 0.7);
                if (width > 100) {
                    Magup.cutImage(100, imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_100." + file_ext, 0.7);
                } else {
                    Magup.cutImage(imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_100." + file_ext, 0.7);
                }
                file_readme = "/" + file_path + "/" + file_name + "." + file_ext;
            }
            if (checkName.equals("")) {
                checkName = "'" + file_name + "'";
            } else {
                checkName = checkName + "," + "'" + file_name + "'";
            }
            String sqlx = "insert into bs_news_upfile (username,userid,logid,file_name,file_path,file_ext,"
                    + "file_size,file_readme,isphoto,addtime,file_remark,issave,photofile,photo_width,photo_height, file_showname,addip)"
                    + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            List growthList = new ArrayList();
            growthList.add(username);
            growthList.add(userid);
            growthList.add(pic_log_id);
            growthList.add(db_file_name);
            growthList.add(file_path);
            growthList.add(file_ext);
            growthList.add(filesize);
            growthList.add(file_readme);
            growthList.add(1);
            growthList.add(AjaxXml.getTimestamp("now"));
            growthList.add(file_remark);
            growthList.add(0);
            growthList.add(photofile);
            growthList.add(width);
            growthList.add(height);
            growthList.add(pic_msg);
            growthList.add(ips);
            int iiii = base.executeUpdate(sqlx, growthList);
        }
        JSONArray picArr = new JSONArray();
        if (!checkName.equals("")) {
            List list = base.executeQuery2List("select id,file_name,file_path,file_readme from bs_news_upfile where userid=? and file_name in (" + checkName + ") and addip=?", new Object[]{userid, ips});
            if (list != null && !list.isEmpty()) {
                for (Iterator its = list.iterator(); its.hasNext(); ) {
                    Doc doc = (Doc) its.next();
                    JSONObject picjson = new JSONObject();
                    picjson.put("id", doc.get("id"));
                    picjson.put("file_name", doc.get("file_name"));
                    picjson.put("file_path", doc.get("file_path"));
                    picjson.put("file_readme", doc.get("file_readme"));
                    picArr.add(picjson);
                }
            }
        }

        return picArr;
    }

    /*
     * 指定表单文件域的名称上传
     */
    public JSONArray upfile(SmartUpload su, PageContext pageContext, int userid, String username, String fieldName, Base base) throws Exception {
        com.soft4j.httpupload4j.File suFile = null;
        JSONObject backjson = new JSONObject();
        String logtitle = "上传文件";
        String ips = "";
        int pic_log_id = su.getRequest().getParameterInt("pic_log_id");
        String pic_msg = su.getRequest().getParameter("pic_msg");
        String file_path = su.getRequest().getParameter("Path");
        if (file_path.equals("")) {
            file_path = "upload/" + AjaxXml.Get_Date("now", "YY04MM") + "/" + AjaxXml.Get_Date("now", "DD");
        }
        String impa = "/" + file_path;// 图片路径
        String file_name = "";// 图片名字
        String file_readme = "";// 图片路径
        String db_file_name = "";
        String file_ext = "";// 图片后缀
        String file_remark = "";// 图片备注
        String photofile = "";// 域名
        String imgSPaht = AppConf.getconf().get("Filepath") + impa;
        long filesize = 0;
        // String filename="";
        // String realFileName="";
        // String fileFix="";
        String checkName = "";
        File imgsfile = new File(imgSPaht);
        if (!imgsfile.exists()) {
            imgsfile.mkdirs();
        }

        int filenum = su.getRequest().getParameterInt("filenum");
        for (int i = 0; i < su.getFiles().getCount(); i++) {
            suFile = su.getFiles().getFile(i);
            if (suFile.isMissing()) {
                continue;
            }
            if (!suFile.getFieldName().contains(fieldName)) {
                continue;
            }
            /*if(!suFile.getFieldName().equals(fieldName) && !suFile.getFieldName().equals(fieldName+i)){
                continue;
            }*/
            filesize = suFile.getSize() / 1024;
            file_name = AjaxXml.Get_Date("now", "HH-MI-SS_") + AjaxXml.Getrandom(4);
            file_readme = suFile.getFileName();
            db_file_name = file_name;
            file_ext = file_readme.substring(file_readme.lastIndexOf(".") + 1, file_readme.length());
			/*if(!file_ext.toLowerCase().equals("jpg") && !file_ext.toLowerCase().equals("gif") && !file_ext.toLowerCase().equals("png") && !file_ext.toLowerCase().equals("bmp")){
					continue;
			}*/
            suFile.saveAs(imgSPaht + "/" + file_name + "." + file_ext, SmartUpload.SAVE_PHYSICAL);
            if (file_ext.toLowerCase().equals("png") && filesize > 200) {
                Magup.cutImage(imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + ".jpg", 0.7);
                file_ext = "jpg";
            }
            String newfile = imgSPaht + "/" + file_name + "." + file_ext;
            newfile = impa + "/" + file_name + "." + file_ext;
            // filename=newfile;
            int width = 0;
            int height = 0;
            try {
                if (file_ext.toLowerCase().equals("jpg") || file_ext.toLowerCase().equals("gif") || file_ext.toLowerCase().equals("png") || file_ext.toLowerCase().equals("bmp") || file_ext.toLowerCase().equals("jpeg")) {
                    File picture = new File(imgSPaht + "/" + file_name + "." + file_ext);
                    BufferedImage sourceImg = ImageIO.read(new FileInputStream(picture));
                    width = sourceImg.getWidth();
                    height = sourceImg.getHeight();
                }

                suFile.saveAs(imgSPaht + "/" + file_name + "." + file_ext);
            } catch (Exception e) {
                System.out.print("........." + e);
            }
            //如果不是图片格式不进行压缩
            if (file_ext.toLowerCase().equals("jpg") || file_ext.toLowerCase().equals("gif") || file_ext.toLowerCase().equals("png") || file_ext.toLowerCase().equals("bmp") || file_ext.toLowerCase().equals("jpeg")) {
                if (width > 550) {// 宽大于550
                    Magup.cutImage(550, imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_550." + file_ext, 0.7);
                    Magup.cutImage(100, imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_100." + file_ext, 0.7);
                    file_readme = "/" + file_path + "/" + file_name + "." + file_ext;
                } else {
                    Magup.cutImage(imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_550." + file_ext, 0.7);
                    if (width > 100) {
                        Magup.cutImage(100, imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_100." + file_ext, 0.7);
                    } else {
                        Magup.cutImage(imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_100." + file_ext, 0.7);
                    }
                    file_readme = "/" + file_path + "/" + file_name + "." + file_ext;
                }
            }

            file_readme = "/" + file_path + "/" + file_name + "." + file_ext;
            if (checkName.equals("")) {
                checkName = "'" + file_name + "'";
            } else {
                checkName = checkName + "," + "'" + file_name + "'";
            }
            String sqlx = "insert into bs_news_upfile (username,userid,logid,file_name,file_path,file_ext,"
                    + "file_size,file_readme,isphoto,addtime,file_remark,issave,photofile,photo_width,photo_height, file_showname,addip)"
                    + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            List growthList = new ArrayList();
            growthList.add(username);
            growthList.add(userid);
            growthList.add(pic_log_id);
            growthList.add(db_file_name);
            growthList.add(file_path);
            growthList.add(file_ext);
            growthList.add(filesize);
            growthList.add(file_readme);
            growthList.add(1);
            growthList.add(AjaxXml.Get_Date("now", "YY04-MM-DD HH:MI:SS"));
            growthList.add(file_remark);
            growthList.add(0);
            growthList.add(photofile);
            growthList.add(width);
            growthList.add(height);
            growthList.add(pic_msg);
            growthList.add(ips);
            int iiii = base.executeUpdate(sqlx, growthList);
        }
        JSONArray picArr = new JSONArray();
        if (!checkName.equals("")) {
            List list = base.executeQuery2List("select id,file_name,file_path,file_readme from bs_news_upfile where userid=? and file_name in (" + checkName + ") and addip=?", new Object[]{userid, ips});
            if (list != null && !list.isEmpty()) {
                for (Iterator its = list.iterator(); its.hasNext(); ) {
                    Doc doc = (Doc) its.next();
                    JSONObject picjson = new JSONObject();
                    picjson.put("id", doc.get("id"));
                    picjson.put("file_name", doc.get("file_name"));
                    picjson.put("file_path", doc.get("file_path"));
                    picjson.put("file_readme", doc.get("file_readme"));
                    picArr.add(picjson);
                }
            }
        }

        return picArr;
    }

    public JSONArray picUpfile(SmartUpload su, PageContext pageContext, int userid, String username, int change, Base base) throws Exception {
        com.soft4j.httpupload4j.File suFile = null;
        JSONObject backjson = new JSONObject();
        String logtitle = "上传图片";
        String ips = "";
        int pic_log_id = su.getRequest().getParameterInt("pic_log_id");
        String pic_msg = su.getRequest().getParameter("pic_msg");
        String file_path = su.getRequest().getParameter("Path");
        if (file_path.equals("")) {
            file_path = "upload/" + AjaxXml.Get_Date("now", "YY04MM") + "/" + AjaxXml.Get_Date("now", "DD");
        }
        String impa = "/" + file_path;// 图片路径
        String file_name = "";// 图片名字
        String file_readme = "";// 图片路径
        String db_file_name = "";
        String file_ext = "";// 图片后缀
        String file_remark = "";// 图片备注
        String photofile = "";// 域名
        String imgSPaht = AppConf.getconf().get("Filepath") + impa;
        long filesize = 0;
        // String filename="";
        // String realFileName="";
        // String fileFix="";
        String checkName = "";
        File imgsfile = new File(imgSPaht);
        if (!imgsfile.exists()) {
            imgsfile.mkdirs();
        }

        int filenum = su.getRequest().getParameterInt("filenum");
        for (int i = 0; i < su.getFiles().getCount(); i++) {
            suFile = su.getFiles().getFile(i);
            if (suFile.isMissing()) {
                continue;
            }
            filesize = suFile.getSize() / 1024;
            file_name = AjaxXml.Get_Date("now", "HH-MI-SS_") + AjaxXml.Getrandom(4);
            file_readme = suFile.getFileName();
            db_file_name = file_name;
            file_ext = file_readme.substring(file_readme.lastIndexOf(".") + 1, file_readme.length());
            if (!file_ext.toLowerCase().equals("jpg") && !file_ext.toLowerCase().equals("gif") && !file_ext.toLowerCase().equals("png") && !file_ext.toLowerCase().equals("bmp") && !file_ext.toLowerCase().equals("jpeg")) {
                continue;
            }
            suFile.saveAs(imgSPaht + "/" + file_name + "." + file_ext, SmartUpload.SAVE_PHYSICAL);
            if (file_ext.toLowerCase().equals("png")) {//如果为PNG格式则转为JPG，减少图片大小
                if (change == 2) {
                    Magup.cutImage(imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "." + file_ext, 0.7);
                } else {
                    Magup.cutImage(imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + ".jpg", 0.7);
                    file_ext = "jpg";
                }

            }
            String newfile = imgSPaht + "/" + file_name + "." + file_ext;
            newfile = impa + "/" + file_name + "." + file_ext;
            // filename=newfile;
            int width = 0;
            int height = 0;
            try {
                File picture = new File(imgSPaht + "/" + file_name + "." + file_ext);
                BufferedImage sourceImg = ImageIO.read(new FileInputStream(picture));
                width = sourceImg.getWidth();
                height = sourceImg.getHeight();
            } catch (Exception e) {
                System.out.print("........." + e);
            }

            if (width > 550) {// 宽大于550
                Magup.cutImage(550, imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_550." + file_ext, 0.7);
                Magup.cutImage(100, imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_100." + file_ext, 0.7);
                file_readme = "/" + file_path + "/" + file_name + "." + file_ext;
            } else {
                Magup.cutImage(imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_550." + file_ext, 0.7);
                if (width > 100) {
                    Magup.cutImage(100, imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_100." + file_ext, 0.7);
                } else {
                    Magup.cutImage(imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_100." + file_ext, 0.7);
                }
                file_readme = "/" + file_path + "/" + file_name + "." + file_ext;
            }
            if (checkName.equals("")) {
                checkName = "'" + file_name + "'";
            } else {
                checkName = checkName + "," + "'" + file_name + "'";
            }
            String sqlx = "insert into bs_news_upfile (username,userid,logid,file_name,file_path,file_ext,"
                    + "file_size,file_readme,isphoto,addtime,file_remark,issave,photofile,photo_width,photo_height, file_showname,addip)"
                    + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            List growthList = new ArrayList();
            growthList.add(username);
            growthList.add(userid);
            growthList.add(pic_log_id);
            growthList.add(db_file_name);
            growthList.add(file_path);
            growthList.add(file_ext);
            growthList.add(filesize);
            growthList.add(file_readme);
            growthList.add(1);
            growthList.add(AjaxXml.Get_Date("now", "YY04-MM-DD HH:MI:SS"));
            growthList.add(file_remark);
            growthList.add(0);
            growthList.add(photofile);
            growthList.add(width);
            growthList.add(height);
            growthList.add(pic_msg);
            growthList.add(ips);
            int iiii = base.executeUpdate(sqlx, growthList);
        }
        JSONArray picArr = new JSONArray();
        if (!checkName.equals("")) {
            List list = base.executeQuery2List("select id,file_name,file_path,file_readme from bs_news_upfile where userid=? and file_name in (" + checkName + ") and addip=?", new Object[]{userid, ips});
            if (list != null && !list.isEmpty()) {
                for (Iterator its = list.iterator(); its.hasNext(); ) {
                    Doc doc = (Doc) its.next();
                    JSONObject picjson = new JSONObject();
                    picjson.put("id", doc.get("id"));
                    picjson.put("file_name", doc.get("file_name"));
                    picjson.put("file_path", doc.get("file_path"));
                    picjson.put("file_readme", doc.get("file_readme"));
                    picArr.add(picjson);
                }
            }
        }

        return picArr;
    }

    /*upFilePath指定上传后路径，格式：upload/ad/aa
     * upFileName指定上传后文件名，格式：aaa
     * upfromstr指定表单的文件域名字
     * */
    public JSONObject upfile(SmartUpload su, PageContext pageContext, int userid, String username, String ext, String upfromstr, String upFilePath, String upFileName, Base base) throws Exception {
        com.soft4j.httpupload4j.File suFile = null;
        JSONObject backjson = new JSONObject();
        String logtitle = "上传图片";
        String ips = "";
        int pic_log_id = su.getRequest().getParameterInt("pic_log_id");
        String pic_msg = su.getRequest().getParameter("pic_msg");
        String file_path = upFilePath;
        if (file_path.equals("")) {
            file_path = "upload/" + AjaxXml.Get_Date("now", "YY04MM") + "/" + AjaxXml.Get_Date("now", "DD");
        }
        System.out.println("ddddd");
        String impa = "/" + file_path;// 图片路径
        String file_name = "";// 图片名字
        String file_readme = "";// 图片路径
        String db_file_name = "";
        String file_ext = "";// 图片后缀
        String file_remark = "";// 图片备注
        String photofile = "";// 域名
        String imgSPaht = AppConf.getconf().get("Filepath") + impa;
        long filesize = 0;
        String checkName = "";
        File imgsfile = new File(imgSPaht);
        if (!imgsfile.exists()) {
            imgsfile.mkdirs();
        }
        if (upFileName.equals("")) {
            file_name = AjaxXml.Get_Date("now", "HH-MI-SS_") + AjaxXml.Getrandom(4);
        } else {
            file_name = upFileName;
        }
        db_file_name = file_name;
        int width = 0;
        int height = 0;
        System.out.println(file_path);
        System.out.println(upFileName);
        for (int i = 0; i < su.getFiles().getCount(); i++) {
            if (!upfromstr.equals("")) {
                if (!su.getFiles().getFile(i).getFieldName().equals(upfromstr)) {
                    continue;
                }
            }

            suFile = su.getFiles().getFile(i);
            if (suFile.isMissing()) {
                continue;
            }
            filesize = suFile.getSize() / 1024;
            if (upFileName.equals("")) {
                file_name = AjaxXml.Get_Date("now", "HH-MI-SS_") + AjaxXml.Getrandom(4);
            } else {
                file_name = upFileName;
            }
            file_readme = suFile.getFileName();
            db_file_name = file_name;
            file_ext = file_readme.substring(file_readme.lastIndexOf(".") + 1, file_readme.length());
            if (ext.equals("")) {
                ext = ",jpg,png,gif,bmp,jpeg,";
            }
            if (ext.indexOf("," + file_ext + ",") < 0) {
                return null;
            }
            suFile.saveAs(imgSPaht + "/" + file_name + "." + file_ext, SmartUpload.SAVE_PHYSICAL);
            if (file_ext.toLowerCase().equals("png") && filesize > 200) {
                Magup.cutImage(imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + ".jpg", 0.7);
                file_ext = "jpg";
            }
            String newfile = imgSPaht + "/" + file_name + "." + file_ext;
            newfile = impa + "/" + file_name + "." + file_ext;
            // filename=newfile;
            try {
                File picture = new File(imgSPaht + "/" + file_name + "." + file_ext);
                BufferedImage sourceImg = ImageIO.read(new FileInputStream(picture));
                width = sourceImg.getWidth();
                height = sourceImg.getHeight();
            } catch (Exception e) {
                System.out.print("........." + e);
            }
            file_readme = "/" + file_path + "/" + file_name + "." + file_ext;
            if (ext.indexOf(",jpg,") > -1 || ext.indexOf(",gif,") > -1 || ext.indexOf(",png,") > -1 || ext.indexOf(",bmp,") > -1 || ext.indexOf(",jpeg,") > -1) {
                if (width > 550) {// 宽大于550
                    Magup.cutImage(550, imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_550." + file_ext, 0.7);
                    Magup.cutImage(100, imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_100." + file_ext, 0.7);
                } else {
                    Magup.cutImage(imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_550." + file_ext, 0.7);
                    if (width > 100) {
                        Magup.cutImage(100, imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_100." + file_ext, 0.7);
                    } else {
                        Magup.cutImage(imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_100." + file_ext, 0.7);
                    }
                }
            }
        }
        String sqlx = "insert into bs_news_upfile (username,userid,logid,file_name,file_path,file_ext,"
                + "file_size,file_readme,isphoto,addtime,file_remark,issave,photofile,photo_width,photo_height, file_showname,addip)"
                + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        List growthList = new ArrayList();
        growthList.add(username);
        growthList.add(userid);
        growthList.add(pic_log_id);
        growthList.add(db_file_name);
        growthList.add(file_path);
        growthList.add(file_ext);
        growthList.add(filesize);
        growthList.add(file_readme);
        growthList.add(1);
        growthList.add(AjaxXml.Get_Date("now", "YY04-MM-DD HH:MI:SS"));
        growthList.add(file_remark);
        growthList.add(0);
        growthList.add(photofile);
        growthList.add(width);
        growthList.add(height);
        growthList.add(pic_msg);
        growthList.add(ips);
        int iiii = base.executeUpdate(sqlx, growthList);
        JSONObject picjson = new JSONObject();
        picjson.put("type", true);
        picjson.put("file_readme", file_readme);
        return picjson;
    }
}
