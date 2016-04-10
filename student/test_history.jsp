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
<title>考试记录</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="../front_style/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../front_style/js/jquery.min.js"></script>
<script src="../front_style/js/showList.js" type="text/javascript"></script>
</head>

<body>
<!--=== Header ===-->
<jsp:include page="header.jsp">
    <jsp:param value="3" name="type"/>
</jsp:include>
<!--=== End Header ===-->

<div class="container">
  <div class="left_nav">
      <div class="operate">
        <ul id="juheweb">
        <h3>考试记录</h3>
          <li>
            <h5 class="selected"><a href="test_history.html">未参加的考试</a></h5>
          </li>
          <li >
            <h5><a href="test_history2.html">已参加的考试</a></h5>
          </li>
        </ul>
        <script type="text/javascript" language="javascript">
			navList(12);
		</script>
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
        <div class="kaoshi1">
        	<div class="kaoshi_left">
        		<h3>考试名称</h3>
            	<div><em>考试时长：100分钟</em><em>参考人员：全体学员</em><em>总分：100分</em></div>
            </div>
            <div class="kaoshi_right"><a href="take_test.html">马上考试</a></div>
            <div class="clear"></div>
        </div>
        <div class="kaoshi1">
        	<div class="kaoshi_left">
        		<h3>考试名称</h3>
            	<div><em>考试时长：100分钟</em><em>参考人员：全体学员</em><em>总分：100分</em></div>
            </div>
            <div class="kaoshi_right"><a href="take_test.html">马上考试</a></div>
            <div class="clear"></div>
        </div>   
        <div class="kaoshi1">
        	<div class="kaoshi_left">
        		<h3>考试名称</h3>
            	<div><em>考试时长：100分钟</em><em>参考人员：全体学员</em><em>总分：100分</em></div>
            </div>
            <div class="kaoshi_right"><a href="take_test.html">马上考试</a></div>
            <div class="clear"></div>
        </div>   
     </div>
  </div>
  <div class="clear"></div>
</div>


<div class="footer">
    <div class="footer_con">
        <ul class="footer_nav">
            <li><a href="about.html">关于我们</a></li>
            <li><a href="st_using_instructions.html">平台使用手册</a></li>
            <li><a href="contact.html">联系我们</a></li>
            <li><a href="st_feedback.html">投诉&反馈 </a></li>
            <div class="clear"></div>
        </ul>
        <p>Copyright © 2012 深圳市派司德科技有限公司 All Rights Reserved 粤ICP备09008542号</p>
    </div>
</div>




</body>
</html>
