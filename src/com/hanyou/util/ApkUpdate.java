package com.hanyou.util;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import net.sf.json.JSONObject;

import org.xmlpull.v1.XmlPullParser;

import android.content.res.AXmlResourceParser;

/**
 * Created by Cc on 2014/10/12.
 */
public class ApkUpdate {
    public static JSONObject apk(String apkUrl) {
        int length;
        ZipFile zipFile;
        JSONObject backJson = new JSONObject();
        try {
            zipFile = new ZipFile(new File(apkUrl));
            //Enumeration enumeration = zipFile.getEntries();
            ZipEntry zipEntry = zipFile.getEntry(("AndroidManifest.xml"));
            AXmlResourceParser parser = new AXmlResourceParser();
            parser.open(zipFile.getInputStream(zipEntry));
            boolean flag = true;
            while (flag) {
                int type = parser.next();
                if (type == XmlPullParser.START_TAG) {
                    int count = parser.getAttributeCount();
                    for (int i = 0; i < count; i++) {
                        String name = parser.getAttributeName(i);
                        String value = parser.getAttributeValue(i);
                        if (value.contains("MAIN")) {
                            //System.out.println(name + "-----------" + value);
                            flag = false;
                            break;
                        } else if ("package".equals(name)) {
                            //System.out.println(name+"***"+value);
                        } else {
                            //System.out.println(name+"--->"+value);
                        }
                        if (name.equals("versionName")) {
                            System.out.println("versionName-->" + value);
                            backJson.put("versionName", value);
                        }
                        if (name.equals("versionCode")) {
                            System.out.println("versionCode-->" + value);
                            backJson.put("versionCode", value);
                        }
                    }//end for
                }
            }// end while
            backJson.put("type", true);
            backJson.put("msg", "获取成功");
            return backJson;
        } catch (Exception e) {
            e.printStackTrace();
            backJson.put("type", false);
            backJson.put("msg", "系统异常");
            return backJson;
        }
    }

    /**
     * 获取目录下所有文件(按时间排序)
     *
     * @param path
     * @return
     */
    public static List<File> getFileSort(String path, String markName) {
        List<File> list = getFiles(path, new ArrayList<File>(), markName);
        if (list.size() > 0) {
            Collections.sort(list, new Comparator<File>() {
                @Override
                public int compare(File file, File newFile) {
                    if (file.lastModified() < newFile.lastModified()) {
                        return 1;
                    } else if (file.lastModified() == newFile.lastModified()) {
                        return 0;
                    } else {
                        return -1;
                    }
                }
            });

        }
        return list;
    }

    /**
     * 获取目录下所有文件
     *
     * @param realpath
     * @param files
     * @return
     */
    public static List<File> getFiles(String realpath, List<File> files, String markName) {

        //System.out.println("在这里获取目录"+realpath+"下面的所文件");
        File realFile = new File(realpath);
        if (realFile.isDirectory()) {
            File[] subfiles = realFile.listFiles();
            for (File file : subfiles) {
                if (file.isDirectory()) {
                    getFiles(file.getAbsolutePath(), files, markName);
                } else {
                    if (file.getAbsolutePath().contains(markName)) {
                        files.add(file);
                    }
                }
            }
        }
        //System.out.println("没有排序的List-->"+files);
        return files;
    }

    public static void main(String[] args) throws Exception {
        //System.out.print(apk("d:/yishihu.apk"));
        ExtractAPK extractAPK = new ExtractAPK();
        System.out.println(extractAPK.getVersion("d:/yishihu.apk"));

        System.out.println("最新一条" + getFileSort("d:/test", "yishihu"));
    }
}
