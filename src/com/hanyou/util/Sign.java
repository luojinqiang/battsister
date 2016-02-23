package com.hanyou.util;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.util.AppConf;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.util.Map;
import java.util.SortedMap;

/**
 * 生成签名
 * Created by C.c on 2015/4/23.
 */
public class Sign {

    /**
     * 生成签名密钥
     *
     * @param request HttpServletRequest
     * @return String
     * @describe 加密串格式：请求方法大写（POST/GET）+ url + 请求参数 + 自定义加密串
     * secret 自定义加密串
     */
    public static String getSign(HttpServletRequest request) {
        String sign;
        String secret = AppConf.getconf().get("sign_secret");
        try {
            String params = AjaxXml.getParameterStr(request, "sign");
            if (!"".equals(params) && params.length() > 0) {
                params = URLDecoder.decode(params, "utf-8");
            }
            sign = DigestUtils.md5Hex((request.getMethod() + request.getRequestURL().toString() + params + secret).getBytes("utf8"));
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
        return sign;
    }

    /**
     * 获取签名(h5用)
     *
     * @param method
     * @param url
     * @param params
     * @return
     */
    public static String getSign(String method, String url, String params) {
        String sign;
        String secret = AppConf.getconf().get("sign_secret");
        try {
            params = URLDecoder.decode(params, "utf-8");
            url = AppConf.getconf().get("webserver") + url;
            sign = DigestUtils.md5Hex((method + url + params + secret).getBytes("utf8"));
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
        return sign;
    }

    public static boolean getBooleanSign(HttpServletRequest request) throws Exception {
        String filterParam = "sign"; //默认过滤的参数
        boolean signStatus = false;
        String secret = AppConf.getconf().get("sign_secret"); //自定义加密串
        try {
            //按a-z的顺序排序
            SortedMap<String, String> sortedMap = AjaxXml.getParameters(request, filterParam);
            StringBuilder finalBody = new StringBuilder();
            if (!sortedMap.isEmpty()) {
                for (Map.Entry entry : sortedMap.entrySet()) {
                    finalBody.append(entry.getKey()).append("=").append(entry.getValue()).append("&");
                }
            }
            if (finalBody.length() > 0) {
                finalBody = finalBody.deleteCharAt(finalBody.length() - 1);
            }
            String post_body = request.getMethod()
                    + request.getRequestURL().toString()
                    + URLDecoder.decode(finalBody.toString(), "UTF-8")
                    + secret;
            //System.out.println(post_body);
            //com.baje.sz.ajax.LogUtility.log("post_body:" + post_body);
            String sign = DigestUtils.md5Hex(post_body.getBytes("utf8"));
            //System.out.println("sign:"+sign);
            //com.baje.sz.ajax.LogUtility.log("sign:" + sign);
            if (sign.equals(request.getParameter(filterParam))) {
                signStatus = true;
            }
            //com.baje.sz.ajax.LogUtility.log("status:" + sign);
        } catch (Exception e) {
            e.printStackTrace();
            signStatus = false;
        }
        return signStatus;
    }

    public static boolean getBooleanSign(HttpServletRequest request, String filterParam, String signName) {
        boolean signStatus = false;
        String secret = AppConf.getconf().get("sign_secret"); //自定义加密串
        try {
            //按a-z的顺序排序
            SortedMap<String, String> sortedMap = AjaxXml.getParameters(request, filterParam);
            StringBuilder finalBody = new StringBuilder();
            if (!sortedMap.isEmpty()) {
                for (Map.Entry entry : sortedMap.entrySet()) {
                    finalBody.append(entry.getKey()).append("=").append(entry.getValue()).append("&");
                }
            }
            if (finalBody.length() > 0) {
                finalBody = finalBody.deleteCharAt(finalBody.length() - 1);
            }
            String post_body = request.getMethod()
                    + request.getRequestURL().toString()
                    + URLDecoder.decode(finalBody.toString(), "UTF-8")
                    + secret;
    /*		System.out.println(post_body);*/
            String sign = DigestUtils.md5Hex(post_body.getBytes("utf8"));
			/*System.out.println("sign:" + sign);*/
		/*	com.baje.sz.ajax.LogUtility.log("post_body:" + post_body);
			com.baje.sz.ajax.LogUtility.log("sign:" + sign);*/
            if (sign.equals(request.getParameter(signName))) {
                signStatus = true;
            }
            com.baje.sz.ajax.LogUtility.log("status:" + sign);
        } catch (Exception e) {
            e.printStackTrace();
            signStatus = false;
        }
        return signStatus;
    }

	/*public static void main(String[] args) {
		System.out.println(getSign("GET","http://bdzhaophone.com/action/twojson/shop/index.jsp", "userid=22112872")) ;
	}
*/
}
