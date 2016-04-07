<%@page import="com.battsister.teacher.TeacherApi"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
RequestUtil ru=new RequestUtil(request);
String action=ru.getString("action");
if("add".equals(action)){
	out.print(new TeacherApi().addStudent(request));
	return;
}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>新增学员</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/front_style/js/jquery.min.js"></script>
</head>
<body>
<!-- 引入头部 -->
<jsp:include page="head.jsp">
	<jsp:param value="1" name="type"/>
</jsp:include>
<div class="container">
    <div class="info">
    	<a href="teacher_home.jsp">首页</a><em>></em><a href="student_management.jsp">学生管理</a><em>></em><a href="increase_students.jsp">新增学员</a>
    </div>
</div>
<div class="container">
	<div class="ex_wrap">
		<div class="title_r">新增学员</div>
        <div class="input_c">
            <div class="input_word">学号</div>
            <div class="input_text"><input name="username" type="text" class="input_k" placeholder="首次密码默认为学号"></div>
            <div class="clear"></div>
        </div>
        <!--  <div class="input_c">
            <div class="input_word">登录密码</div>
            <div class="input_text"><input name="password" type="password" class="input_k"  placeholder="******"></div>
            <div class="clear"></div>
        </div> -->
        <div class="input_c">
            <div class="input_word">姓名</div>
            <div class="input_text"><input name="name" type="text" class="input_k" placeholder="学生姓名"></div>
            <div class="clear"></div>
        </div>
        <div class="input_c">
            <div class="input_word">性别</div>
            <div class="input_text"><select name="sex" class="select_k" id="sex">
              <option value="1">男</option>
              <option value="2">女</option>
          </select></div>
            <div class="clear"></div>
        </div>
       <!--  <div class="input_c">
            <div class="input_word">年龄</div>
            <div class="input_text"><input name="" type="text" class="input_k"  placeholder="年龄"></div>
            <div class="clear"></div>
        </div> -->
        <div class="input_c">
            <div class="input_word">联系电话</div>
            <div class="input_text"><input name="mobile" type="text" class="input_k"  placeholder="联系电话"></div>
            <div class="clear"></div>
        </div>
        <div class="input_c">
            <div class="botton2"><a href="javascript:addStudent();">确认添加</a></div>
        </div>
    </div>	
</div>
<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>

<script type="text/javascript">
	function addStudent(){
		var username=$("input[name=username]").val();
		var name=$("input[name=name]").val();
		var sex=$("#sex").val();
		var mobile=$("input[name=mobile]").val();
		if(username==""||username==undefined){
			alert("请输入学生学号");
			return;
		}else{
			var pass_reg=/^[0-9a-zA-Z]*$/g;
			if(!pass_reg.test(username)){
				alert("学号只能为字母、数字");
				return false;
			}
		}
		if(name==""||name==undefined){
			alert("请输入学生姓名");
			return;
		}
		if(sex!=1&&sex!=2){
			alert("请选择学生性别");
			return;
		}
		if(mobile!=""&&mobile!=undefined){
			var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/; 
			if(!myreg.test(mobile)){
				alert("请输入正确格式的手机号");
				return false;
			}
		}
		$.ajax({ 
            dataType: "json",
            type: "post", 
            url: "increase_students.jsp",
            data: "action=add&name="+name+"&sex="+sex+"&mobile="+mobile+"&username="+username, 
            success: function (msg) {
                if (msg.type) {
                  	window.location.href='student_management.jsp';
                } else {
                    alert(msg.msg);
                }
            }
        });
	}
</script>
</body>
</html>
