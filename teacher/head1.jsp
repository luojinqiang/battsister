<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page import="com.baje.sz.ajax.AjaxXml"%>
<%@page contentType="text/html; charset=utf-8" %>
<%
	int last_login_time=0;
	Object object=session.getAttribute("last_login_time");
	int now=Integer.parseInt(AjaxXml.Get_Date("now","HH"));
	String nowString="上午好";
	if(now>0&&now<9){
		nowString="早上好";
	}else if(now>12&&now<18){
		nowString="下午好";
	}else if(now>=18&&now<24){
		nowString="晚上好";
	}
%>
<div class="topbg">
	<div class="container">
    <!-- 	<div class="top_img"><img src="/front_style/images/user02.png"></div> -->
        <div class="top_word">
        	<div class="welcome"><%=nowString%>，<%=session.getAttribute("teacher_name")%></div>
            <div class="xuehao">账号：<%=session.getAttribute("teacher_username")%><a href="personal.jsp">修改个人资料</a><a href="using_instructions.jsp">平台使用手册</a><span>上次登录时间：<%=object!=null?object.toString():"首次登录"%></span></div>
        </div>
        <div class="clear"></div>
    </div>
</div>