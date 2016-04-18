<%@ page contentType="text/html; charset=utf-8" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>平台使用手册</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
<!-- 引入头部 -->
<jsp:include page="head.jsp">
	<jsp:param value="0" name="type"/>
</jsp:include>

<div class="container">
    <div class="info">
    	<a href="teacher_home.jsp">首页</a><em>></em><a href="personal.jsp">个人中心</a><em>></em><a href="using_instructions.jsp">平台使用手册</a>
    </div>
</div>
<div class="container">
	<div class="left_nav mt_none">
      <div class="operate">
        <ul id="juheweb">
          <li>
            <h5><a href="personal.jsp">个人资料</a></h5>
          </li>
          <li>
            <h5><a href="feedback.jsp">意见反馈</a></h5>
          </li>
          <li >
            <h5  class="selected"><a href="using_instructions.jsp">平台使用手册</a></h5>
          </li>
        </ul>
        <script type="text/javascript" language="javascript">
			navList(12);
		</script>
      </div>
  	</div>
    <div class="right_w mt_none">
    	<div class="title_r">平台使用手册</div>
        <div class="default">平台使用手册的内容暂时没有提供</div>
    </div>
    <div class="clear"></div>
</div>

<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
