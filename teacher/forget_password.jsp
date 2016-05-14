<%@page import="com.battsister.teacher.TeacherApi"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	RequestUtil ru=new RequestUtil(request);
	String action=ru.getString("action");
	if("getVerify".equals(action)){
		TeacherApi teacherApi=new TeacherApi();
		out.print(teacherApi.getVerify(request));
		return;
	}
	if("checkVerify".equals(action)){
		TeacherApi teacherApi=new TeacherApi();
		out.print(teacherApi.checkVerify(request));
		return;
	}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>忘记密码</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/front_style/js/jquery.min.js"></script>
<script type="text/javascript"
            src="/manage/js/artDialog4.1.6/artDialog.js?skin=blue"></script>
<script type="text/javascript" src="/manage/js//artDialog4.1.6/plugins/iframeTools.source.js"></script>
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
            <img src="/front_style/images/step01.png">
        </div>
        <div class="input_c1">
                <input name="email" type="text" class="input_k1" placeholder="请输入教师预留电子邮箱">
                <div class="clear"></div>
      </div>
        <!-- <div class="input_c1">
            <input name="" type="text" class="input_k1" placeholder="请输入右边的验证码">
            <div class="code"><img src="images/user1.jpg" alt="验证码"></div>
            <div class="clear"></div>
        </div> -->
        <div class="input_c1">
            <input name="verify" type="text" class="input_k1" placeholder="验证码">
            <div class="botton3" onclick="getVerify();"><a href="javascript:void(0)" id="free">免费获取验证码</a></div>
            <div class="clear"></div>
        </div>
        <div class="input_c1">
            <div class="botton3 w_200"><a href="javascript:checkVerify();">下一步</a></div>
            <div class="clear"></div>
        </div>
     </div>
</div>
<!-- 引入主尾部 -->
<jsp:include page="/front_footer.jsp"></jsp:include>
<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
	function getVerify(){
		var email=$('input[name=email]').val();
		if(email==""||email==undefined){
			 art.dialog.alert("请输入预留电子邮箱");
			return;
		}
		 $.ajax({ 
             dataType: "json",
             type: "post", 
             url: "forget_password.jsp",
             data: "action=getVerify&email="+email,
             success: function (msg) {
                 if (msg.type) {
                	 alert(msg.msg);
                	 var i=60;
                	 $('#free').parent().attr("onclick","");
                	 $('#free').css("background-color","#CCC");
                	var interval=setInterval(function (){
                		 $('#free').text("发送成功"+(i--)+"s");
                		 if(i==0){
                			 clearInterval(interval);
                			 $('#free').css("background-color","#02a32e");
                			 $('#free').text("免费获取验证码");
                			 $('#free').parent().click(function(){
                				 getVerify();
                			 });
                		 }
                	 },1000);
                	 
                 } else {
                	 art.dialog.alert(msg.msg);
                 }
             }
         });
	}
	
	function checkVerify(){
		var verify=$('input[name=verify]').val();
		if(verify==""||verify==undefined){
			 art.dialog.alert("请输入验证码");
			return;
		}
		 $.ajax({ 
             dataType: "json",
             type: "post", 
             url: "forget_password.jsp",
             data: "action=checkVerify&verify="+verify,
             success: function (msg) {
                 if (msg.type) {
                	 window.location.href='forget_password1.jsp?verify='+verify;
                 } else {
                	 art.dialog.alert(msg.msg);
                 }
             }
         });
	}
</script>
</body>
</html>
