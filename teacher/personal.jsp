<%@page import="com.battsister.teacher.TeacherApi"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	String action=ru.getString("action");
	if("update".equals(action)){//更新
		out.print(new TeacherApi().updateInfo(request));
		return;
	}
	Object teacher_id=session.getAttribute("teacher_id");
	Selectic selectic=new Selectic();
	if(teacher_id==null){
		out.print("	<script>alert(\"请先登录\");window.location.href='/login.jsp';</script>");
	}
	Doc teacherDoc=selectic.Get_Doc("name,username,sex,email", "bs_teachers", " where id=? ","mysqlss",new Object[]{teacher_id});
	if(teacherDoc==null||teacherDoc.isEmpty()){
		out.print("	<script>alert(\"请先登录\");window.location.href='/login.jsp';</script>");
		return;
	}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>个人中心</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/front_style/js/jquery.min.js"></script>
<script src="/front_style/js/showList.js" type="text/javascript"></script>
<script type="text/javascript"
            src="/manage/js/artDialog4.1.6/artDialog.js?skin=blue"></script>
<script type="text/javascript" src="/manage/js//artDialog4.1.6/plugins/iframeTools.source.js"></script>
</head>
<body>
<jsp:include page="head.jsp">
	<jsp:param value="5" name="type"/>
</jsp:include>
<div class="container">
    <div class="info">
    	<a href="teacher_home.jsp">首页</a><em>></em><a href="personal.jsp">个人中心</a><em>></em><a href="personal.jsp">个人资料</a>
    </div>
</div>
<div class="container">
	<div class="left_nav mt_none">
      <div class="operate">
        <ul id="juheweb">
          <li>
            <h5 class="selected"><a href="personal.jsp">个人资料</a></h5>
          </li>
          <li>
            <h5><a href="feedback.jsp">意见反馈</a></h5>
          </li>
          <li >
            <h5><a href="using_instructions.jsp">平台使用手册</a></h5>
          </li>
          <li >
            <h5><a href="/index.jsp?action=logOut">退出登录</a></h5>
          </li>
        </ul>
        <script type="text/javascript" language="javascript">
			navList(12);
		</script>
      </div>
  	</div>
    <div class="right_w mt_none">
        <div class="title_r">个人资料</div>
        <div class="input_c">
            <div class="input_word">账号</div>
            <div class="input_text"><input name="username" type="text" class="input_k" value="<%=teacherDoc.get("username")%>" placeholder="<%=teacherDoc.get("username")%>" readonly="readonly"></div>
            <div class="clear"></div>
        </div>
        <div class="input_c">
            <div class="input_word">姓名</div>
            <div class="input_text"><input name="name" type="text" value="<%=teacherDoc.get("name")%>" class="input_k" placeholder="<%=teacherDoc.get("name")%>"></div>
            <div class="clear"></div>
        </div>
        <div class="input_c">
            <div class="input_word">性别</div>
            <div class="input_text"><select name="sex" class="select_k" id="sex">
              <option <%=teacherDoc.getIn("sex")==1?"selected=\"selected\"":""%> value="1">男</option>
              <option <%=teacherDoc.getIn("sex")==2?"selected=\"selected\"":""%> value="2">女</option>
          </select></div>
            <div class="clear"></div>
        </div>
       <!--  <div class="input_c">
            <div class="input_word">年龄</div>
            <div class="input_text"><input name="" type="text" class="input_k"  placeholder="23"></div>
            <div class="clear"></div>
        </div> -->
        <div class="input_c">
            <div class="input_word">邮箱地址</div>
            <div class="input_text"><input name="email" value="<%=teacherDoc.get("email")%>" type="text" class="input_k"  placeholder="<%=teacherDoc.get("email")%>"></div>
            <div class="clear"></div>
        </div>
        <div class="input_c">
            <div class="input_word">密码</div>
            <div class="input_text"><input name="password" type="password" class="input_k"  placeholder="不修改则不输入"></div>
            <div class="clear"></div>
        </div>
        <div class="input_c">
            <div class="input_word">确认密码</div>
            <div class="input_text"><input name="password_comfirm" type="password" class="input_k"  placeholder=""></div>
            <div class="clear"></div>
        </div>
        <div class="input_c">
            <div class="botton2"><a href="javascript:checkParam();">确认修改</a></div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<!-- 底部 -->
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
	function checkParam(){
		var name=$("input[name=name]").val();
		var sex=$("#sex").val();
		var email=$("input[name=email]").val();
		var password=$("input[name=password]").val();
		var password_comfirm=$("input[name=password_comfirm]").val();
		if(name==""||name==undefined){
			art.dialog.alert("请输入您的姓名");
			return;
		}
		if(name.length>20){
			art.dialog.alert("您的姓名似乎太长了点");
			return;
		}
		if(email==""||email==undefined){
			art.dialog.alert("请输入您的邮箱地址");
			return;
		}else{
			var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/; 
			if(!myreg.test(email)){
				art.dialog.alert("请输入正确格式的邮箱地址");
				return false;
			}
		}
		if(password!=""&&password!=undefined){
			var pass_reg=/^[0-9a-zA-Z]*$/g;
			if(!pass_reg.test(password)){
				art.dialog.alert("密码只能为字母、数字");
				return false;
			}
			if(password!=password_comfirm){
				art.dialog.alert("两次输入密码不一致");
				return false;
			}
		}
		$.ajax({ 
            dataType: "json",
            type: "post", 
            url: "personal.jsp",
            data: "action=update&name="+name+"&sex="+sex+"&email="+email+"&password="+password+"&password_comfirm="+password_comfirm, 
            success: function (msg) {
                if (msg.type) {
                  	alert("更新成功");
                  	if(password!=""&&password_comfirm!=""&&password==password_comfirm){
                  		window.location.href='/login.jsp';
                  	}else{
                  		window.location.href='teacher_home.jsp';
                  	}
                } else {
                	art.dialog.alert(msg.msg);
                }
            }
        });
	}

</script>

</body>
</html>
