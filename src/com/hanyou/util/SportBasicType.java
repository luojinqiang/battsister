package com.hanyou.util;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.util.Doc;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by haihui on 2015-06-02.
 */
public class SportBasicType {
    /**
     * 获取运功类型
     *
     * @param type
     * @return
     */
    public static String getSportType(int type) {
        if (type == 1) {
            return "走路";
        } else if (type == 2) {
            return "跑步";
        } else if (type == 3) {
            return "骑车";
        } else if (type == 4) {
            return "爬楼梯";
        } else if (type == 5) {
            return "游泳";
        } else if (type == 6) {
            return "爬山";
        } else if (type == 7) {
            return "兵乓球";
        } else if (type == 8) {
            return "羽毛球";
        } else if (type == 9) {
            return "瑜伽";
        } else if (type == 10) {
            return "篮球";
        } else if (type == 11) {
            return "网球";
        } else if (type == 12) {
            return "足球";
        } else if (type == 13) {
            return "跳舞";
        } else if (type == 14) {
            return "滑轮";
        } else if (type == 15) {
            return "健身操";
        } else if (type == 16) {
            return "跳绳";
        } else if (type == 17) {
            return "高尔夫";
        } else if (type == 18) {
            return "棒球";
        } else if (type == 19) {
            return "壁球";
        } else if (type == 20) {
            return "保龄";
        } else if (type == 21) {
            return "划船";
        } else if (type == 22) {
            return "拳击";
        } else if (type == 23) {
            return "飞镖";
        } else if (type == 24) {
            return "跳水";
        } else if (type == 25) {
            return "排球";
        } else if (type == 26) {
            return "滑雪";
        } else if (type == 27) {
            return "击剑";
        } else if (type == 28) {
            return "橄榄球";
        } else if (type == 29) {
            return "飞盘";
        } else if (type == 30) {
            return "板球";
        } else if (type == 31) {
            return "门球";
        } else if (type == 32) {
            return "冰壶";
        } else if (type == 33) {
            return "单板滑雪";
        } else if (type == 34) {
            return "冲浪";
        } else {
            return "其他";
        }
    }

    /**
     * 获取运功类型列表
     *
     * @return
     */
    public static List getSportTypeList() {
        List backlist = new ArrayList();
        try {
            for (int i = 1; i < 35; i++) {
                Doc doc = new Doc();
                doc.put("id", i);
                doc.put("classname", getSportType(i));
                backlist.add(doc);
            }
            return backlist;
        } catch (Exception e) {
            com.baje.sz.ajax.LogUtility.log(e, "getSportTypeList，查询LIST");
            return backlist;
        }

    }

    /**
     * 根据运动的类型，获取一分钟消耗kcal的兑换
     *
     * @param type
     * @return
     */
    public static double getSportTypeDuiHuan(int type) {
        if (type == 1) {//走路
            return 2.80;
        } else if (type == 2) {//跑步
            return 6.70;
        } else if (type == 3) {//骑车
            return 5.80;
        } else if (type == 4) {//爬楼梯
            return 5.00;
        } else if (type == 5) {//游泳
            return 8.30;
        } else if (type == 6) {//爬山
            return 6.30;
        } else if (type == 7) {//兵乓球
            return 3.30;
        } else if (type == 8) {//羽毛球
            return 3.80;
        } else if (type == 9) {//瑜伽
            return 3.30;
        } else if (type == 10) {//篮球
            return 5.00;
        } else if (type == 11) {//网球
            return 5.80;
        } else if (type == 12) {//足球
            return 5.80;
        } else if (type == 13) {//跳舞
            return 3.60;
        } else if (type == 14) {//滑轮
            return 10.00;
        } else if (type == 15) {//健身操
            return 4.80;
        } else if (type == 16) {//跳绳
            return 8.30;
        } else if (type == 17) {//高尔夫
            return 3.80;
        } else if (type == 18) {//棒球
            return 4.20;
        } else if (type == 19) {//壁球
            return 10.00;
        } else if (type == 20) {//保龄
            return 2.50;
        } else if (type == 21) {//划船
            return 2.10;
        } else if (type == 22) {//拳击
            return 7.50;
        } else if (type == 23) {//飞镖
            return 2.10;
        } else if (type == 24) {//跳水
            return 2.50;
        } else if (type == 25) {//排球
            return 4.60;
        } else if (type == 26) {//滑雪
            return 5.00;
        } else if (type == 27) {//击剑
            return 5.00;
        } else if (type == 28) {//橄榄球
            return 6.70;
        } else if (type == 29) {//飞盘
            return 2.50;
        } else if (type == 30) {//板球
            return 4.20;
        } else if (type == 31) {//门球
            return 2.10;
        } else if (type == 32) {//冰壶
            return 3.30;
        } else if (type == 33) {//单板滑雪
            return 4.20;
        } else if (type == 34) {//冲浪
            return 2.50;
        } else {//其他
            return 2.80;
        }
    }

    /**
     * 获取步幅
     *
     * @param hight
     * @return
     */
    public static int getBufu(int hight) {
        int hight1 = 0;
        if (hight == 0) {
            hight1 = 60;
        } else {
            hight1 = hight;
        }

        return Integer.valueOf(AjaxXml.getInt(String.valueOf(hight1 * 0.416), "0"));
    }

    /**
     * 获取bmi
     *
     * @param height
     * @param weight
     * @return
     */
    public static double getBMI(int height, double weight) {
        double bmi = 23.1;
        int heightlength = 0;
        if (height == 0) {
            heightlength = 60;
        } else {
            heightlength = height;
        }
        double weight1 = 0.0;
        if (weight == 0.0) {
            weight1 = 60.0;
        } else {
            weight1 = weight;
        }
        double heightdou = (double) heightlength / 100;
        bmi = weight / (heightdou * heightdou);
        bmi = AjaxXml.getDouble(AjaxXml.getInt(bmi + "", "#.00"));
        return bmi;
    }

    /**
     * 获取体形
     *
     * @param bmi
     * @return
     */
    public static String getBoby(double bmi) {

        double bmi1 = 0.0;
        if (bmi == 0.0) {
            bmi1 = 23.1;
        } else {
            bmi1 = bmi;
        }
        if (bmi1 < 18.5) {
            return "偏瘦";
        } else if (bmi1 >= 18.5 && bmi < 24) {
            return "标准";
        } else if (bmi1 >= 24 && bmi < 28) {
            return "超重";
        } else if (bmi1 >= 28) {
            return "肥胖";
        } else {
            return "";
        }
    }

    /**
     * 计算卡路里
     *
     * @param bushu
     * @param bufu
     * @param weight
     * @return
     */
    public static double getKcal(int bushu, int bufu, int weight) {
        int steplength = 0;
        if (bufu == 0) {
            steplength = 60;
        } else {
            steplength = bufu;
        }
        int weight1 = 0;
        if (weight == 0) {
            weight1 = 60;
        } else {
            weight1 = weight;
        }
        return bushu * steplength * weight1 * 6.530 * 0.000001;
    }

    /**
     * 计算步数
     *
     * @param kcal
     * @param bufu
     * @param weight
     * @return
     */
    public static int getBushu(double kcal, int bufu, int weight) {
        int steplength = 0;
        if (bufu == 0) {
            steplength = 60;
        } else {
            steplength = bufu;
        }
        int weight1 = 0;
        if (weight == 0) {
            weight1 = 60;
        } else {
            weight1 = weight;
        }
        return Integer.parseInt(new DecimalFormat("0").format(kcal / (steplength * weight1 * 6.530 * 0.000001)));
    }

    /**
     * 计算脂肪
     *
     * @param kcal
     * @return
     */
    public static double getFat(double kcal) {
        return kcal * 0.9;
    }


    /**
     * 计算行走距离,单位m
     *
     * @param bushu
     * @param bufu
     * @return
     */
    public static double getDistance(int bushu, int bufu) {
        int steplength = 0;
        if (bufu == 0) {
            steplength = 60;
        } else {
            steplength = bufu;
        }
        return bushu * steplength * 0.01;
    }

    public static void main(String[] args) {

    }

}
