<%--
  Created by IntelliJ IDEA.
  User: 78544
  Date: 3/29/2016
  Time: 10:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
    Object student_id = session.getAttribute("student_id");
	Doc sDoc = new Selectic().Get_Doc("name,birth,sex,mobile,headpic", "bs_students", "where id=?", "mysqlss", new Object[]{student_id});
    if (student_id == null||sDoc==null||sDoc.isEmpty()) {
        out.print("	<script>alert(\"请先登录\");window.location.href='/login.jsp';</script>");
        return;
    }
    Object student_name = session.getAttribute("student_name");
    Object last_login_time = session.getAttribute("last_login_time");
    Object username = session.getAttribute("username");
    Object student_headpic=sDoc.get("headpic");
%>

