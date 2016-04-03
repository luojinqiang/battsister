<%@page import="com.battsister.teacher.TeacherApi"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	String action=ru.getString("action");
	if("setPass".equals(action)){
		TeacherApi teacherApi=new TeacherApi();
		out.print(teacherApi.setPass(request));
		return;
	}
	String verify=ru.getString("verify");
	Selectic selectic=new Selectic();
	Doc verifyDoc=selectic.Get_Doc("id", "bs_sms", " where isdel=0 and verify=? order by send_time desc limit 1","mysqlss",new Object[]{verify});
	if(verifyDoc==null||verifyDoc.isEmpty()){
		out.print("	<script>alert(\"验证码不正确\");window.location.href='/login.jsp';</script>");
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
            <img src="/front_style/images/step02.png">
        </div>
        <div class="input_c1">
                <input name="password" type="password" class="input_k1" placeholder="输入新的密码">
                <div class="clear"></div>
      </div>
        <div class="input_c1">
            <input name="password_comfirm" type="password" class="input_k1" placeholder="确认新密码">
            <div class="clear"></div>
        </div>
        <div class="input_c1">
            <div class="botton3 w_200"><a href="javascript:setPass();">完成</a></div>
            <div class="clear"></div>
        </div>
     </div>
</div>

<!-- 引入主尾部 -->
<jsp:include page="/front_footer.jsp"></jsp:include>
<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
	function setPass(){
		var pass=$('input[name=password]').val();
		var pass_comfirm=$('input[name=password_comfirm]').val();
		if(pass==""||pass==undefined){
			alert("请输入新密码");
			return;
		}
		var pass_reg=/^[0-9a-zA-Z]*$/g;
		if(!pass_reg.test(pass)){
			alert("密码只能为字母、数字");
			return false;
		}
		if(pass!=pass_comfirm){
			alert("两次输入密码不一致");
			return;
		}
		$.ajax({ 
            dataType: "json",
            type: "post", 
            url: "forget_password1.jsp",
            data: "action=setPass&verify=<%=verify%>&pass="+pass+"&pass_comfirm="+pass_comfirm,
            success: function (msg) {
                if (msg.type) {
               	 	window.location.href='forget_password2.jsp';
                } else {
                    alert(msg.msg);
                }
            }
        });
	}
</script>
</body>
</html>
