<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	int type=ru.getInt("type");
	Object teacher_name=session.getAttribute("teacher_name");
%>
<div class="top_bg">
	<div class="top_con">
        <div class="top_nav">欢迎来到厚学网！<%=teacher_name!=null&&!"".equals(teacher_name)?"[<a href=\"/teacher/teacher_home.jsp\">"+teacher_name+"</a>]":"您尚未 [<a href=\"login.jsp\">登录</a>]"%></div>
        <!-- <div class="search">
        	<div class="search_botton"><a href="#">搜索</a></div>
            <input name="" type="text" class="input_search" placeholder="请输入您要搜索的内容">
            <div class="clear"></div>
        </div> -->
        <div class="clear"></div>
    </div>
</div>
<div class="headerbg">               
    <div class="header"> 
        <div class="logo">                                           
            <a href="index.jsp"><img src="/front_style/images/logo.png" alt="Logo" /></a>
        </div>                                               
         <ul class="navbar">
            <li <%=type==1?"class=\"active_index\"":""%>>
            	<a href="index.jsp">
                	<h3>首页</h3>
                    <p>home</p>
                </a>
            </li>
            <li class="em_line">|</li>
            <li  <%=type==2?"class=\"active_index\"":""%>>
            	<a href="news.jsp">
                	<h3>新闻动态</h3>
                    <p>news</p>
                </a>
            </li>
            <li class="em_line">|</li>
            <li <%=type==3?"class=\"active_index\"":""%>>
            	<a href="course.jsp">
                	<h3>课程推荐</h3>
                    <p>courses</p>
                </a>
            </li> 
            <li class="em_line">|</li>
            <li <%=type==4?"class=\"active_index\"":""%>>
            	<a href="industry_resources.jsp">
                	<h3>行业资源</h3>
                    <p>industry</p>
                </a>
            </li>
            <li class="em_line">|</li>
            <li <%=type==5?"class=\"active_index\"":""%>>
            	<a href="professional_resources.jsp">
                	<h3>专业资源</h3>
                    <p>professional</p>
                </a>
             </li>
            <li class="em_line">|</li>
            <li  <%=type==6?"class=\"active_index\"":""%>>
            	<a href="about.jsp">
                	<h3>关于我们</h3>
                    <p>about us</p>
                </a>
            </li>
        </ul>
        <div class="clear"></div>                
  </div>           
</div>   