<%@page import="com.baje.sz.ajax.AjaxXml"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%
	RequestUtil ru=new RequestUtil(request);
	int last_login_time=0;
	Object object=session.getAttribute("last_login_time");
	if(object!=null){
		String time_string=String.valueOf(object);
		if(time_string!=null&&!"".equals(time_string)){
			last_login_time=Integer.parseInt(time_string);
		}
	}
	int now=Integer.parseInt(AjaxXml.Get_Date("now","HH"));
	String nowString="上午好";
	if(now>5&&now<8){
		nowString="早上好";
	}else if(now>12&&now<18){
		nowString="晚上好";
	}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>我要授课</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/front_style/js/jquery.min.js"></script>
<script src="/front_style/js/showList.js" type="text/javascript"></script>

</head>

<body>
<jsp:include page="head.jsp">
	<jsp:param value="1" name="type"/>
</jsp:include>
<div class="topbg">
	<div class="container">
    	<div class="top_img"><img src="/front_style/images/user02.png"></div>
        <div class="top_word">
        	<div class="welcome"><%=nowString%>，<%=session.getAttribute("teacher_name")%></div>
            <div class="xuehao">账号：<%=session.getAttribute("username")%><a href="personal.jsp">修改个人资料</a><a href="using_instructions.html">平台使用手册</a><span>上次登录时间：<%=last_login_time>0?AjaxXml.timeStamp2Date(last_login_time, "YY04-MM-DD HH:MI:SS"):"首次登录"%></span></div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="container">
  <div class="left_nav">
      <div class="operate">
        <ul id="juheweb">
        <h3>课程体系</h3>
          <li>
            <h5 class="selected"><a href="teacher_home.html">课程标准</a></h5>
          </li>
          <li >
            <h5><a href="course_modules.html">课程模块</a></h5>
          </li>
         <h3>教学资源</h3>
          <li>
            <h4>课程模块1</h4>
            <div class="list-item none">
              <p><a href="teaching_resources.html" target="_blank">任务一  职业道德</a></p>
              <p><a href="teaching_resources.html" target="_blank">任务二  二手车鉴定评估基础</a></p>            </div>
          </li>
          <li >
            <h4>课程模块2</h4>
            <div class="list-item none">
              <p ><a href="teaching_resources.html" target="_blank">任务一  职业道德</a></p>
              <p ><a href="teaching_resources.html" target="_blank">任务二  二手车鉴定评估基础</a></p>
              <p ><a href="teaching_resources.html" target="_blank">任务三  职业道德</a></p>
            </div>
          </li>
          <h3>习题库</h3>
          <li>
            <h5><a href="exercises.html">习题库</a></h5>
          </li>
        </ul>
        <script type="text/javascript" language="javascript">
			navList(12);
		</script>
      </div>
  </div>
  <div class="right_w">
  	 <div class="title_r">课程标准</div>
  	 <div class="right_con">
          <div class="default">word文档显示课程标准</div>
     </div>
  </div>
  <div class="clear"></div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
