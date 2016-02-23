package com.hanyou.util.smsSDK;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.HttpClientUtils;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.*;
import java.util.Map.Entry;

public class WebClient {
    /**
     * <pre>
     * 发送带参数的POST的HTTP请求
     * </pre>
     *
     * @param reqUrl     HTTP请求URL
     * @param parameters 参数映射表
     * @return HTTP响应的字符串
     */
    public String doPost(String reqUrl, Map<String, String> parameters,
                         String recvEncoding) throws Exception {
        HttpClient client = HttpClients.createDefault();

        HttpPost post = new HttpPost(reqUrl);
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        Iterator<Entry<String, String>> iterator = parameters.entrySet().iterator();
        while (iterator.hasNext()) {
            Entry<String, String> entry = iterator.next();
            nvps.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
        }
        post.setEntity(new UrlEncodedFormEntity(nvps, "gbk"));
        CloseableHttpResponse response = (CloseableHttpResponse) client.execute(post);
        HttpEntity clientEntity = response.getEntity();
        BufferedReader reader = new BufferedReader(new InputStreamReader(clientEntity.getContent()));
        String lines;
        StringBuilder sb = new StringBuilder();
        while ((lines = reader.readLine()) != null) {
            sb.append("\n" + lines);
        }
        HttpClientUtils.closeQuietly(response);
        HttpClientUtils.closeQuietly(client);
        return sb.toString();
    }

    /**
     * 通过get来访问url
     *
     * @param src 需要访问的url
     * @return
     * @throws Exception
     */
    public String doGet(String src) throws Exception {
        return doGet(src, "utf-8");
    }

    /**
     * 通过get来访问url
     *
     * @param src          需要访问的地址
     * @param outputencode 获取输出时的编码
     * @return
     * @throws Exception
     */
    public String doGet(String src, String outputencode)
            throws Exception {
        return doGet(src, outputencode, null);
    }

    /**
     * 通过get来访问url
     *
     * @param src          需要访问的地址
     * @param outputencode 获取输出时的编码
     * @param headers      需要添加的访问头信息
     * @return
     * @throws Exception
     */
    public String doGet(String src, String outputencode,
                        HashMap<String, String> headers) throws Exception {
        StringBuffer result = new StringBuffer();
        URL url = new URL(src);
        URLConnection connection = url.openConnection();
        BufferedReader in = null;
        try {
            if (headers != null) {
                Iterator<String> iterators = headers.keySet().iterator();
                while (iterators.hasNext()) {
                    String key = iterators.next();
                    connection.setRequestProperty(key, headers.get(key));
                }
            }
            connection.connect();
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream(), outputencode));
            String line;
            while ((line = in.readLine()) != null) {
                result.append("\n" + line);
            }
            return result.toString();
        } catch (Exception ex) {
            throw ex;
        } finally {
            if (in != null) {
                in.close();
            }
        }

    }

    public static String sendGet(String url, String param) {
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = url + "?" + param;
            //System.out.println(urlNameString);
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.addRequestProperty("Accept-Language", "en-us,en;q=0.5");
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
                //  System.out.println(key + "--->" + map.get(key));
            }
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream(), "gbk"));
            //System.out.println("utf-8");
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }
}
