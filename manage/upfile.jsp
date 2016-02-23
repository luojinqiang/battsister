<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.hanyou.util.swfUpfile" %>
<%@ page import="com.soft4j.httpupload4j.SmartUpload" %>
<%
    int userid = 0;
    String user_name = "";
    request.setCharacterEncoding("utf-8");
    System.out.println("到这里");
    Cookie[] urscookies = request.getCookies();
//System.out.println(AjaxXml.getParameterStr(request)+"1ddd");
//out.println(ss.addfile(request,response,userid,user_name));
//out.println(ss.addfileFileUpLoad(request,response,userid,user_name));
//JSONObject paraJson=UpfileFileUpload.upGetJson(request);
//System.out.println(request.getParameter("aa1")+"ww");
    SmartUpload su = new SmartUpload();
    su.initialize(pageContext);
    try {
        su.upload();
        out.println(swfUpfile.fileUpload(su, pageContext, userid, user_name));
    } catch (Exception e) {
        e.printStackTrace();
    }
%>