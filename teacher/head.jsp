<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	int type=ru.getInt("type");
%>
<!--=== Header ===-->
<div class="headerbg_tea">               
    <div class="header_tea"> 
        <div class="logo_tea">                                           
            <a href="teacher_home.html"><img src="/front_style/images/logo.png" alt="Logo" /></a>
        </div>                                               
         <ul class="navbar_tea">
            <li <%=type==1?"class=\"active_tea\"":""%>><a href="teacher_home.jsp">我要备课</a></li>
            <li <%=type==2?"class=\"active_tea\"":""%>><a href="teaching.jsp">我要授课</a></li>
            <li <%=type==3?"class=\"active_tea\"":""%>><a href="practical_training.jsp">我要实训</a></li> 
            <li <%=type==4?"class=\"active_tea\"":""%>><a href="student_management.jsp">学生管理</a></li>
            <div class="user_tea<%=type==5?" active_tea":""%>">
                <a href="personal.jsp">
                <div class="user_tea_img"><img src="/front_style/images/user01.png"></div>
                <div class="down_tea">个人中心</div>
                </a>
            </div>             
        </ul>
        <div class="clear"></div>                  
  </div>           
</div>   
<!--=== End Header ===--><!--=== End Header ===-->
