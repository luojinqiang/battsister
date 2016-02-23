<%@page import="com.qiniu.util.UrlSafeBase64"%>
<%@page import="com.qiniu.util.StringMap"%>
<%@page import="com.qiniu.util.Auth"%>
<%@page import="com.qiniu.processing.OperationManager"%>
<%@page import="com.hanyou.util.BasicType"%>
<%@page import="net.sf.json.JSONArray" %>
<%@page import="net.sf.json.JSONObject" %>
<%@page import="java.util.List" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
%>
