package com.hanyou.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * 日期工具类
 * 默认使用 "yyyy-MM-dd HH:mm:ss" 格式化日期
 *
 * @author EwinLive
 * @version1.0
 */
public class DateUtils {
    /**
     * 英文简写（默认）如：2010-12-01
     */
    public static String FORMAT_SHORT = "yyyy-MM-dd";

    /**
     * 英文全称  如：2010-12-01 23:15:06
     */
    public static String FORMAT_LONG = "yyyy-MM-dd HH:mm:ss";

    /**
     * 精确到毫秒的完整时间    如：yyyy-MM-dd HH:mm:ss.S
     */
    public static String FORMAT_FULL = "yyyy-MM-dd HH:mm:ss.S";

    /**
     * 中文简写  如：2010年12月01日
     */
    public static String FORMAT_SHORT_CN = "yyyy年MM月dd";

    /**
     * 中文全称  如：2010年12月01日  23时15分06秒
     */
    public static String FORMAT_LONG_CN = "yyyy年MM月dd日  HH时mm分ss秒";

    /**
     * 精确到毫秒的完整中文时间
     */
    public static String FORMAT_FULL_CN = "yyyy年MM月dd日  HH时mm分ss秒SSS毫秒";

    /**
     * 获得默认的 date pattern
     */
    public static String getDatePattern() {
        return FORMAT_LONG;
    }

    /**
     * 根据预设格式返回当前日期
     *
     * @return
     */
    public static String getNow() {
        return format(new Date());
    }

    /**
     * 根据用户格式返回当前日期
     *
     * @param format
     * @return
     */
    public static String getNow(String format) {
        return format(new Date(), format);
    }


    /**
     * 使用预设格式格式化日期
     *
     * @param date
     * @return
     */
    public static String format(Date date) {
        return format(date, getDatePattern());
    }

    /**
     * 使用用户格式格式化日期
     *
     * @param date    日期
     * @param pattern 日期格式
     * @return
     */
    public static String format(Date date, String pattern) {
        String returnValue = "";
        if (date != null) {
            SimpleDateFormat df = new SimpleDateFormat(pattern);
            returnValue = df.format(date);
        }
        return (returnValue);
    }

    /**
     * 使用预设格式提取字符串日期
     *
     * @param strDate 日期字符串
     * @return
     */
    public static Date parse(String strDate) {
        return parse(strDate, getDatePattern());
    }

    /**
     * 使用用户格式提取字符串日期
     *
     * @param strDate 日期字符串
     * @param pattern 日期格式
     * @return
     */
    public static Date parse(String strDate, String pattern) {
        SimpleDateFormat df = new SimpleDateFormat(pattern);
        try {
            return df.parse(strDate);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 使用用户格式提取字符串日期
     *
     * @param strDate 日期字符串
     * @param pattern 日期格式
     * @return
     */
    public static String parseDate(String strDate, String pattern) {
        SimpleDateFormat df = new SimpleDateFormat(pattern);
        try {
            return df.format(df.parse(strDate));
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }


    /**
     * 在日期上增加数个整月
     *
     * @param date 日期
     * @param n    要增加的月数
     * @return
     */
    public static Date addMonth(Date date, int n) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.MONTH, n);
        return cal.getTime();
    }

    /**
     * 在日期上增加天数
     *
     * @param date 日期
     * @param n    要增加的天数
     * @return
     */
    public static Date addDay(Date date, int n) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, n);
        return cal.getTime();
    }

    /**
     * 获取时间戳
     */
    public static String getTimeString() {
        SimpleDateFormat df = new SimpleDateFormat(FORMAT_FULL);
        Calendar calendar = Calendar.getInstance();
        return df.format(calendar.getTime());
    }

    /**
     * 获取日期年份
     *
     * @param date 日期
     * @return
     */
    public static String getYear(Date date) {
        return format(date).substring(0, 4);
    }

    /**
     * 按默认格式的字符串距离今天的天数
     *
     * @param date 日期字符串
     * @return
     */
    public static int countDays(String date) {
        long t = Calendar.getInstance().getTime().getTime();
        Calendar c = Calendar.getInstance();
        c.setTime(parse(date));
        long t1 = c.getTime().getTime();
        return (int) (t / 1000 - t1 / 1000) / 3600 / 24;
    }

    /**
     * 按用户格式字符串距离今天的天数
     *
     * @param date   日期字符串
     * @param format 日期格式
     * @return
     */
    public static int countDays(String date, String format) {
        long t = Calendar.getInstance().getTime().getTime();
        Calendar c = Calendar.getInstance();
        c.setTime(parse(date, format));
        long t1 = c.getTime().getTime();
        return (int) (t / 1000 - t1 / 1000) / 3600 / 24;
    }

    /**
     * 给出一个时间，得到小时
     */
    public static int getHourByDate(String currentDate) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date current = format.parse(currentDate);
            return current.getHours();
        } catch (ParseException e) {
            e.printStackTrace();
            System.out.println("得到小时数出错！");
            return 0;
        }
    }

    /**
     * 得到当前月份
     *
     * @return
     */
    public static int getCurMonth() {
        Calendar ca = Calendar.getInstance();
        int month = ca.get(Calendar.MONTH);
        return month + 1;
    }

    /**
     * 通过毫秒数转换为时间
     *
     * @return
     */
    public static String getDateTileByMillos(long modifiedTime) {
        Date d = new Date(modifiedTime);
        String strtile = format(d);
        return strtile;
    }

    /**
     * 得到当前年份
     */
    public static String getCurrentYear() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        String currYear = sdf.format(new Date());
        return currYear;
    }

    /**
     * 得到当前月的日列表
     *
     * @param month
     * @return
     */
    public static List<String> getMonthList(int month) {
        int year = 0;
        int day = 0;
        Calendar c = Calendar.getInstance();// 获得系统当前日期
        year = c.get(Calendar.YEAR);
        if (month < 1) {
            month = c.get(Calendar.MONTH) + 1;// 系统日期从0开始算起
        }
        day = c.get(Calendar.DAY_OF_MONTH);
        c.set(Calendar.YEAR, year);
        c.set(Calendar.MONTH, day - 1);// Java月份才0开始算
        int dateOfMonth = c.getActualMaximum(Calendar.DATE);
        System.out.println("当前年：" + year + " 当前月：" + month + " 当前天" + day);
        List<String> monthList = new ArrayList<String>();
        for (int i = 1; i <= dateOfMonth; i++) {
            System.out.println(year + "年" + month + "月" + i + "日");
            monthList.add(year + "年" + month + "月" + i + "日");
        }
        return monthList;
    }

    /**
     * 得到当前月初日期
     *
     * @param datae
     * @return
     */
    public static String getYueChu() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-DD");
        String datae = sdf.format(new Date());
        String[] strs = datae.split("-");
        String newstr = strs[0] + "-" + (Integer.parseInt(strs[1])) + "-" + "01";
        return newstr;
    }

    /**
     * 得到当前月月末
     *
     * @param datae
     * @return
     */
    public static String getYueMo(String datae) {
        String[] strs = datae.split("-");
        String newstr = strs[0] + "-" + strs[1] + "-" + "30";
        return newstr;
    }

    /**
     * 根据生日计算年龄
     */
    public static long getAgeByBirthDay(String birthDay) {
        long year = 0;
        try {
            Date date = new Date();
            Date mydate = parse(birthDay, "yyyy-MM-dd");
            long day = (date.getTime() - mydate.getTime()) / (24 * 60 * 60 * 1000) + 1;
            year = day / 365;
        } catch (Exception e) {
            year = 0;
        }
        return year;
    }

    /**
     * 传入一个时间判断是否与当前时间相等
     */
    public static boolean JudgeTimeEquals(String time) {
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
        String curTime = sdf.format(new Date());
        //System.out.println("当前时间是："+curTime+"  对比时间："+time);
        if (curTime.equals(time)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 返回1时代表传过来的时间比当前时间 小
     * 返回-1时代表传过来的时间比当前时间大
     *
     * @param sendDate
     * @return
     */
    public static int compare_date(String sendDate) {
        String nowTime = getNow("yyyy-MM-dd hh:mm");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        try {
            Date now = df.parse(nowTime);
            Date sdata = df.parse(sendDate);
            System.out.println("得到当前时间" + now.getTime());
            if (now.getTime() >= sdata.getTime()) {
                System.out.println("now 在sdata前");
                return 1;
            } else if (now.getTime() < sdata.getTime()) {
                System.out.println("dt1在dt2后");
                return -1;
            } else {
                return 0;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return 0;
    }

    /**
     * 获取当前日期是星期几<br>
     *
     * @param dt
     * @return 当前日期是星期几
     */
    public static String getWeekOfDate(Date dt) {
        String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
        Calendar cal = Calendar.getInstance();
        cal.setTime(dt);
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if (w < 0)
            w = 0;
        return weekDays[w];
    }


    /**
     * main方法测试
     *
     * @param args
     */
    public static void main(String[] args) {
        System.out.println(getWeekOfDate(new Date()));
    }
}

