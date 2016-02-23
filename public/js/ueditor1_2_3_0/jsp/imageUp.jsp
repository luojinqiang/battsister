<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="ueditor.UploaderFix" %>
<%@ page import="com.baje.sz.ajax.*" %>
<%@ page import="com.hanyou.util.Upfile" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    UploaderFix up = new UploaderFix(request);
    up.setSavePath("upload");
    String[] fileType = {".gif", ".png", ".jpg", ".jpeg", ".bmp"};
    up.setAllowFiles(fileType);
    up.setMaxSize(10000); //单位KB
    up.upload();
    System.out.println(up.getUrl());
    Upfile upfile = new Upfile();
    String backurl = upfile.optUpFile(up.getUrl());
    response.getWriter().print("{'original':'" + up.getOriginalName() + "','url':'" + up.getUrl() + "','title':'" + up.getTitle() + "','state':'" + up.getState() + "'}");
%>
