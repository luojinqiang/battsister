package com.hanyou.util;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.baje.sz.db.Base;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.baje.sz.ajax.AjaxDate;
import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.util.AppConf;
import com.baje.sz.util.DesEncrypter;
import com.baje.sz.util.Doc;
import com.baje.sz.util.KeyBean;
import com.baje.sz.util.RequestUtil;
import com.baje.sz.util.StringUtil;

public class SetupUtil {
    public static String getHostSr() throws Exception {
        return AppConf.getconf().get("apppichost");
    }

    public static String getPicHost(String path) throws Exception {
        if (path == null || path.equals("")) {
            return "";
        }
        String picHost = AppConf.getconf().get("apppichost");
        if (path.indexOf("http://") != 0) {
            path = picHost + path;
        }
        return path;
    }

    /*
     * 获取图片全地址小图
     */
    public static String getAllPicAddress(String path, String pictype) throws Exception {
        if (path.contains("http://")) {
            return path;
        }
        if (!pictype.equals("all")) {
            return path;
        }
        if (path == null || path.equals("")) {
            return "";
        }
        String picHost = AppConf.getconf().get("apppichost");
        String file_ext = path.substring(path.lastIndexOf(".") + 1, path.length());
        if (path.indexOf("http://") != 0) {
            path = picHost + path;
        }
        if ((path.indexOf(picHost) > -1 || path.indexOf("http://") < 0) && path.indexOf("_100.") < 0 && path.indexOf("_550.") < 0) {
            path = path.replaceAll("." + file_ext, "_100." + file_ext);
        }
        return path;
    }

    /**
     * 获取全址大/小图
     *
     * @param pic_path
     * @param type
     * @return
     * @throws Exception
     */
    public static String getpics(String pic_path, String type) throws Exception {
        if (pic_path.equals("")) {
            return "";
        }
        if (pic_path.contains("http://")) {
            return pic_path;
        }
        String appendStr = "_100";
        if (type.equals("B")) {
            appendStr = "_550";
        }
        String opath = pic_path;
        String path = pic_path;
        String ext = path.substring(path.lastIndexOf("."));
        path = path.substring(0, path.lastIndexOf("."));
        path = path + appendStr + ext;
        return getPicHost(path);
    }

    /*
     * 获取全地址
     */
    public static String getAllAddress(String path) throws Exception {
        String picHost = AppConf.getconf().get("webserver");
        if (path == null || path.equals("")) {
            return "";
        }
        if (path.indexOf("http://") != 0||path.indexOf("/upload")==0) {
            path = picHost + path;
        }
        return path;
    }

    /*
     * 按类型获取图片全地址小图
     */
    public static String getAllPicAddress(String path, String pictype, int daxiao) throws Exception {
        if (!pictype.equals("all")) {
            return path;
        }
        if (path == null || path.equals("")) {
            return "";
        }
        String picHost = AppConf.getconf().get("apppichost");
        if (picHost == null || picHost.equals("")) {
            picHost = "http://www.fitness-smart.com";
        }
        String file_ext = path.substring(path.lastIndexOf(".") + 1, path.length());
        if (path.indexOf("http://") != 0) {
            path = picHost + path;
        }
        if (daxiao != 0) {
            if ((path.indexOf(picHost) > -1 || path.indexOf("http://") < 0) && path.indexOf("_100.") < 0 && path.indexOf("_550.") < 0) {
                path = path.replaceAll("." + file_ext, "_" + daxiao + "." + file_ext);
            }
        }
        return path;
    }

    public static String getpic(String pic_path, String type) throws Exception {
        if (pic_path == null || pic_path.equals("")) {
            return "";
        }
        String appendStr = "_100";
        if (type.equals("B")) {
            appendStr = "_550";
        }
        String opath = pic_path;
        String path = pic_path;
        String ext = path.substring(path.lastIndexOf("."));
        path = path.substring(0, path.lastIndexOf("."));
        path = path + appendStr + ext;
        return path;
    }

    /**
     * 把pic1,pic2,pic3格式的图片转换为JSONArray
     *
     * @param pic_path
     * @param type
     * @return
     */
    public static JSONArray getPic2Array(String pic_path, String type) {
        String ajaxRequest = "";
        String logtitle = "获取图片列表";
        JSONArray picArray = new JSONArray();
        try {
            if (pic_path == null || pic_path.equals("")) {
                return null;
            }
            String appendStr = "_100";
            if (type.equals("B")) {
                appendStr = "_550";
            }
            String[] idArr = StringUtil.strs2array(pic_path, ",");
            if (idArr.length <= 0) {
                return picArray;
            }
            for (int i = 0; i < idArr.length; i++) {
                String opath = idArr[i];
                String path = idArr[i];
                String ext = path.substring(path.lastIndexOf("."));
                path = path.substring(0, path.lastIndexOf("."));
                path = path + appendStr + ext;
                JSONObject json = new JSONObject();
                json.put("pic_path", path);
                picArray.add(json);
            }
            return picArray;
        } catch (Exception e) {
            e.printStackTrace();
            //LogUtility.log(e, logtitle);
            return picArray;
        } finally {
        }
    }

    /**
     * 把pic1,pic2,pic3格式的图片转换为JSONArray
     *
     * @param pic_path(返回全地址)
     * @param type
     * @return
     */
    public static JSONArray getPic2ArrayAll(String pic_path, String type) {
        String ajaxRequest = "";
        String logtitle = "获取图片列表";
        JSONArray picArray = new JSONArray();
        try {
            if (pic_path == null || pic_path.equals("")) {
                return null;
            }
            String appendStr = "_100";
            if (type.equals("B")) {
                appendStr = "_550";
            }
            String[] idArr = StringUtil.strs2array(pic_path, ",");
            if (idArr.length <= 0) {
                return picArray;
            }
            String picHost = AppConf.getconf().get("apppichost");
            if (picHost == null || picHost.equals("")) {
                picHost = "http://www.fitness-smart.com";
            }
            for (int i = 0; i < idArr.length; i++) {
                String opath = idArr[i];
                String path = idArr[i];
                String ext = path.substring(path.lastIndexOf("."));
                path = path.substring(0, path.lastIndexOf("."));
                path = path + appendStr + ext;
                if (path.indexOf("http://") != 0) {
                    path = picHost + path;
                }
                JSONObject json = new JSONObject();
                json.put("pic_path", path);
                picArray.add(json);
            }
            return picArray;
        } catch (Exception e) {
            e.printStackTrace();
            //LogUtility.log(e, logtitle);
            return picArray;
        } finally {
        }
    }

    /*
     * 获取时间戳
     * datestr格式：YY04-MM-DD HH:MI:SS
     */
    public static int getTimestampSu(String datestr) {
        try {
            if (datestr.equals("") || datestr.equals("now")) {
                datestr = AjaxXml.Get_Date("now", "YY04-MM-DD HH:MI:SS");
            }
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = format.parse(datestr);
            return Integer.parseInt((date.getTime() / 1000) + "");
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    /*
     * 获取时间戳
     * datestr格式：YY04-MM-DD HH:MI:SS
     */
    public static long getTimestamp(String datestr) {
        try {
            if (datestr.equals("") || datestr.equals("now")) {
                datestr = AjaxXml.Get_Date("now", "YY04-MM-DD HH:MI:SS");
            }
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = format.parse(datestr);
            return date.getTime();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    /*
     * 时间戳转为时间格式
     */
    public static String timestamp2Date(String timestamp, String dateFormat) {
        try {
            if (timestamp.equals("0") || timestamp.equals("")) {
                return "";
            }
            Long getTimeStamp = Long.parseLong(timestamp);
            String date = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date(getTimeStamp));
            date = AjaxXml.Get_Date(date, dateFormat);
            return date;
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    public static double suGetPriceDis(int price, int wei) throws Exception {
        if (price == 0) {
            return 0;
        }
        double yuan = (double) price / 100;
        BigDecimal bg = new BigDecimal(yuan);
        yuan = bg.setScale(wei, BigDecimal.ROUND_HALF_UP).doubleValue();
        return yuan;
    }

    /*
     * \r转br
     */
    public static String r2br(String content) throws Exception {
        if (content.indexOf("\r") > -1) {
            content = content.replace("\r", "<br />");
            content = content.replace("\n", "");
        } else {
            if (content.indexOf("\n") > -1) {
                content = content.replace("\n", "<br />");
                content = content.replace("\r", "");
            }
        }
        return content;
    }

    public static String br2r(String content) throws Exception {
        if (content.indexOf("<br />") > -1) {
            content = content.replace("<br />", "\r");
        }
        return content;
    }

    /**
     * 判断系统类型关键字
     *
     * @param ru
     * @return
     * @throws Exception
     */
    public static boolean checkSysType(RequestUtil ru) throws Exception {
        String sys_type = ru.getString("sys_type");
        String des_sys_type = ru.getString("des_sys_type");
        if (sys_type.equals("") && des_sys_type.equals("")) {
            return true;
        }
        DesEncrypter des = new DesEncrypter(AppConf.getconf().get("privatekey"));
        KeyBean m = new KeyBean();
        String c_sys_type = m.getkeyBeanofStr(des.encrypt(sys_type)).toLowerCase();
        if (!des_sys_type.equals(c_sys_type)) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 判断系统类型关键字
     *
     * @return
     * @throws Exception
     */
    public static boolean checkSysType(String sys_type, String des_sys_type) throws Exception {
        if (sys_type.equals("") && sys_type.equals("")) {
            return true;
        }
        DesEncrypter des = new DesEncrypter(AppConf.getconf().get("privatekey"));
        KeyBean m = new KeyBean();
        String c_sys_type = m.getkeyBeanofStr(des.encrypt(sys_type)).toLowerCase();
        if (!des_sys_type.equals(c_sys_type)) {
            return false;
        } else {
            return true;
        }
    }

    /*
     * 指定double的位数获取
     */
    public static double getDouble(double value, int wei) throws Exception {
        BigDecimal bg = new BigDecimal(value);
        value = bg.setScale(wei, BigDecimal.ROUND_HALF_UP).doubleValue();
        return value;
    }

    /*
     * 指定double的位数获取
     */
    public static double getDouble(String value, int wei) throws Exception {
        BigDecimal bg = new BigDecimal(value);
        double back = 0;
        back = bg.setScale(wei, BigDecimal.ROUND_HALF_UP).doubleValue();
        return back;
    }

    /*
     * 获取问题显示的时间
     */
    public static String getTimeStr(String add_time) {
        AjaxDate ajdate = new AjaxDate();
        String time_str = "";
        int minute = ajdate.DateDiff("n", AjaxXml.Get_Date(add_time, "YY04-MM-DD HH:MI:SS"), "now");
        if (minute <= 60) {
            time_str = minute + "分钟前";
        } else if (minute > 60 && minute <= 120) {
            time_str = "1小时前";
        } else if (minute > 120 && minute <= 1440) {
            time_str = "今天";
        } else {
            time_str = AjaxXml.Get_Date(add_time, "YY04-MM-DD HH:MI:SS");
        }
        return time_str;
    }

    /*传一个字符串，按其中的一个值进行排序  [数字]
     * ordertype为1是倒序（重大到小），2为顺序（从小到大）
     * 
     */
    public static JSONArray sortJSONArray(JSONArray jsonArr, String key, int ordertype) throws Exception {
        JSONObject jObject = null;
        for (int i = jsonArr.size() - 1; i > 0; i--) {
            for (int j = 0; j < i; j++) {
                if (ordertype == 1) {
                    if (jsonArr.getJSONObject(j + 1).getInt(key) > jsonArr.getJSONObject(j).getInt(key)) {
                        jObject = jsonArr.getJSONObject(j);
                        jsonArr.set(j, jsonArr.getJSONObject(j + 1));
                        jsonArr.set(j + 1, jObject);
                    }
                } else {
                    if (jsonArr.getJSONObject(j + 1).getInt(key) < jsonArr.getJSONObject(j).getInt(key)) {
                        jObject = jsonArr.getJSONObject(j);
                        jsonArr.set(j, jsonArr.getJSONObject(j + 1));
                        jsonArr.set(j + 1, jObject);
                    }
                }

            }
        }

        return jsonArr;
    }

    /*传一个字符串，按其中的一个值进行排序  [时间]
 * ordertype为1是倒序（重大到小），2为顺序（从小到大）
 *
 */
    public static JSONArray sortJSONArray_time(JSONArray jsonArr, String key, int ordertype) throws Exception {
        JSONObject jObject;
        for (int i = jsonArr.size() - 1; i > 0; i--) {
            for (int j = 0; j < i; j++) {
                if (ordertype == 1) {
                    if (SetupUtil.getTimestampSu(jsonArr.getJSONObject(j + 1).getString(key)) >
                            SetupUtil.getTimestampSu(jsonArr.getJSONObject(j).getString(key))) {
                        jObject = jsonArr.getJSONObject(j);
                        jsonArr.set(j, jsonArr.getJSONObject(j + 1));
                        jsonArr.set(j + 1, jObject);
                    }
                } else {
                    if (SetupUtil.getTimestampSu(jsonArr.getJSONObject(j + 1).getString(key)) <
                            SetupUtil.getTimestampSu(jsonArr.getJSONObject(j).getString(key))) {
                        jObject = jsonArr.getJSONObject(j);
                        jsonArr.set(j, jsonArr.getJSONObject(j + 1));
                        jsonArr.set(j + 1, jObject);
                    }
                }
            }
        }
        return jsonArr;
    }

    /**
     * 得到网页中图片的地址
     */
    public static List getImgStr(String htmlStr) {
        String img = "";
        Pattern p_image;
        Matcher m_image;
        List<String> pics = new ArrayList<String>();
        String regEx_img = "<img.*src=(.*?)[^>]*?>"; //图片链接地址
        p_image = Pattern.compile
                (regEx_img, Pattern.CASE_INSENSITIVE);
        m_image = p_image.matcher(htmlStr);
        while (m_image.find()) {
            img = img + "," + m_image.group();
            Matcher m = Pattern.compile("src=\"?(.*?)(\"|>|\\s+)").matcher(img); //匹配src
            while (m.find()) {
                pics.add(m.group(1));
            }
        }
        return pics;
    }


  /*  public static void main(String[] args) {
        try {
            SetupUtil su = new SetupUtil();
            System.out.println(SetupUtil.getTimestampSu("2014-07-07 13:42:01"));


            DesEncrypter des = new DesEncrypter(AppConf.getconf().get("privatekey"));
            KeyBean m = new KeyBean();
            String c_sys_type = m.getkeyBeanofStr(des.encrypt("yibang")).toLowerCase();
            System.out.println(c_sys_type);
            JSONObject addjson = new JSONObject();
            JSONArray addarr = new JSONArray();
            addjson.put("a", "aa");
            addjson.put("b", 1);
            addarr.add(addjson);
            addjson = new JSONObject();
            addjson.put("a", "aa3");
            addjson.put("b", 3);
            addarr.add(addjson);
            addjson = new JSONObject();
            addjson.put("a", "aa2");
            addjson.put("b", 2);
            addarr.add(addjson);
            addjson = new JSONObject();
            addjson.put("a", "aa4");
            addjson.put("b", 4);
            addarr.add(addjson);
            addjson = new JSONObject();
            addjson.put("a", "aa6");
            addjson.put("b", 6);
            addarr.add(addjson);
            addjson = new JSONObject();
            addjson.put("a", "aa5");
            addjson.put("b", 5);
            addarr.add(addjson);
            addjson = new JSONObject();
            addjson.put("a", "aa11");
            addjson.put("b", 11);
            addarr.add(addjson);
            addjson = new JSONObject();
            addjson.put("a", "aa9");
            addjson.put("b", 9);
            addarr.add(addjson);
            System.out.println(SetupUtil.sortJSONArray(addarr, "b", 2).toString());
            long t = SetupUtil.getTimestamp("now");
            System.out.println("t=" + t);
            System.out.println(SetupUtil.timestamp2Date(t + "", "YY04-MM-DD HH:MI:SS"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }*/
}
