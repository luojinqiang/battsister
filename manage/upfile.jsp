<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.battsister.util.swfUpfile" %>
<%@ page import="com.soft4j.httpupload4j.SmartUpload" %>
<%
    int userid = 0;
    String user_name = "";
    request.setCharacterEncoding("utf-8");
    System.out.println("到这里");
    Cookie[] urscookies = request.getCookies();
    SmartUpload su = new SmartUpload();
    su.initialize(pageContext);
    try {
        su.upload();
        out.println(swfUpfile.fileUpload(su, pageContext, userid, user_name));
    } catch (Exception e) {
        e.printStackTrace();
    }
%>