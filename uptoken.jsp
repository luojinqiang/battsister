<%@page import="com.battsister.util.BasicType"%>
<%@page import="com.qiniu.util.StringMap"%>
<%@page import="com.baje.sz.ajax.AjaxXml"%>
<%@page import="com.qiniu.util.UrlSafeBase64"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.qiniu.util.Auth"%>
<%@page import="com.baje.sz.util.AppConf"%>
<%@page import="com.qiniu.storage.UploadManager"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
UploadManager uploadManager=new UploadManager();
String AccessKey=AppConf.getconf().get("AccessKey");
String SecretKey=AppConf.getconf().get("SecretKey");
Auth auth=Auth.create(AccessKey,SecretKey);
 String file_name=AjaxXml.Get_Date("now", "YY04MMDDHHMISS_") + AjaxXml.Getrandom(4);
String token=auth.uploadToken(BasicType.space_name); 
JSONObject json=new JSONObject();
json.put("uptoken",token);
out.print(json);
%>