<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="sys.jsp"%>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>学生首页</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="../front_style/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
<!--=== Header ===-->
<jsp:include page="header.jsp">
    <jsp:param value="1" name="type"/>
</jsp:include>

<!--=== End Header ===-->

<div class="container">
  <div class="left_side">
      <div class="side_user">
      	  <div class="side_user_img"><img src="../front_style/images/user.jpg"></div>
          <div class="side_user_word">
       	    <h4>晚上好，<%=student_name%></h4>
            <p>上次登录时间，<%=last_login_time%></p>
          </div>
          <div class="clear"></div>
      </div>
      <div class="side_tongdao">
       	  <div class="tongdao_t">快速通道</div> 
          <div class="tongdao_ul">
          	  <div class="tongdao_li1"><a href="take_test.jsp">参加考试</a></div>
              <div class="tongdao_li2"><a href="ask_question.jsp">快速提问</a></div>
          </div>  
      </div>
  </div>
  <div class="stu_w">
  	 <div class="stu_wrap">
     	<div class="title_d">未参加的考试</div>
       	<div class="kaoshi1">
        	<div class="kaoshi_left">
        		<h3>考试名称</h3>
            	<div><em>考试时长：100分钟</em><em>参考人员：全体学员</em><em>总分：100分</em></div>
            </div>
            <div class="kaoshi_right"><a href="take_test.html">马上考试</a></div>
            <div class="clear"></div>
        </div>   
     </div>
     <div class="stu_wrap">
     	<div class="title_d">已参加的考试<a href="test_history2.html">更多>></a></div>
       	<a href="test_history2.html"><div class="kaoshi1">
        	<div class="kaoshi_left">
        		<h3>考试名称</h3>
            	<div><em>考试时长：100分钟</em><em>参考人员：全体学员</em><em>总分：100分</em></div>
            </div>
            <div class="clear"></div>
       </div></a>
       <a href="test_history2.html"><div class="kaoshi1">
        	<div class="kaoshi_left">
        		<h3>考试名称</h3>
            	<div><em>考试时长：100分钟</em><em>参考人员：全体学员</em><em>总分：100分</em></div>
            </div>
            <div class="clear"></div>
       </div></a>
     </div>
  </div>
  <div class="clear"></div>
</div>

<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>
