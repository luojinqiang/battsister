<%@page import="com.battsister.teacher.TeacherApi"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	String action=ru.getString("action");
	if("login".equals(action)){
		int loginType=ru.getInt("loginType");
		if(loginType==0){
			out.print(new TeacherApi().checkTeacherLogin(request));
			return;
		}else if(loginType==1){
			
		}
	}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>登陆</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="front_style/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="front_style/js/jquery.min.js"></script>
<!--tab切换效果的js-->
<script type="text/javascript">
            $(function () {
                function tabs(tabTit, on, tabCon) {
                    $(tabCon).each(function () {
                        $(this).children().eq(0).show();
                    });
                    $(tabTit).each(function () {
                        $(this).children().eq(0).addClass(on);
                    });
                    $(tabTit).children().hover(function () {//鼠标“hover”的效果
                    	$("input[name=loginType]").val($(this).index());
                        $(this).addClass(on).siblings().removeClass(on);
                        var index = $(tabTit).children().index(this);
                        $(tabCon).children().eq(index).show().siblings().hide();
                    });
                }
                tabs(".tab-hd", "active", ".tab-bd");
                tabs(".tab-hd3", "active", ".tab-bd3");
            });
</script>
</head>

<body class="bg_white">

<div class="headerbg">
   <div class="header">
   		<div class="logo"><img src="front_style/images/logo.png"></div>
        <div class="logo_info">用户登录</div>
   </div>
</div>


<!-- <div class="header_bg">
   <div class="header_con">
   		<div class="logo_index"><img src="front_style/images/logo.png"></div>
        <div class="logo_info">用户登录</div>
   </div>
</div> -->

<div class="container b_top">
	<div class="login_img"><img src="front_style/images/login.jpg"></div>  
    <div class="login">
    	<div class="tab">
                <ul class="tab-hd">
                    <li>教师登录入口</li><li>学生登录入口</li>
                </ul>
                <ul class="tab-bd">
                    <li>
                        <div class="l_input">
                            <input name="teacher_name" type="text" class="input_txt account" placeholder="教师账号" />
                        </div>
                    	<div class="l_input">
                        <input name="teacher_password" type="password" class="input_txt pw" placeholder="密码" />
                    	</div>
                        <div class="botton_login fl"><a href="javascript:login();">登&nbsp;&nbsp;录</a></div>
                        <div class="color_grey l_input"><a href="forget_password.html">忘记密码？</a></div>	  
                    </li>
                    <li>
                       	<div class="l_input">
                        <input name="student_name" type="text" class="input_txt account" placeholder="学生账号" />
                    	</div>
                    	<div class="l_input">
                        	<input name="student_password" type="password" class="input_txt pw" placeholder="密码" />
                    	</div>
                       <div class="botton_login fl"><a href="student_home.html">登&nbsp;&nbsp;录</a></div>
                       <div class="color_grey l_input">忘记密码？请联系您的老师</div>	  
                  </li>
              </ul>
              <input type="hidden" name="loginType" value="0"/><!-- 登录类型，0是老师，1是学生 -->
           </div>
    </div>
    <div class="clear"></div>
</div>
<div class="bg_s5">
    <div class="container">
    	<div class="section5">
           <div class="s5_left">
                <div class="title_s5">联系我们</div>
                <h6>Get in  touch with us </h6>
                <p>深圳市派司德科技有限公司</p>
                <ul>
                	<li class="ic_ad">地址: 深圳市宝安区航空路索佳科技园商务大厦1层A101号</li>
                    <li class="ic_email">网址：http://www.battsister.com</li>
                    <li class="ic_tel">电话：0755-12345678</li>
                </ul>
           </div>
           <div class="s5_center">
          		<div class="title_s5">关注我们</div>
                <h6>Pay attention to us</h6>
                <p class="erweima"><img src="front_style/images/erweima.jpg"></p>
                <p>扫描关注微信</p>		
          </div>
         <!--   <div class="s5_right">
           		<div class="title_s5">留言板</div>
                <h6>message board</h6>
                <div class="s5_label">
                	<input name="" type="text" class="s5_text" placeholder="姓名">
                    <input name="" type="text" class="s5_text" placeholder="电话">
                    <textarea name="" cols="" rows="" class="s5_textarea">请输入</textarea>
                    <a href="#"><div class="s5_botton">提交</div></a>
                    <div class="clear"></div>
                </div>
           </div> -->
           <div class="clear"></div>
        </div>
    </div>
</div>
<div class="footer">
    <div class="footer_con b_top">
        <ul class="footer_nav">
            <li><a href="about.html">关于我们</a></li>
            <li><a href="contact.html">联系我们</a></li>
            <li><a href="#">网站地图</a></li>
            <div class="clear"></div>
        </ul>
        <p>Powered by EOS2011 © 2006-2013 深圳市汉优科技有限公司 粤ICP备13044128号-1</p>
    </div>
</div>
<script type="text/javascript">
	function login(){
		var loginType=$("input[name=loginType]").val();
		var loginName="";
		var loginPassword="";
		if(loginType==0){//教师登录
			loginName=$("input[name=teacher_name]").val();
			loginPassword=$("input[name=teacher_password]").val();
		}else if(loginType==1){//学生登录
			loginName=$("input[name=student_name]").val();
			loginPassword=$("input[name=student_password]").val();
		}
		if(loginName==undefined||loginName==""){
			alert("请输入登录账号");
			return;
		}
		if(loginPassword==undefined||loginPassword==""){
			alert("请输入登录密码");
			return;
		}
		 $.ajax({ 
             dataType: "json",
             type: "post", 
             url: "login.jsp",
             data: "action=login&loginType=" + loginType + "&loginName=" + loginName + "&loginPassword="+loginPassword, 
             success: function (msg) {
                 if (msg.type) {
                    if(loginType==0){//教师登录
                    	window.location.href='/teacher/teacher_home.jsp';
                    }else if(loginType==1){//学生登录
                    	
                    }
                 } else {
                     alert(msg.msg);
                 }
             }
         });
	}
</script>
</body>
</html>
