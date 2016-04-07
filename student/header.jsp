<%@ page import="com.baje.sz.util.RequestUtil" %><%--
  Created by IntelliJ IDEA.
  User: 78544
  Date: 3/29/2016
  Time: 10:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
    RequestUtil requestUtil=new RequestUtil(request);
    int type=requestUtil.getInt("type");
%>
<div class="headerbg_stu">
    <div class="header_stu">
        <div class="logo_stu">
            <a href="student_home.jsp"><img src="../front_style/images/logo1.png" alt="Logo" /></a>
        </div>
        <ul class="navbar_stu">
            <li <%=type==1?"class=\"active_stu\"":""%>><a href="student_home.jsp">首页</a></li>
            <li <%=type==2?"class=\"active_stu\"":""%>><a href="learning_guide.jsp">学习指导</a></li>
            <li <%=type==3?"class=\"active_stu\"":""%>><a href="test_history.jsp">考试记录</a></li>
            <li <%=type==4?"class=\"active_stu\"":""%>><a href="my_questions.jsp">我的提问</a></li>
            <div class="user_stu <%=type==5?"active_stu":""%>">
                <a href="st_personal.jsp">
                    <div class="user_stu_img"><img src="../front_style/images/user01.png"></div>
                    <div class="down_stu">个人中心</div>
                </a>
            </div>
        </ul>
        <div class="clear"></div>
    </div>
</div>
