package com.hanyou.util;

import java.util.HashMap;
import java.util.Map;

import cn.jpush.api.JPushClient;
import cn.jpush.api.common.resp.APIConnectionException;
import cn.jpush.api.common.resp.APIRequestException;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Message;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.audience.AudienceTarget;
import cn.jpush.api.push.model.notification.AndroidNotification;
import cn.jpush.api.push.model.notification.IosNotification;
import cn.jpush.api.push.model.notification.Notification;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.util.AppConf;


public class HYJPush {
    /**
     * @Description: 发送IOS消息
     * @param: @return
     * @param: @throws Exception
     * @return: int
     * @author XHQ
     */
    public static boolean sentIOSMessage(String title, String content, String jpush_regid, Map extra, int fromtype) throws Exception {
        PushPayload p = PushPayload.newBuilder()
                .setPlatform(Platform.ios())
                .setAudience(Audience.newBuilder()
                        .addAudienceTarget(AudienceTarget.registrationId(jpush_regid))
                        .build())
                .setMessage(Message.newBuilder()//{"sound":"default","badge":"1"}
                        .setMsgContent(content)
                        .addExtras(extra)
                        .build())
                .build();
        return jpushSendPushIOS(p, title, fromtype);
    }

    /**
     * @Description: 发送IOS通知
     * @param: @return
     * @param: @throws Exception
     * @return: int
     * @author XHQ
     */
    public static boolean sentIOSNotification(String title, String content, String jpush_regid, Map extra, int fromtype) throws Exception {
        PushPayload p = PushPayload.newBuilder()
                .setPlatform(Platform.ios())
                .setAudience(Audience.newBuilder()
                        .addAudienceTarget(AudienceTarget.registrationId(jpush_regid))
                        .build())//{"sound":"default","badge":"1"}
                .setNotification(Notification.newBuilder()
                        .addPlatformNotification(IosNotification.newBuilder()
                                .setAlert(content)//
                                //.setBadge(1)//角标
                                .setSound("default")//声音
                                .addExtras(extra)
                                .build())
                        .build())
                //.setOptions(Options.newBuilder()
                //        .setApnsProduction(false)//环境，默认为false开发环境,true表示生产环境
                //        .build())
                .build();
        return jpushSendPushIOS(p, title, fromtype);
    }

    /**
     * @Description: IOS发送推送
     * @param: @param p（PushPayload）
     * @param: @return
     * @return: int
     * @author XHQ
     */
    public static boolean jpushSendPushIOS(PushPayload p, String msgTitle, int fromtype) {
        String ios_appKey = "9f734504264d1f697ac5f7f8";
        String ios_masterSecret = "70c65fbf2fb84602756ad706";
    /*	if(fromtype==21){
			ios_appKey="cd83407afe262cf3f875222c";
			ios_masterSecret="0afff4cd12be1f20e4685b5d";
		}*/
        String jpush_ios = AppConf.getconf().get("jpushios");
        boolean jpush_hj = false;
        if (jpush_ios != null && jpush_ios.equals("true")) {
            jpush_hj = true;
        }
        System.out.println("jpush_hj=" + jpush_hj);
        JPushClient jpushClient = new JPushClient(ios_masterSecret, ios_appKey, jpush_hj, 86400);//第三个参数false表示测试环境
        boolean back = false;
        try {
            PushResult result = jpushClient.sendPush(p);
            if (result.isResultOK()) {
                back = true;
            } else {
                back = false;
            }
        } catch (APIConnectionException e) {
            e.printStackTrace();
        } catch (APIRequestException e) {
            LogUtility.log(e.getErrorCode() + "," + e.getStatus() + "," + e.getErrorMessage());
        }
        return back;
    }

    /**
     * 安卓发送消息
     *
     * @Description:
     * @param: @return
     * @return: int
     * @author XHQ
     */
    public static boolean sentAndriodMessage(String title, String content, String jpush_regid, Map extra, int fromtype) {
        try {

            PushPayload p = PushPayload.newBuilder().setPlatform(Platform.android())
                    .setAudience(Audience.registrationId(jpush_regid))
                    .setMessage(Message.newBuilder()
                            .setTitle(title.toString())
                            .setMsgContent(content.toString())
                            .addExtras(extra)
                            .build())
                    .build();
            return jpushSendPushAndroid(p, title, fromtype);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 安卓发送通知
     *
     * @Description:
     * @param: @return
     * @return: int
     * @author XHQ
     */
    public static boolean sentAndriodNotification(String title, String content, String jpush_regid, Map extra, int fromtype) {
        try {
            PushPayload p = PushPayload.newBuilder().setPlatform(Platform.android())
                    .setAudience(Audience.newBuilder()
                            .addAudienceTarget(AudienceTarget.registrationId(jpush_regid))
                            .build())//{"sound":"default","badge":"1"}
                    .setNotification(Notification.newBuilder()
                            .addPlatformNotification(AndroidNotification.newBuilder()
                                    .setAlert(content)
                                    .setTitle(title)
                                    .addExtras(extra)
                                    .build())
                            .build())
                    .build();
            HYJPush hy = new HYJPush();
            return hy.jpushSendPushAndroid(p, title, fromtype);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * @Description: 安卓发送消息
     * @param: @param p（PushPayload）
     * @param: @return
     * @return: int
     * @author XHQ
     */
    public static boolean jpushSendPushAndroid(PushPayload p, String msgTitle, int fromtype) {
        String android_appKey = "9f734504264d1f697ac5f7f8";
        String android_masterSecret = "70c65fbf2fb84602756ad706";
        String jpush_ios = AppConf.getconf().get("jpushios");
        boolean jpush_hj = false;
        if (jpush_ios != null && jpush_ios.equals("true")) {
            jpush_hj = true;
        }
        JPushClient jpushClient = new JPushClient(android_masterSecret, android_appKey);//第三个参数false表示测试环境
        boolean back = false;
        try {
            PushResult result = jpushClient.sendPush(p);
            if (result.isResultOK()) {
                back = true;
            } else {
                back = false;
            }
        } catch (APIConnectionException e) {
            LogUtility.log(e, "eeeee");
            e.printStackTrace();
        } catch (APIRequestException e) {
            LogUtility.log(e.getErrorCode() + "," + e.getStatus() + "," + e.getErrorMessage());
        }
        return back;
    }

    public static void main(String[] args) {
        try {
			/*Map extra=new HashMap();
			HYJPush hj=new HYJPush();
			System.out.println(hj.sentIOSNotification("动态体温", "IOS体温数位37.5ss22", "021cca99229", extra, 2));
			*/
            HYJPush hyjPush = new HYJPush();
            String contentString = "用户已经扫描二维码";
            String jg_id = "0802e6e1aac";
            Map extras1 = new HashMap();
            extras1.put("type", "1");
            extras1.put("target", "100");
            extras1.put("extension1", "1234");
            extras1.put("extension2", "1");
            extras1.put("extension3", "http://lpw.hanyouapp.com/action/userjson/device.jsp?action=setSportsData");
            extras1.put("datetime", AjaxXml.getTimestamp("") + "");
            hyjPush.sentAndriodMessage("乐跑屋", contentString, jg_id, extras1, 1);


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
