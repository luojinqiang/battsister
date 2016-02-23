package com.hanyou.util.smsSDK;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;


public class UtilHttpRequest {
    /**
     * 向指定URL发送GET方法的请求
     *
     * @param url   发送请求的URL
     * @param param 请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return URL 所代表远程资源的响应结果
     */
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
                    connection.getInputStream(), "utf-8"));
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

    /**
     * 向指定 URL 发送POST方法的请求
     *
     * @param url   发送请求的 URL
     * @param param 请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return 所代表远程资源的响应结果
     */
    public static String sendPost(String url, String param) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection conn = realUrl.openConnection();
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = new PrintWriter(conn.getOutputStream());
            // 发送请求参数
            out.print(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream(), "utf-8"));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送 POST 请求出现异常！" + e);
            e.printStackTrace();
        }
        //使用finally块来关闭输出流、输入流
        finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }


    public static String createMenu(String access_token, String user_define_menu) throws IOException {
        // String user_define_menu = "{\"button\":[{\"type\":\"click\",\"name\":\"项目管理\",\"key\":\"20_PROMANAGE\"},{\"type\":\"click\",\"name\":\"机构运作\",\"key\":\"30_ORGANIZATION\"},{\"name\":\"日常工作\",\"sub_button\":[{\"type\":\"click\",\"name\":\"待办工单\",\"key\":\"01_WAITING\"},{\"type\":\"click\",\"name\":\"已办工单\",\"key\":\"02_FINISH\"},{\"type\":\"click\",\"name\":\"我的工单\",\"key\":\"03_MYJOB\"},{\"type\":\"click\",\"name\":\"公告消息箱\",\"key\":\"04_MESSAGEBOX\"},{\"type\":\"click\",\"name\":\"签到\",\"key\":\"05_SIGN\"}]}]}";
        //此处改为自己想要的结构体，替换即可
        String message = "{\"errcode\":-11,\"errmsg\":\"异常错误\"}";
        String action = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=" + access_token;
        try {
            URL url = new URL(action);
            HttpURLConnection http = (HttpURLConnection) url.openConnection();

            http.setRequestMethod("POST");
            http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            http.setDoOutput(true);
            http.setDoInput(true);
            System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//连接超时30秒
            System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //读取超时30秒

            http.connect();
            OutputStream os = http.getOutputStream();
            os.write(user_define_menu.getBytes("UTF-8"));//传入参数
            os.flush();
            os.close();

            InputStream is = http.getInputStream();
            int size = is.available();
            byte[] jsonBytes = new byte[size];
            is.read(jsonBytes);
            message = new String(jsonBytes, "UTF-8");
            System.out.println(message);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return message;
    }

    /*
     * 查询用户所在分组
     * 
     */
    public static String getGroupId(String access_token, String user_openID) throws IOException {
        // String user_define_menu = "{\"button\":[{\"type\":\"click\",\"name\":\"项目管理\",\"key\":\"20_PROMANAGE\"},{\"type\":\"click\",\"name\":\"机构运作\",\"key\":\"30_ORGANIZATION\"},{\"name\":\"日常工作\",\"sub_button\":[{\"type\":\"click\",\"name\":\"待办工单\",\"key\":\"01_WAITING\"},{\"type\":\"click\",\"name\":\"已办工单\",\"key\":\"02_FINISH\"},{\"type\":\"click\",\"name\":\"我的工单\",\"key\":\"03_MYJOB\"},{\"type\":\"click\",\"name\":\"公告消息箱\",\"key\":\"04_MESSAGEBOX\"},{\"type\":\"click\",\"name\":\"签到\",\"key\":\"05_SIGN\"}]}]}";
        //此处改为自己想要的结构体，替换即可
        String message = "{\"errcode\":-11,\"errmsg\":\"异常错误\"}";
        String action = "https://api.weixin.qq.com/cgi-bin/groups/getid?access_token=" + access_token;
        try {
            URL url = new URL(action);
            HttpURLConnection http = (HttpURLConnection) url.openConnection();
            http.setRequestMethod("POST");
            http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            http.setDoOutput(true);
            http.setDoInput(true);
            System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//连接超时30秒
            System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //读取超时30秒

            http.connect();
            OutputStream os = http.getOutputStream();
            os.write(user_openID.getBytes("UTF-8"));//传入参数
            os.flush();
            os.close();

            InputStream is = http.getInputStream();
            int size = is.available();
            byte[] jsonBytes = new byte[size];
            is.read(jsonBytes);
            message = new String(jsonBytes, "UTF-8");
            System.out.println(message);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return message;
    }

    /*
     * 移动用户分组
     * param access_token
     * param user_openID
     */
    public static String updateGroupId(String access_token, String user_openID) throws IOException {
        // String user_define_menu = "{\"button\":[{\"type\":\"click\",\"name\":\"项目管理\",\"key\":\"20_PROMANAGE\"},{\"type\":\"click\",\"name\":\"机构运作\",\"key\":\"30_ORGANIZATION\"},{\"name\":\"日常工作\",\"sub_button\":[{\"type\":\"click\",\"name\":\"待办工单\",\"key\":\"01_WAITING\"},{\"type\":\"click\",\"name\":\"已办工单\",\"key\":\"02_FINISH\"},{\"type\":\"click\",\"name\":\"我的工单\",\"key\":\"03_MYJOB\"},{\"type\":\"click\",\"name\":\"公告消息箱\",\"key\":\"04_MESSAGEBOX\"},{\"type\":\"click\",\"name\":\"签到\",\"key\":\"05_SIGN\"}]}]}";
        //此处改为自己想要的结构体，替换即可
        String message = "{\"errcode\":-11,\"errmsg\":\"异常错误\"}";
        String action = "https://api.weixin.qq.com/cgi-bin/groups/members/update?access_token=" + access_token;
        try {
            URL url = new URL(action);
            HttpURLConnection http = (HttpURLConnection) url.openConnection();
            http.setRequestMethod("POST");
            http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            http.setDoOutput(true);
            http.setDoInput(true);
            System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//连接超时30秒
            System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //读取超时30秒

            http.connect();
            OutputStream os = http.getOutputStream();
            os.write(user_openID.getBytes("UTF-8"));//传入参数
            os.flush();
            os.close();

            InputStream is = http.getInputStream();
            int size = is.available();
            byte[] jsonBytes = new byte[size];
            is.read(jsonBytes);
            message = new String(jsonBytes, "UTF-8");
            System.out.println(message);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return message;
    }

    /*
     * 添加分组
     *
     */
    public static String addGroup(String access_token, String user_openID) throws IOException {
        // String user_define_menu = "{\"button\":[{\"type\":\"click\",\"name\":\"项目管理\",\"key\":\"20_PROMANAGE\"},{\"type\":\"click\",\"name\":\"机构运作\",\"key\":\"30_ORGANIZATION\"},{\"name\":\"日常工作\",\"sub_button\":[{\"type\":\"click\",\"name\":\"待办工单\",\"key\":\"01_WAITING\"},{\"type\":\"click\",\"name\":\"已办工单\",\"key\":\"02_FINISH\"},{\"type\":\"click\",\"name\":\"我的工单\",\"key\":\"03_MYJOB\"},{\"type\":\"click\",\"name\":\"公告消息箱\",\"key\":\"04_MESSAGEBOX\"},{\"type\":\"click\",\"name\":\"签到\",\"key\":\"05_SIGN\"}]}]}";
        //此处改为自己想要的结构体，替换即可
        String message = "{\"errcode\":-11,\"errmsg\":\"异常错误\"}";
        String action = "https://api.weixin.qq.com/cgi-bin/groups/create?access_token=" + access_token;
        try {
            URL url = new URL(action);
            HttpURLConnection http = (HttpURLConnection) url.openConnection();
            http.setRequestMethod("POST");
            http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            http.setDoOutput(true);
            http.setDoInput(true);
            System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//连接超时30秒
            System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //读取超时30秒

            http.connect();
            OutputStream os = http.getOutputStream();
            os.write(user_openID.getBytes("UTF-8"));//传入参数
            os.flush();
            os.close();

            InputStream is = http.getInputStream();
            int size = is.available();
            byte[] jsonBytes = new byte[size];
            is.read(jsonBytes);
            message = new String(jsonBytes, "UTF-8");
            System.out.println(message);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return message;
    }

    /*
     * 修改分组名
     *  
     */
    public static String updateGroupName(String access_token, String user_openID) throws IOException {
        // String user_define_menu = "{\"button\":[{\"type\":\"click\",\"name\":\"项目管理\",\"key\":\"20_PROMANAGE\"},{\"type\":\"click\",\"name\":\"机构运作\",\"key\":\"30_ORGANIZATION\"},{\"name\":\"日常工作\",\"sub_button\":[{\"type\":\"click\",\"name\":\"待办工单\",\"key\":\"01_WAITING\"},{\"type\":\"click\",\"name\":\"已办工单\",\"key\":\"02_FINISH\"},{\"type\":\"click\",\"name\":\"我的工单\",\"key\":\"03_MYJOB\"},{\"type\":\"click\",\"name\":\"公告消息箱\",\"key\":\"04_MESSAGEBOX\"},{\"type\":\"click\",\"name\":\"签到\",\"key\":\"05_SIGN\"}]}]}";
        //此处改为自己想要的结构体，替换即可
        String message = "{\"errcode\":-11,\"errmsg\":\"异常错误\"}";
        String action = "https://api.weixin.qq.com/cgi-bin/groups/update?access_token=" + access_token;
        try {
            URL url = new URL(action);
            HttpURLConnection http = (HttpURLConnection) url.openConnection();
            http.setRequestMethod("POST");
            http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            http.setDoOutput(true);
            http.setDoInput(true);
            System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//连接超时30秒
            System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //读取超时30秒

            http.connect();
            OutputStream os = http.getOutputStream();
            os.write(user_openID.getBytes("UTF-8"));//传入参数
            os.flush();
            os.close();

            InputStream is = http.getInputStream();
            int size = is.available();
            byte[] jsonBytes = new byte[size];
            is.read(jsonBytes);
            message = new String(jsonBytes, "UTF-8");
            System.out.println(message);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return message;
    }

    /*
     * 发送消息
     *
     */
    public static String sendMsg(String access_token, String user_openID) throws IOException {
        // String user_define_menu = "{\"button\":[{\"type\":\"click\",\"name\":\"项目管理\",\"key\":\"20_PROMANAGE\"},{\"type\":\"click\",\"name\":\"机构运作\",\"key\":\"30_ORGANIZATION\"},{\"name\":\"日常工作\",\"sub_button\":[{\"type\":\"click\",\"name\":\"待办工单\",\"key\":\"01_WAITING\"},{\"type\":\"click\",\"name\":\"已办工单\",\"key\":\"02_FINISH\"},{\"type\":\"click\",\"name\":\"我的工单\",\"key\":\"03_MYJOB\"},{\"type\":\"click\",\"name\":\"公告消息箱\",\"key\":\"04_MESSAGEBOX\"},{\"type\":\"click\",\"name\":\"签到\",\"key\":\"05_SIGN\"}]}]}";
        //此处改为自己想要的结构体，替换即可
        String message = "{\"errcode\":-11,\"errmsg\":\"异常错误\"}";
        String action = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=" + access_token;
        try {
            URL url = new URL(action);
            HttpURLConnection http = (HttpURLConnection) url.openConnection();
            http.setRequestMethod("POST");
            http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            http.setDoOutput(true);
            http.setDoInput(true);
            System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//连接超时30秒
            System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //读取超时30秒

            http.connect();
            OutputStream os = http.getOutputStream();
            os.write(user_openID.getBytes("UTF-8"));//传入参数
            os.flush();
            os.close();

            InputStream is = http.getInputStream();
            int size = is.available();
            byte[] jsonBytes = new byte[size];
            is.read(jsonBytes);
            message = new String(jsonBytes, "UTF-8");
            System.out.println(message);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return message;
    }
      /*
       * 自动绑定url token
       * 
       */

    public static String urlToken(String nurl, String param) throws IOException {
        // String user_define_menu = "{\"button\":[{\"type\":\"click\",\"name\":\"项目管理\",\"key\":\"20_PROMANAGE\"},{\"type\":\"click\",\"name\":\"机构运作\",\"key\":\"30_ORGANIZATION\"},{\"name\":\"日常工作\",\"sub_button\":[{\"type\":\"click\",\"name\":\"待办工单\",\"key\":\"01_WAITING\"},{\"type\":\"click\",\"name\":\"已办工单\",\"key\":\"02_FINISH\"},{\"type\":\"click\",\"name\":\"我的工单\",\"key\":\"03_MYJOB\"},{\"type\":\"click\",\"name\":\"公告消息箱\",\"key\":\"04_MESSAGEBOX\"},{\"type\":\"click\",\"name\":\"签到\",\"key\":\"05_SIGN\"}]}]}";
        //此处改为自己想要的结构体，替换即可
        String message = "{\"errcode\":-11,\"errmsg\":\"异常错误\"}";
        // String action = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token="+access_token;
        try {
            URL url = new URL(nurl);
            HttpURLConnection http = (HttpURLConnection) url.openConnection();
            http.setRequestMethod("POST");
            http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            http.setDoOutput(true);
            http.setDoInput(true);
            System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//连接超时30秒
            System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //读取超时30秒

            http.connect();
            OutputStream os = http.getOutputStream();
            os.write(param.getBytes("UTF-8"));//传入参数
            os.flush();
            os.close();

            InputStream is = http.getInputStream();
            int size = is.available();
            byte[] jsonBytes = new byte[size];
            is.read(jsonBytes);
            message = new String(jsonBytes, "UTF-8");
            System.out.println(message);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return message;
    }

    public static String Postweixin(String hosturl, String access_token, String user_define_menu) throws IOException {
        // String user_define_menu = "{\"button\":[{\"type\":\"click\",\"name\":\"项目管理\",\"key\":\"20_PROMANAGE\"},{\"type\":\"click\",\"name\":\"机构运作\",\"key\":\"30_ORGANIZATION\"},{\"name\":\"日常工作\",\"sub_button\":[{\"type\":\"click\",\"name\":\"待办工单\",\"key\":\"01_WAITING\"},{\"type\":\"click\",\"name\":\"已办工单\",\"key\":\"02_FINISH\"},{\"type\":\"click\",\"name\":\"我的工单\",\"key\":\"03_MYJOB\"},{\"type\":\"click\",\"name\":\"公告消息箱\",\"key\":\"04_MESSAGEBOX\"},{\"type\":\"click\",\"name\":\"签到\",\"key\":\"05_SIGN\"}]}]}";
        //此处改为自己想要的结构体，替换即可
        String message = "{\"errcode\":-11,\"errmsg\":\"异常错误\"}";
        String action = hosturl + "" + access_token;
        try {
            URL url = new URL(action);
            HttpURLConnection http = (HttpURLConnection) url.openConnection();

            http.setRequestMethod("POST");
            http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            http.setDoOutput(true);
            http.setDoInput(true);
            System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//连接超时30秒
            System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //读取超时30秒

            http.connect();
            OutputStream os = http.getOutputStream();
            os.write(user_define_menu.getBytes("UTF-8"));//传入参数
            os.flush();
            os.close();

            InputStream is = http.getInputStream();
            int size = is.available();
            byte[] jsonBytes = new byte[size];
            is.read(jsonBytes);
            message = new String(jsonBytes, "UTF-8");
            System.out.println(message);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return message;
    }


    public static String Sendtext(String access_token, String user_define_menu) throws IOException {
        // String user_define_menu = "{\"button\":[{\"type\":\"click\",\"name\":\"项目管理\",\"key\":\"20_PROMANAGE\"},{\"type\":\"click\",\"name\":\"机构运作\",\"key\":\"30_ORGANIZATION\"},{\"name\":\"日常工作\",\"sub_button\":[{\"type\":\"click\",\"name\":\"待办工单\",\"key\":\"01_WAITING\"},{\"type\":\"click\",\"name\":\"已办工单\",\"key\":\"02_FINISH\"},{\"type\":\"click\",\"name\":\"我的工单\",\"key\":\"03_MYJOB\"},{\"type\":\"click\",\"name\":\"公告消息箱\",\"key\":\"04_MESSAGEBOX\"},{\"type\":\"click\",\"name\":\"签到\",\"key\":\"05_SIGN\"}]}]}";
        //此处改为自己想要的结构体，替换即可
        String message = "{\"errcode\":-11,\"errmsg\":\"异常错误\"}";
        String action = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=" + access_token;
        try {
            URL url = new URL(action);
            HttpURLConnection http = (HttpURLConnection) url.openConnection();

            http.setRequestMethod("POST");
            http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            http.setDoOutput(true);
            http.setDoInput(true);
            System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//连接超时30秒
            System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //读取超时30秒

            http.connect();
            OutputStream os = http.getOutputStream();
            os.write(user_define_menu.getBytes("UTF-8"));//传入参数
            os.flush();
            os.close();

            InputStream is = http.getInputStream();
            int size = is.available();
            byte[] jsonBytes = new byte[size];
            is.read(jsonBytes);
            message = new String(jsonBytes, "UTF-8");
            System.out.println(message);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return message;
    }


    public static String createMenu2(String params, String accessToken) {

        StringBuffer bufferRes = new StringBuffer();

        try {

            //URL realUrl = new URL("https://api.weixin.qq.com/cgi-bin/menu/delete?access_token="+ accessToken);
            URL realUrl = new URL("https://api.weixin.qq.com/cgi-bin/menu/create?access_token=" + accessToken);

            HttpURLConnection conn = (HttpURLConnection) realUrl.openConnection();

            // 连接超时

            conn.setConnectTimeout(25000);

            // 读取超时 --服务器响应比较慢,增大时间

            conn.setReadTimeout(25000);

            HttpURLConnection.setFollowRedirects(true);

            // 请求方式

            conn.setRequestMethod("POST");

            conn.setDoOutput(true);

            conn.setDoInput(true);

            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0");

            conn.setRequestProperty("Referer", "https://api.weixin.qq.com/");

            conn.connect();

            // 获取URLConnection对象对应的输出流

            OutputStreamWriter out = new OutputStreamWriter(conn.getOutputStream());

            // 发送请求参数

            //out.write(URLEncoder.encode(params,"UTF-8"));

            out.write(params);

            out.flush();

            out.close();

            InputStream in = conn.getInputStream();

            BufferedReader read = new BufferedReader(new InputStreamReader(in, "UTF-8"));

            String valueString = null;

            while ((valueString = read.readLine()) != null) {

                bufferRes.append(valueString);

            }

            System.out.println(bufferRes.toString());

            in.close();

            if (conn != null) {

                // 关闭连接

                conn.disconnect();

            }
            return bufferRes.toString();
        } catch (Exception e) {

            e.printStackTrace();
            return "{\"errcode\":-11,\"errmsg\":\"异常错误\"}";
        }

    }


    public static void main(String[] args) {
        //发送 GET 请求
        String s = UtilHttpRequest.sendGet("http://localhost:6144/Home/RequestString", "key=123&v=456");
        System.out.println(s);

        //发送 POST 请求
        String sr = UtilHttpRequest.sendPost("http://localhost:6144/Home/RequestPostString", "key=123&v=456");
        System.out.println(sr);
    }
}