<%@ page import="com.baje.sz.util.RequestUtil" %><%--
  Created by IntelliJ IDEA.
  User: 78544
  Date: 3/29/2016
  Time: 10:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
    RequestUtil ru=new RequestUtil(request);
    int type=ru.getInt("type");
%>
<div class="left_nav mt_none">
    <div class="operate">
        <ul id="juheweb">
            <li>
                <h5 <%=type==1?"class=\"selected\"":""%>><a href="st_personal.jsp">个人资料</a></h5>
            </li>
            <li>
                <h5 <%=type==2?"class=\"selected\"":""%>><a href="st_feedback.jsp">意见反馈</a></h5>
            </li>
            <li >
                <h5 <%=type==3?"class=\"selected\"":""%>><a href="st_using_instructions.jsp">平台使用手册</a></h5>
            </li>
             <li >
                <h5><a href="/index.jsp?action=logOut">退出登录</a></h5>
            </li>
        </ul>
    </div>
</div>
