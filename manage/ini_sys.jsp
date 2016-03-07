<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.baje.sz.util.*" %>
<%@ page import="com.baje.sz.ajax.*" %>
<%@page import="com.battsister.admin.sys.*" %>
<%
    request.setCharacterEncoding("utf-8");
    int user_id = 0;
    String user_name = "guest";
    String current_flags = (String)session.getAttribute("user_flag");
    int gym_group_id=0;
    Selectic utildb=new Selectic();
    int gym_id=0;
    if (current_flags!= null) {
    	 user_name = (String)session.getAttribute("user_name");
    	user_id =Integer.parseInt(String.valueOf(session.getAttribute("user_id")));
    } else {
        out.print("<script>");
        out.print("alert('请登录后再操作');");
        out.print("window.parent.location = '/manage/login.jsp'");
        out.print("</script>");
        return;
    }
%>