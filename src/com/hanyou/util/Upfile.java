package com.hanyou.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.AppConf;
import com.baje.sz.util.Doc;
import com.baje.sz.util.FileUtil;
import com.baje.sz.util.RequestUtil;
import com.hanyou.util.Magup;

public class Upfile {
    public JSONArray picUpfile(HttpServletRequest request, int userid, String username) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String logtitle = "上传图片";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            RequestUtil ru = new RequestUtil(request);
            String ips = ru.getIps();
            int pic_log_id = ru.getInt("pic_log_id");
            String pic_msg = ru.getString("pic_msg");
            String file_path = ru.getString("Path");
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

            int filenum = ru.getInt("filenum");
            //System.out.println("filenum="+filenum);
            for (int k = 0; k < filenum; k++) {
                String fromstr = "img" + k;
                String[] temps = ru.getStrings(fromstr + ".filename");
                String[] tmpFilePaths = ru.getStrings(fromstr);
                if (tmpFilePaths != null && tmpFilePaths.length > 0) {
                    for (int i = 0; i < tmpFilePaths.length; i++) {
                        if (tmpFilePaths[i] == null || tmpFilePaths[i].length() == 0) {
                            continue;
                        }
                        filesize = new File(tmpFilePaths[i]).length();
                        file_name = AjaxXml.Get_Date("now", "HH-MI-SS_") + AjaxXml.Getrandom(4);
                        db_file_name = file_name;
                        file_readme = new String(temps[i].getBytes("ISO-8859-1"), "utf-8");
                        file_ext = file_readme.substring(file_readme.lastIndexOf(".") + 1, file_readme.length());
                        FileUtil.copy(tmpFilePaths[i], imgSPaht + "/" + file_name + "." + file_ext, true);
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
                        growthList.add(SetupUtil.getTimestamp(""));
                        growthList.add(file_remark);
                        growthList.add(0);
                        growthList.add(photofile);
                        growthList.add(width);
                        growthList.add(height);
                        growthList.add(pic_msg);
                        growthList.add(ips);
                        int iiii = base.executeUpdate(sqlx, growthList);
                    }
                }
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
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, logtitle);
            return null;
        } finally {
            dbc.closeConn();
        }
    }

    public JSONArray picUpfile(HttpServletRequest request, int userid, String username, Base base) throws Exception {
        JSONObject backjson = new JSONObject();
        String logtitle = "上传图片";
        RequestUtil ru = new RequestUtil(request);
        String ips = ru.getIps();
        int pic_log_id = ru.getInt("pic_log_id");
        String pic_msg = ru.getString("pic_msg");
        String file_path = ru.getString("Path");
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

        int filenum = ru.getInt("filenum");
        for (int k = 0; k < filenum; k++) {
            String fromstr = "img" + k;
            String[] temps = ru.getStrings(fromstr + ".filename");
            String[] tmpFilePaths = ru.getStrings(fromstr);
            if (tmpFilePaths != null && tmpFilePaths.length > 0) {
                for (int i = 0; i < tmpFilePaths.length; i++) {
                    if (tmpFilePaths[i] == null || tmpFilePaths[i].length() == 0) {
                        continue;
                    }
                    filesize = new File(tmpFilePaths[i]).length();
                    file_name = AjaxXml.Get_Date("now", "HH-MI-SS_") + AjaxXml.Getrandom(4);
                    db_file_name = file_name;
                    file_readme = new String(temps[i].getBytes("ISO-8859-1"), "utf-8");
                    file_ext = file_readme.substring(file_readme.lastIndexOf(".") + 1, file_readme.length());
                    if (!file_ext.toLowerCase().equals("jpg") && !file_ext.toLowerCase().equals("gif") && !file_ext.toLowerCase().equals("png") && !file_ext.toLowerCase().equals("bmp")) {
                        continue;
                    }
                    FileUtil.copy(tmpFilePaths[i], imgSPaht + "/" + file_name + "." + file_ext, true);
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
            }
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
     * */
    public JSONObject upfile(HttpServletRequest request, int userid, String username, String ext, String upfromstr, String upFilePath, String upFileName, Base base) throws Exception {
        JSONObject backjson = new JSONObject();
        String logtitle = "上传图片";
        RequestUtil ru = new RequestUtil(request);
        String ips = ru.getIps();
        int pic_log_id = ru.getInt("pic_log_id");
        String pic_msg = ru.getString("pic_msg");
        String file_path = upFilePath;
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
        String checkName = "";
        File imgsfile = new File(imgSPaht);
        if (!imgsfile.exists()) {
            imgsfile.mkdirs();
        }
        String temps = ru.getString(upfromstr + ".filename");
        String tmpFilePaths = ru.getString(upfromstr);
        filesize = new File(tmpFilePaths).length();
        if (upFileName.equals("")) {
            file_name = AjaxXml.Get_Date("now", "HH-MI-SS_") + AjaxXml.Getrandom(4);
        } else {
            file_name = upFileName;
        }
        db_file_name = file_name;
        file_readme = new String(temps.getBytes("ISO-8859-1"), "utf-8");
        file_ext = file_readme.substring(file_readme.lastIndexOf(".") + 1, file_readme.length());
        if (ext.equals("")) {
            ext = ",jpg,png,gif,bmp,";
        }
        if (ext.indexOf("," + file_ext + ",") < 0) {
            return null;
        }
        FileUtil.copy(tmpFilePaths, imgSPaht + "/" + file_name + "." + file_ext, true);
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
        file_readme = "/" + file_path + "/" + file_name + "." + file_ext;
        if (file_ext.indexOf(",jpg,") > -1 || file_ext.indexOf(",gif,") > -1 || file_ext.indexOf(",png,") > -1 || file_ext.indexOf(",bmp,") > -1) {
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

    public String optUpFile(String filePath) {
        try {
            String file_name = "";// 图片名字
            String file_ext = "";// 图片后缀
            //String imgSpath = AppConf.getconf().get("Filepath")+"/public/js/ueditor1_2_3_0/jsp/";
            String imgSpath = AppConf.getconf().get("Filepath") + "/upload/editor/";
            String realPath = "";
            long filesize = 0;
            file_ext = filePath.substring(filePath.lastIndexOf(".") + 1, filePath.length());
            file_name = filePath.substring(filePath.lastIndexOf("/") + 1, filePath.lastIndexOf("."));
            imgSpath = imgSpath + filePath.substring(0, filePath.lastIndexOf("/"));
            realPath = filePath.substring(0, filePath.lastIndexOf("/"));
            ;
            int width = 0;
            int height = 0;
            try {
                File picture = new File(imgSpath + "/" + file_name + "." + file_ext);
                BufferedImage sourceImg = ImageIO.read(new FileInputStream(picture));
                width = sourceImg.getWidth();
                height = sourceImg.getHeight();
            } catch (Exception e) {
                System.out.print("........." + e);
            }
            if (width > 550) {// 宽大于550
                Magup.cutImage(550, imgSpath + "/" + file_name + "." + file_ext, imgSpath + "/" + file_name + "_550." + file_ext, 0.7);
                Magup.cutImage(100, imgSpath + "/" + file_name + "." + file_ext, imgSpath + "/" + file_name + "_100." + file_ext, 0.7);
            } else {
                Magup.cutImage(imgSpath + "/" + file_name + "." + file_ext, imgSpath + "/" + file_name + "_550." + file_ext, 0.7);
                if (width > 100) {
                    Magup.cutImage(100, imgSpath + "/" + file_name + "." + file_ext, imgSpath + "/" + file_name + "_100." + file_ext, 0.7);
                } else {
                    Magup.cutImage(imgSpath + "/" + file_name + "." + file_ext, imgSpath + "/" + file_name + "_100." + file_ext, 0.7);
                }
            }
            filePath = realPath + "/" + file_name + "_550." + file_ext;
            return filePath;
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    public static void main(String[] args) {
        String filePath = "upload/20140529/1201401363761845.jpg";
        String file_ext = filePath.substring(filePath.lastIndexOf(".") + 1, filePath.length());
        String file_name = filePath.substring(filePath.lastIndexOf("/") + 1, filePath.lastIndexOf("."));
        String imgSPaht = filePath.substring(0, filePath.lastIndexOf("/"));
        System.out.println("file_ext=" + file_ext);
        System.out.println("file_name=" + file_name);
        System.out.println("imgSPaht=" + imgSPaht);
    }

}
