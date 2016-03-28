<%@page import="com.baje.sz.ajax.AjaxXml"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@ page contentType="text/html; charset=utf-8" %>
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
<link rel="stylesheet" href="/front_style/ppt_word/css/base.css">
<link rel="stylesheet" href="/front_style/ppt_word/css/MPreview.css">

</head>

<body>
<!-- 引入头部 -->
<jsp:include page="head.jsp">
	<jsp:param value="1" name="type"/>
</jsp:include>
<!-- 引入第二个头部 -->
<%@include file="head1.jsp" %>
<div class="container">
  <div class="left_nav">
      <div class="operate">
        <ul id="juheweb">
        <h3>课程体系</h3>
          <li>
            <h5 class="selected"><a href="teacher_home.jsp">课程标准</a></h5>
          </li>
          <li >
            <h5><a href="course_modules.jsp">课程模块</a></h5>
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
          <div class="wrapper">
        <div class="doc" id="doc" style="margin-left:-10px;width:800px;height:600px;margin-top:-30px;"></div>
	 </div>
	 <script type="text/javascript">
			var data=['/document/images/18-47-05_6642/test-0.png',
			          '/document/images/18-47-05_6642/test-1.png',
			          '/document/images/18-47-05_6642/test-2.png',
			          '/document/images/18-47-05_6642/test-3.png',
			          '/document/images/18-47-05_6642/test-4.png',
			          '/document/images/18-47-05_6642/test-5.png',
			          '/document/images/18-47-05_6642/test-6.png',
			          '/document/images/18-47-05_6642/test-7.png'];
		</script>
   <script type="text/javascript" src="/front_style/ppt_word/js/MPreview.js"></script>
   <script type="text/javascript">$('#doc').MPreview({ data: data });</script>
     </div>
  </div>
  <div class="clear"></div>
</div>
<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
