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
    if("getTeachers".equals(action)){//获取学校下的老师
    	int school_id=ru.getInt("school_id");
         JSONArray ja = new JSONArray();
         List<Doc> list = utildb.Get_List("id,name", "bs_teachers", " where isdel=0 and school_id=?", "", new Object[]{school_id});
         if (list != null) {
             for (Doc doc : list) {
                 JSONObject json = new JSONObject();
                 json.put("id", doc.get("id", ""));
                 json.put("teacher_name", doc.get("name", ""));
                 ja.add(json);
             }
         }
         JSONObject backjson = new JSONObject();
         backjson.put("type", true);
         backjson.put("dataJson", ja);
         out.print(backjson);
         return;
    }
%>
