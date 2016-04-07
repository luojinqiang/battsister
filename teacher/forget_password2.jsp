<%@page contentType="text/html; charset=utf-8" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>忘记密码</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
</head>
<body class="bg_white">
<div class="headerbg">
   <div class="header">
   		<div class="logo"><img src="/front_style/images/logo.png"></div>
        <div class="logo_info">忘记密码</div>
   </div>
</div>
<div class="container b_top">
	<div class="step_w">
        <div class="step">
            <img src="/front_style/images/step03.png">
        </div>
        <div class="default_test">
      	  <p>您的密码已修改成功</p>
          <div class="default_botton"><a href="/login.jsp">返回登录</a></div>
    	</div>
     </div>
</div>
<!-- 引入主尾部 -->
<jsp:include page="/front_footer.jsp"></jsp:include>
<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
