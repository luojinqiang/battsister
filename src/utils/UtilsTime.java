package utils;

import org.junit.Test;

/**
 * Created by 78544 on 4/17/2016.
 */
public class UtilsTime {
    public static String change(int second) {
        int h = 0;
        int m = 0;
        int s = 0;
        int temp = second % 3600;
        if (second > 3600) {
            h = second / 3600;
            if (temp != 0) {
                if (temp > 60) {
                    m = temp / 60;
                    if (temp % 60 != 0) {
                        s = temp % 60;
                    }
                } else {
                    s = temp;
                }
            }
        } else {
            m = second / 60;
            if (second % 60 != 0) {
                s = second % 60;
            }
        }
        return "<em id=\"h\">" + h + "</em>:<em id=\"m\">" + m + "</em>:<em id=\"s\">" + s + "</em>";
    }

    @Test
    public void test() {
        System.out.println(secToTime(3600));
    }

    public static String secToTime(int time) {
        int hour = 0;
        int minute = 0;
        int second = 0;
        if (time <= 0)
            return "<em id=\"h\">" + unitFormat(hour) + "</em>:<em id=\"m\">" + unitFormat(minute) + "</em>:<em id=\"s\">" + unitFormat(second) + "</em>";
        else {
            minute = time / 60;
            if (minute < 60) {
                second = time % 60;
            } else {
                hour = minute / 60;
                if (hour > 99)
                    return "99:59:59";
                minute = minute % 60;
                second = time - hour * 3600 - minute * 60;
            }
        }
        return "<em id=\"h\">" + unitFormat(hour) + "</em>:<em id=\"m\">" + unitFormat(minute) + "</em>:<em id=\"s\">" + unitFormat(second) + "</em>";
    }

    public static String unitFormat(int i) {
        String retStr = null;
        if (i >= 0 && i < 10)
            retStr = "0" + Integer.toString(i);
        else
            retStr = "" + i;
        return retStr;
    }
}
