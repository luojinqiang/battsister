<%--
  Created by IntelliJ IDEA.
  User: 78544
  Date: 3/29/2016
  Time: 10:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
    Object student_id = session.getAttribute("student_id");
    Object student_name = session.getAttribute("student_name");
    Object last_login_time = session.getAttribute("last_login_time");
    Object username = session.getAttribute("username");
    if (student_id == null) {
        out.print("	<script>alert(\"请先登录\");window.location.href='/login.jsp';</script>");
        return;
    }
%>

