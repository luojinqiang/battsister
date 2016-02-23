package com.hanyou.util.smsSDK;

import com.baje.sz.util.AppConf;

import java.net.URLEncoder;

public class ClientSDK {
    private static String baseurl = "http://221.122.112.136:8080/sms/";

    /**
     * @param username 用户名
     * @param password 密码
     * @param phone    发送手机号，如果发送多个手机号可用逗号隔开，每一批号码最多20个
     * @param content  发送内容
     * @return 如果返回值为0，则说明发送成功，如果返回其他值，则说明发送失败
     * @throws Exception
     */
    public static String sendSms(String phone, String content) throws Exception {
        String username = AppConf.getconf().get("sms_username");
        String password = AppConf.getconf().get("sms_password");
/*		System.out.println("username--->"+username);
        System.out.println("password--->"+password);
		System.out.println("phone--->"+phone);*/
        System.out.println("content:" + content);
        String resualt = WebClient.sendGet(baseurl + "mt.jsp", "cpName=" + username
                + "&cpPwd=" + password + "&phones=" + phone + "&msg="
                + URLEncoder.encode(content, "gbk"));
        System.out.println("resualt--->" + resualt);
        return resualt;
    }
}
