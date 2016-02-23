package com.hanyou.util;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.math.RandomUtils;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.AppConf;
import com.baje.sz.util.FileUtil;
import com.baje.sz.util.Magick;
import com.baje.sz.util.RequestUtil;
import com.hanyou.util.Magup;
import com.soft4j.httpupload4j.SmartUpload;

@SuppressWarnings("unchecked")
public class swfUpfile {


    private static final long serialVersionUID = 1L;

    // 上传文件的保存路径，相对于应用的根目录
    private static final String UPLOAD_PIC_PATH = "/";

    byte[] imgBufTemp = new byte[102401];


    /**
     * 生成保存上传文件的磁盘路径
     *
     * @param fileName
     * @return
     */
    public String getSavePath(String fileName) {
        String realPath = AppConf.getconf().get("Filepath");
        return realPath + UPLOAD_PIC_PATH + fileName;
    }

    /**
     * 生成访问上传成功后的文件的URL地址
     *
     * @param fileName
     * @return
     */
    public String getFileUrl(String fileName) {
        return "files/" + fileName;
    }


    public String defaultProcessFileUpload(HttpServletRequest request,
                                           HttpServletResponse response) throws IOException {
        ServletFileUpload upload = new ServletFileUpload();
        upload.setHeaderEncoding("UTF-8");
        String fanhui = "";
        InputStream stream = null;
        BufferedOutputStream bos = null;
        String fileUrl = "";
        try {
            if (ServletFileUpload.isMultipartContent(request)) {
                FileItemIterator iter = upload.getItemIterator(request);
                int i = 0;
                while (iter.hasNext()) {
                    FileItemStream item = iter.next();
                    stream = item.openStream();
                    if (!item.isFormField()) {
                        String prefix = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + "-" + RandomUtils.nextInt();
                        // 得到文件的扩展名(无扩展名时将得到全名)
                        String ext = item.getName().substring(item.getName().lastIndexOf(".") + 1);
                        String fileName = prefix + "." + ext;
                        String savePath = getSavePath(fileName);
                        if (i > 0) {
                            fileUrl += ",";
                        }
                        fileUrl += getFileUrl(fileName);
                        bos = new BufferedOutputStream(new FileOutputStream(
                                new File(savePath)));
                        int length;
                        while ((length = stream.read(imgBufTemp)) != -1) {
                            bos.write(imgBufTemp, 0, length);
                        }
                        i++;
                    }
                }
                StringBuilder json = new StringBuilder();
                json.append("{");
                json.append("'");
                json.append("fileUrl");
                json.append("':'");
                json.append(fileUrl.toString());
                json.append("'");
                Enumeration<String> pNames = request.getParameterNames();
                String pName;
                while (pNames.hasMoreElements()) {
                    json.append(",");
                    pName = pNames.nextElement();
                    json.append("'");
                    json.append(pName);
                    json.append("':'");
                    json.append(request.getParameter(pName));
                    json.append("'");
                }
                json.append("}");
                return json.toString();
                //response.getWriter().write(json.toString());
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
            return "err1";
        } finally {
            if (stream != null) {
                try {
                    stream.close();
                } catch (Exception e) {

                }
            }
            if (bos != null) {
                try {
                    bos.close();
                } catch (Exception e) {
                }
            }
            return "err2";
        }
    }


    public String addfile(HttpServletRequest request, HttpServletResponse response) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            RequestUtil ru = new RequestUtil(request);
            String file_path = ru.getString("Path");
            if (file_path.equals("")) {
                file_path = "upload/" + AjaxXml.Get_Date("now", "YY04MM") + "/" + AjaxXml.Get_Date("now", "DD");
                ;
            }
            String impa = "/" + file_path;//图片路径
            String file_name = "";//图片名字
            String file_readme = "";//图片路径
            String file_ext = "";//图片后缀
            String imgSPaht = AppConf.getconf().get("Filepath") + impa;

            long filesize = 0;


            File imgsfile = new File(imgSPaht);
            if (!imgsfile.exists()) {
                imgsfile.mkdirs();
            }
            String[] temps = ru.getStrings("Filedata.filename");
            String[] tmpFilePaths = ru.getStrings("Filedata");
            //System.out.println("xx:"+temps);
            if (temps != null && temps.length > 0) {
                for (int i = 0; i < temps.length; i++) {
                    if (temps[i] == null || temps[i].length() == 0) {
                        continue;
                    }
                    filesize = new File(tmpFilePaths[i]).length();
                    file_name = AjaxXml.Get_Date("now", "HH-MI-SS_") + AjaxXml.Getrandom(4);
                    file_readme = new String(temps[i].getBytes("ISO-8859-1"), "utf-8");
                    file_ext = file_readme.substring(file_readme.lastIndexOf(".") + 1, file_readme.length());
                    //System.out.println("file_readme:"+file_readme);
                    FileUtil.copy(tmpFilePaths[i], imgSPaht + "/" + file_name + "." + file_ext, true);
                    String db_file_name = imgSPaht + "/" + file_name + "." + file_ext;
                    String newfile = imgSPaht + "/" + file_name + "." + file_ext;
                    newfile = impa + "/" + file_name + "." + file_ext;
                    //filename=newfile;
                    int width = 0;
                    int height = 0;

                    BufferedImage bufferedImage = ImageIO.read(new File(imgSPaht + "/" + file_name + "." + file_ext));
                    width = bufferedImage.getWidth();
                    height = bufferedImage.getHeight();


                    if (width > 550) {
                    } else {
                    }
                    file_readme = "/" + file_path + "/" + file_name + "." + file_ext;
                    String sqlx = "insert into hy_news_upfile (username,userid,logid,file_name,file_path,file_ext,"
                            + "file_size,file_readme,isphoto,addtime,file_remark,issave,photofile,photo_width,photo_height, file_showname,addip)"
                            + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    List growthList = new ArrayList();
                    growthList.add("");
                    growthList.add(0);
                    growthList.add(0);
                    growthList.add(db_file_name);
                    growthList.add(file_path);
                    growthList.add(file_ext);
                    growthList.add(filesize);
                    growthList.add(db_file_name);
                    growthList.add(1);
                    growthList.add(AjaxXml.Get_Date("now", "YY04-MM-DD HH:MI:SS"));
                    growthList.add("");
                    growthList.add(0);
                    growthList.add("");
                    growthList.add(width);
                    growthList.add(height);
                    growthList.add("");
                    growthList.add(ru.getIps());
                    //System.out.println(sqlx);
                    //System.out.println(growthList);

                    int iiii = base.executeUpdate(sqlx, growthList);
                }
            }
            return "{\"status\":\"1\",\"imgpath\":\"" + file_readme + "\"}";
        } catch (Exception e) {
            e.printStackTrace();
            return "失败";
        } finally {
            dbc.closeConn();
        }
    }


    public String addfile(HttpServletRequest request, HttpServletResponse response, int userid, String username) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            RequestUtil ru = new RequestUtil(request);
            int logid = ru.getInt("logid");
            String ru_username = ru.getString("username");
            int ru_userid = ru.getInt("userid");
            int isya = ru.getInt("isya");
            int zjwidth = ru.getInt("zjwidth");
            //System.out.println("zjwidth="+zjwidth);
            int zxwidth = ru.getInt("zxwidth");
            String file_remark = ru.getString("file_remark");

            String file_path = ru.getString("Path");
            if (file_path.equals("")) {
                file_path = "upload/" + AjaxXml.Get_Date("now", "YY04MM") + "/" + AjaxXml.Get_Date("now", "DD");
                ;
            }
            String impa = "/" + file_path;//图片路径
            String file_name = "";//图片名字
            String file_readme = "";//图片路径
            String file_ext = "";//图片后缀
            String imgSPaht = AppConf.getconf().get("Filepath") + impa;

            long filesize = 0;


            File imgsfile = new File(imgSPaht);
            if (!imgsfile.exists()) {
                imgsfile.mkdirs();
            }
            String[] temps = ru.getStrings("Filedata.filename");
            String[] tmpFilePaths = ru.getStrings("Filedata");

            if (temps != null && temps.length > 0) {
                for (int i = 0; i < temps.length; i++) {
                    if (temps[i] == null || temps[i].length() == 0) {
                        continue;
                    }
                    filesize = new File(tmpFilePaths[i]).length();
                    file_name = AjaxXml.Get_Date("now", "HH-MI-SS_") + AjaxXml.Getrandom(4);
                    file_readme = new String(temps[i].getBytes("ISO-8859-1"), "utf-8");
                    file_ext = file_readme.substring(file_readme.lastIndexOf(".") + 1, file_readme.length());
                    //System.out.println("file_readme:"+file_readme);
                    FileUtil.copy(tmpFilePaths[i], imgSPaht + "/" + file_name + "." + file_ext, true);
                    String db_file_name = imgSPaht + "/" + file_name + "." + file_ext;
                    String newfile = imgSPaht + "/" + file_name + "." + file_ext;
                    newfile = impa + "/" + file_name + "." + file_ext;
                    db_file_name = newfile;
                    //filename=newfile;
                    int width = 0;
                    int height = 0;

                    BufferedImage bufferedImage = ImageIO.read(new File(imgSPaht + "/" + file_name + "." + file_ext));
                    width = bufferedImage.getWidth();
                    height = bufferedImage.getHeight();

                    int issave = isya;//是否压缩
                    String photofile = "";//小图
                    String file_showname = "";//中图

                    if (isya == 1) {
                        if (zjwidth > 0 && zjwidth < width) {
                            Magick.resizeImage(imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_550." + file_ext, zjwidth, -1, true, true);
                            file_showname = impa + "/" + file_name + "_550." + file_ext;
                        }
                        if (zxwidth > 0 && zxwidth < width) {
                            Magick.resizeImage(imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + "_100." + file_ext, zxwidth, -1, true, true);
                            photofile = impa + "/" + file_name + "_100." + file_ext;
                        }
                    }
                    // System.out.println("file_showname:"+file_showname);
                    if (width > 550) {
                    } else {
                    }


                    file_readme = "/" + file_path + "/" + file_name + "." + file_ext;
                    String sqlx = "insert into hy_news_upfile (username,userid,logid,file_name,file_path,file_ext,"
                            + "file_size,file_readme,isphoto,addtime,file_remark,issave,photofile,photo_width,photo_height, file_showname,addip)"
                            + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    List growthList = new ArrayList();
                    growthList.add(username);
                    growthList.add(userid);
                    growthList.add(logid);
                    growthList.add(db_file_name);
                    growthList.add(file_path);
                    growthList.add(file_ext);
                    growthList.add(filesize);
                    growthList.add(db_file_name);
                    growthList.add(1);
                    growthList.add(AjaxXml.Get_Date("now", "YY04-MM-DD HH:MI:SS"));
                    growthList.add(file_remark);
                    growthList.add(issave);
                    growthList.add(photofile);
                    growthList.add(width);
                    growthList.add(height);
                    growthList.add(file_showname);
                    growthList.add(ru.getIps());

                    int iiii = base.executeUpdate(sqlx, growthList);
                    if (iiii == 0 && logid > 0) {
                        base.executeUpdate("update hy_news set pic_num=(select count(id) from hy_news_upfile where logid=" + logid + " and isdel=0) where id=" + logid + "", new ArrayList());
                    }
                }
            }
            return "{\"status\":\"1\",\"imgpath\":\"" + file_readme + "\"}";
        } catch (Exception e) {
            e.printStackTrace();
            return "失败";
        } finally {
            dbc.closeConn();
        }
    }

    public String addfileFileUpLoad(HttpServletRequest request, HttpServletResponse response, int userid, String username) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            //RequestUtil ru = new RequestUtil(request);
            //int logid=ru.getInt("logid");
            //String ru_username=ru.getString("username");
            //int ru_userid=ru.getInt("userid");
            //int isya=ru.getInt("isya");
            //int zjwidth=ru.getInt("zjwidth");
            //int zxwidth=ru.getInt("zxwidth");
            //String file_remark=ru.getString("file_remark");
            int logid = 0;
            String ru_username = "";
            int ru_userid = 0;
            int isya = 0;
            int zjwidth = 0;
            int zxwidth = 0;
            String file_remark = "";
            //String file_path=ru.getString("Path");
            String file_path = "";
            if (file_path.equals("")) {
                file_path = "upload/" + AjaxXml.Get_Date("now", "YY04MM") + "/" + AjaxXml.Get_Date("now", "DD");
                ;
            }
            String impa = "/" + file_path;//图片路径
            String file_name = "";//图片名字
            String file_readme = "";//图片路径
            String file_ext = "";//图片后缀
            String imgSPath = AppConf.getconf().get("Filepath") + impa;

            long filesize = 0;


            File imgsfile = new File(imgSPath);
            if (!imgsfile.exists()) {
                imgsfile.mkdirs();
            }

            if (ServletFileUpload.isMultipartContent(request)) {

                DiskFileItemFactory factory = new DiskFileItemFactory();
                factory.setRepository(new File(imgSPath));
                ServletFileUpload upload = new ServletFileUpload(factory);
                //FileItemIterator fii = upload.getItemIterator(request);
                List<FileItem> fileItems = upload.parseRequest(request);
                Iterator<FileItem> fii = fileItems.iterator();
                while (fii.hasNext()) {
                    FileItem fis = fii.next();
                    //System.out.println(fis.getFieldName()+"="+fis.getString("utf-8"));
                    if (!fis.isFormField()) {
                        if (fis.getName().length() > 0) {
                            file_readme = fis.getName();
                            file_name = AjaxXml.Get_Date("now", "HH-MI-SS_") + AjaxXml.Getrandom(4);
                            file_ext = file_readme.substring(file_readme.lastIndexOf(".") + 1, file_readme.length());
                            //System.out.println("完整的文件名：" + file_readme);
                            File uploadFile = new File(imgSPath + "/" + file_name + "." + file_ext);
                            fis.write(uploadFile);
                            filesize = fis.getSize();
                            if (file_ext.toLowerCase().equals("png")) {
                                Magup.cutImage(imgSPath + "/" + file_name + "." + file_ext, imgSPath + "/" + file_name + ".jpg", 0.7);
                                file_ext = "jpg";
                            }
                            String db_file_name = impa + "/" + file_name + "." + file_ext;
                            int width = 0;
                            int height = 0;

                            BufferedImage bufferedImage = ImageIO.read(new File(imgSPath + "/" + file_name + "." + file_ext));
                            width = bufferedImage.getWidth();
                            height = bufferedImage.getHeight();

                            int issave = isya;//是否压缩
                            String photofile = "";//小图
                            String file_showname = "";//中图
                            //System.out.println("width="+width);
                            if (width > 550) {// 宽大于550
                                Magup.cutImage(550, imgSPath + "/" + file_name + "." + file_ext, imgSPath + "/" + file_name + "_550." + file_ext, 0.7);
                                Magup.cutImage(100, imgSPath + "/" + file_name + "." + file_ext, imgSPath + "/" + file_name + "_100." + file_ext, 0.7);
                                file_readme = "/" + file_path + "/" + file_name + "." + file_ext;
                            } else {
                                Magup.cutImage(imgSPath + "/" + file_name + "." + file_ext, imgSPath + "/" + file_name + "_550." + file_ext, 0.7);
                                if (width > 100) {
                                    Magup.cutImage(100, imgSPath + "/" + file_name + "." + file_ext, imgSPath + "/" + file_name + "_100." + file_ext, 0.7);
                                } else {
                                    Magup.cutImage(imgSPath + "/" + file_name + "." + file_ext, imgSPath + "/" + file_name + "_100." + file_ext, 0.7);
                                }
                                file_readme = "/" + file_path + "/" + file_name + "." + file_ext;
                            }
                            //System.out.println("file_showname:"+file_showname);
                            file_readme = "/" + file_path + "/" + file_name + "." + file_ext;
                            String sqlx = "insert into hy_news_upfile (username,userid,logid,file_name,file_path,file_ext,"
                                    + "file_size,file_readme,isphoto,addtime,file_remark,issave,photofile,photo_width,photo_height, file_showname,addip)"
                                    + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                            List growthList = new ArrayList();
                            growthList.add(username);
                            growthList.add(userid);
                            growthList.add(logid);
                            growthList.add(db_file_name);
                            growthList.add(file_path);
                            growthList.add(file_ext);
                            growthList.add(filesize);
                            growthList.add(db_file_name);
                            growthList.add(1);
                            growthList.add(AjaxXml.Get_Date("now", "YY04-MM-DD HH:MI:SS"));
                            growthList.add(file_remark);
                            growthList.add(issave);
                            growthList.add(photofile);
                            growthList.add(width);
                            growthList.add(height);
                            growthList.add(file_showname);
                            growthList.add("");

                            int iiii = base.executeUpdate(sqlx, growthList);
                            if (iiii == 0 && logid > 0) {
                                base.executeUpdate("update hy_news set pic_num=(select count(id) from hy_news_upfile where logid=" + logid + " and isdel=0) where id=" + logid + "", new ArrayList());
                            }
                        }
                    } else {
                        // System.out.println(fis.getFieldName()+"=" + fis.getString("utf-8"));
                    }
                }
            }
            return "{\"status\":\"1\",\"imgpath\":\"" + file_readme + "\"}";
        } catch (Exception e) {
            e.printStackTrace();
            return "失败";
        } finally {
            dbc.closeConn();
        }
    }

    public static String fileUpload(SmartUpload su, PageContext pageContext, int userid, String username) throws Exception {
        com.soft4j.httpupload4j.File suFile = null;
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson=new JSONObject();
        try {
            //System.out.println("tomcat");
            dbc.openConn();
            base.setDbc(dbc);
            //System.out.println("tomcat22");
            int logid = su.getRequest().getParameterInt("logid");
            String ru_username = su.getRequest().getParameter("username");
            int ru_userid = su.getRequest().getParameterInt("userid");
            int isya = su.getRequest().getParameterInt("isya");
            int zjwidth = su.getRequest().getParameterInt("zjwidth");
            int zxwidth = su.getRequest().getParameterInt("zxwidth");
            String file_remark = su.getRequest().getParameter("file_remark");

            String file_path = su.getRequest().getParameter("Path");
            file_path = "";
            //System.out.println("file_path="+file_path);
            if (file_path.equals("")) {
                file_path = "upload/" + AjaxXml.Get_Date("now", "YY04MM") + "/" + AjaxXml.Get_Date("now", "DD");
                ;
            }
            String impa = "/" + file_path;//图片路径
            String file_name = "";//图片名字
            String file_readme = "";//图片路径
            String file_ext = "";//图片后缀
            String imgSPaht = AppConf.getconf().get("Filepath") + impa;

            long filesize = 0;

            System.out.println("imgSPaht=" + imgSPaht);
            File imgsfile = new File(imgSPaht);
            if (!imgsfile.exists()) {
                imgsfile.mkdirs();
            }
            String little_url="";//如果是视频则为视频缩略图的地址
            for (int i = 0; i < su.getFiles().getCount(); i++) {
                suFile = su.getFiles().getFile(i);
                //System.out.println(su.getFiles().getFile(i).getFieldName());
                if (suFile.isMissing()) {
                    continue;
                }
                filesize = suFile.getSize() / 1024;
                file_name = AjaxXml.Get_Date("now", "HH-MI-SS_") + AjaxXml.Getrandom(4);
                file_readme = suFile.getFileName();
                file_ext = file_readme.substring(file_readme.lastIndexOf(".") + 1, file_readme.length());
                //System.out.println("file_readme:"+file_readme);
                //FileUtil.copy(tmpFilePaths[i],imgSPaht+"/"+file_name+"."+file_ext,true);
                System.out.println(imgSPaht + "/" + file_name + "." + file_ext);
                //LogUtility.log("filename--"+imgSPaht + "/" + file_name + "." + file_ext);
                suFile.saveAs(imgSPaht + "/" + file_name + "." + file_ext, SmartUpload.SAVE_PHYSICAL);
                if (file_ext.toLowerCase().equals("png") && filesize > 200) {
                    Magup.cutImage(imgSPaht + "/" + file_name + "." + file_ext, imgSPaht + "/" + file_name + ".jpg", 0.7);
                    file_ext = "jpg";
                }
                String db_file_name = imgSPaht + "/" + file_name + "." + file_ext;
                String newfile = imgSPaht + "/" + file_name + "." + file_ext;
                newfile = impa + "/" + file_name + "." + file_ext;
                db_file_name = newfile;
                //filename=newfile;
                int width = 0;
                int height = 0;
                int issave = isya;//是否压缩
                String photofile = "";//小图
                String file_showname = "";//中图
                if (file_ext.equals("jpg") || file_ext.equals("png") || file_ext.equals("JPG") || file_ext.equals("jpeg") || file_ext.equals("bmp") || file_ext.equals("gif")) {
                    BufferedImage bufferedImage = ImageIO.read(new File(imgSPaht + "/" + file_name + "." + file_ext));
                    width = bufferedImage.getWidth();
                    height = bufferedImage.getHeight();
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
                }else if(file_ext.equals("wmv") || file_ext.equals("mp4") ){
                	//上传的是视频，生成视频缩略图
                	little_url="/" + file_path + "/" + file_name + ".jpg"; 
                	  //上传成功后获取视频的缩略图
                    String command = "/usr/local/ffmpeg/bin/ffmpeg  -i " + AppConf.getconf().get("Filepath") + "/" + file_path + "/" + file_name + "." + file_ext + " -y -f image2 -ss 00:00:02 -t 00:00:01 -s 550x240 " + AppConf.getconf().get("Filepath") + little_url;
                    //LogUtility.log("command-->"+command);
                    Runtime.getRuntime().exec(command);
                }
                //System.out.println("file_showname:"+file_showname);
                file_readme = "/" + file_path + "/" + file_name + "." + file_ext;
                String sqlx = "insert into hy_news_upfile (username,userid,logid,file_name,file_path,file_ext,"
                        + "file_size,file_readme,isphoto,addtime,file_remark,issave,photofile,photo_width,photo_height, file_showname,addip)"
                        + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                List growthList = new ArrayList();
                growthList.add(username);
                growthList.add(userid);
                growthList.add(logid);
                growthList.add(db_file_name);
                growthList.add(file_path);
                growthList.add(file_ext);
                growthList.add(filesize);
                growthList.add(db_file_name);
                growthList.add(1);
                growthList.add(SetupUtil.getTimestamp(""));
                growthList.add(file_remark);
                growthList.add(issave);
                growthList.add(photofile);
                growthList.add(width);
                growthList.add(height);
                growthList.add(file_showname);
                growthList.add("");
                //System.out.println(sqlx);
                //System.out.println(growthList);

                int iiii = base.executeUpdate(sqlx, growthList);
                if (iiii == 0 && logid > 0) {
                    base.executeUpdate("update hy_news set pic_num=(select count(id) from hy_news_upfile where logid=" + logid + " and isdel=0) where id=" + logid + "", new ArrayList());
                }
            }
            backjson.put("status", 1);
            backjson.put("imgpath", file_readme);
            backjson.put("little_url", little_url);
            //LogUtility.log("little_url--->"+little_url);
            return backjson.toString();
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, "upload file is failure ");
            backjson.put("status", -1);
            backjson.put("imgpath", "");
            return backjson.toString();
        } finally {
            dbc.closeConn();
        }
    }
    public static String VideoFileUpload(SmartUpload su, PageContext pageContext, int userid, String username) throws Exception {
        com.soft4j.httpupload4j.File suFile = null;
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        try {
            dbc.openConn();
            base.setDbc(dbc);
            String checkName = "avi,mpg,mpeg,rm,rmvb,dat,wmv,mov,asf,m1v,m2v,mpe,qt,vob,ra,rmj,rms,ram,rmm,ogm,mkv,avi_NEO_,ifo,mp4,3gp,rpm,smi,smil,tp,ts,ifo,mpv2,mp2v,tpr,pss,pva,vg2,drc,ivf,vp6,vp7,divx";
            String file_path = su.getRequest().getParameter("Path");
            file_path = "";
            if (file_path.equals("")) {
                file_path = "upload/" + AjaxXml.Get_Date("now", "YY04MM") + "/" + AjaxXml.Get_Date("now", "DD");
                ;
            }
            String impa = "/" + file_path;//图片路径
            String file_name = "";//图片名字
            String file_readme = "";//图片路径
            String file_ext = "";//图片后缀
            String imgSPaht = AppConf.getconf().get("Filepath") + impa;
            File imgsfile = new File(imgSPaht);
            if (!imgsfile.exists()) {
                imgsfile.mkdirs();
            }
            for (int i = 0; i < su.getFiles().getCount(); i++) {
                suFile = su.getFiles().getFile(i);
                if (suFile.isMissing()) {
                    continue;
                }
                file_name = AjaxXml.Get_Date("now", "HH-MI-SS_") + AjaxXml.Getrandom(4);
                file_readme = suFile.getFileName();
                file_ext = file_readme.substring(file_readme.lastIndexOf(".") + 1, file_readme.length());
                file_readme = "/" + file_path + "/" + file_name + "." + file_ext;
                suFile.saveAs(imgSPaht + "/" + file_name + "." + file_ext, SmartUpload.SAVE_PHYSICAL);
                if (checkName.contains(file_ext)) {
                    return "{\"status\":\"1\",\"videoPath\":\"" + file_readme + "\"}";
                }
            }
            return "{\"status\":\"-1\",\"videoPath\":\"" + file_readme + "\"}";
        } catch (Exception e) {
            e.printStackTrace();
            return "{\"status\":\"-1\",\"videoPath\":\"\"}";
        } finally {
            dbc.closeConn();
        }
    }
}
