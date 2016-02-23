package com.hanyou.timer;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.Doc;
import com.hanyou.util.HYJPush;


public class MemberBookRemain implements GessTimer {
    public void onTimeOut(String key) {
        //业务处理代码，判断用户是否付款
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        dbc.openConn("mysqlss");
        String logtitle = "用户提醒计时器";
        String ajaxRequest = "";
        try {
            base.setDbc(dbc);
            Doc shopDoc = base.executeQuery2Docs("select a.gym_group_id,a.people_num,a.gym_id,"
                    + "a.coach_id,a.mem_userid,a.book_type,a.book_date,a.book_start_time,a.sale_price,"
                    + "a.book_status,a.shop_id,b.coach_name,b.jg_push as 'bjg_push',c.jg_push as 'cjg_push',"
                    + "c.mobile_type,c.mem_name,d.gym_name,e.title from hy_gym_member_book a "
                    + "left join hy_coach b on a.coach_id=b.id "
                    + "left join hy_member c on a.mem_userid=c.id "
                    + "left join hy_gym d on a.gym_id=d.id "
                    + "left join hy_gym_course e on a.course_id=e.id"
                    + " where a.id=? and a.isdel=0 and book_status=0 limit 1", new Object[]{key}, 1)[0];
            if (shopDoc != null && !shopDoc.isEmpty()) {
                int type = 0;
                int type2 = 0;
                String title = "";
                String title2 = "";
                StringBuffer content = new StringBuffer("您预约的" + shopDoc.get("coach_name") + "教练" + AjaxXml.timeStamp2Date(shopDoc.getIn("book_date"), "YY04-MM-DD") + " " + (shopDoc.getIn("book_start_time") < 10 ? "0" + shopDoc.getIn("book_start_time") + ":00" : shopDoc.getIn("book_start_time") + ":00") + "在" + shopDoc.get("gym_name", "") + "健身房进行");
                StringBuffer content2 = new StringBuffer(URLDecoder.decode(shopDoc.get("mem_name", ""), "utf-8") + "预约您在" + AjaxXml.timeStamp2Date(shopDoc.getIn("book_date"), "YY04-MM-DD") + " " + (shopDoc.getIn("book_start_time") < 10 ? "0" + shopDoc.getIn("book_start_time") + ":00" : shopDoc.getIn("book_start_time") + ":00") + "时间");
                if (shopDoc.getIn("book_type") == 1) {
                    title = "私教预约提醒";
                    title2 = "会员预约私教提醒";
                    content.append("锻炼，请准时到达。");
                    content2.append("训练。");
                    type = 1105;
                    type2 = 2005;
                } else if (shopDoc.getIn("book_type") == 2) {
                    title = "团队私教预约提醒";
                    title2 = "会员预约团队私教提醒";
                    content.append(shopDoc.getIn("people_num") + "人" + shopDoc.get("title", "") + "课程，请准时到达。");
                    content2.append("课程。");
                    type = 1106;
                    type2 = 2006;
                } else if (shopDoc.getIn("book_type") == 4) {
                    title = "体测预约提醒";
                    title2 = "会员体测预约提醒";
                    type = 1104;
                    type2 = 2004;
                    content.append("体测，请准时到达");
                    content2.append("体测。");
                }
               /* HYPush hyPush = new HYPush();
                Map extras1 = new HashMap();
                extras1.put("type", type + "");
                extras1.put("userid", shopDoc.get("mem_userid") + "");
                hyPush.sentPushSingle(title, content.toString(), shopDoc.get("cjg_push"), shopDoc.getIn("mobile_type"), shopDoc.getIn("mem_userid"), 0, extras1, base);
                //推送教练
                Map extras2 = new HashMap();
                extras2.put("type", type2 + "");
                hyPush.sentPushSingle(title2, content2.toString(), shopDoc.get("bjg_push"), 2, shopDoc.getIn("mem_userid"), shopDoc.getIn("coach_id"), extras2, base);
                //hyjPush.sentAndriodNotification(title,content.toString(),shopDoc.get("cjg_push"), extras1, 1);
*/            }
            LogUtility.log("the book_remain is run !");
            GessTimerMgr.getInstance().removeTimer(key);
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest + "\r\n ");
        } finally {
            LogUtility.log("GessTimerMgr's connection is close !");
            dbc.closeConn();
        }

    }

    /**
     * 启动计时器
     *
     * @param book_id 预约的id
     * @param times   提醒时间
     * @param t       任务类
     */
    public void startTimer(String book_id, int times, MemberBookRemain t) {
        GessTimerMgr.getInstance().start();
        GessTimerMgr.getInstance().addTimer(book_id, t, times, 0);
    }
}

