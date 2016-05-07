<%@page import="java.util.List"%>
<%@page import="com.battsister.teacher.TeacherApi"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
RequestUtil ru=new RequestUtil(request);
String action=ru.getString("action");
if("update".equals(action)){
	out.print(new TeacherApi().updateStudent(request));
	return;
}
int student_id=ru.getInt("student_id");
Object teacher_id=session.getAttribute("teacher_id");
Selectic selectic=new Selectic();
Doc studentDoc=selectic.Get_Doc("name,username,class_id,sex,mobile", "bs_students", " where id=? and teacher_id=? and isdel=0", "mysqlss",new Object[]{student_id,teacher_id});
if(studentDoc==null||studentDoc.isEmpty()){
	out.print("	<script>alert(\"该学生不存在\");window.location.href='/teacher/teacher_home.jsp';</script>");
	return;
}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>编辑学员</title>
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
<!-- 引入第二个头部 -->
<div class="container">
    <div class="info">
    	<a href="teacher_home.jsp">首页</a><em>></em><a href="student_management.jsp">学生管理</a><em>></em><a href="javascript:window.location.reload()">编辑学员</a>
    </div>
</div>
<div class="container">
	<div class="ex_wrap">
		<div class="title_r">新增学员</div>
		<div class="input_c">
            <div class="input_word">班级</div>
            <div class="input_text">
            <select name="class_id" id="class_id" class="select_k">
            <option value="0">--选择班级--</option>
            	<%
            		List<Doc> classList=selectic.Get_List("id,class_name","bs_class"," where isdel=0 and teacher_id=? ","mysqlss",new Object[]{teacher_id});
            		if(classList!=null){
            			for(Doc doc:classList){
            				out.print("<option value=\""+doc.getIn("id")+"\" "+(studentDoc.getIn("class_id")==doc.getIn("id")?"selected=\"selected\"":"")+">"+doc.get("class_name")+"</option>");
            			}
            		}
            	%>
           	</select>
            </div>
            <div class="clear"></div>
        </div>
        <div class="input_c">
            <div class="input_word">学号</div>
            <div class="input_text"><input name="username" value="<%=studentDoc.get("username")%>" type="text" class="input_k" placeholder="学生学号"></div>
            <div class="clear"></div>
        </div>
         <div class="input_c">
            <div class="input_word">登录密码</div>
            <div class="input_text"><input name="password" type="password" class="input_k"  placeholder="******"></div>
            <div class="clear"></div>
        </div> 
        <div class="input_c">
            <div class="input_word">姓名</div>
            <div class="input_text"><input name="name"  value="<%=studentDoc.get("name")%>" type="text" class="input_k" placeholder="学生姓名"></div>
            <div class="clear"></div>
        </div>
        <div class="input_c">
            <div class="input_word">性别</div>
            <div class="input_text"><select name="sex" class="select_k" id="sex">
              <option value="1" <%=studentDoc.getIn("sex")==1?"selected=\"selected\"":""%>>男</option>
              <option value="2" <%=studentDoc.getIn("sex")==2?"selected=\"selected\"":""%>>女</option>
          </select></div>
            <div class="clear"></div>
        </div>
        <div class="input_c">
            <div class="input_word">联系电话</div>
            <div class="input_text"><input name="mobile" value="<%=studentDoc.get("mobile")%>" type="text" class="input_k"  placeholder="联系电话"></div>
            <div class="clear"></div>
        </div>
        <div class="input_c">
            <div class="botton2"><a href="javascript:updateStudent();">确认修改</a></div>
        </div>
    </div>	
</div>
<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
	function updateStudent(){
		var username=$("input[name=username]").val();
		var name=$("input[name=name]").val();
		var sex=$("#sex").val();
		var mobile=$("input[name=mobile]").val();
		var password=$("input[name=password]").val();
		var class_id=$("#class_id").val();
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
		if(password!=""&&password!=undefined){
			var pass_reg=/^[0-9a-zA-Z]*$/g;
			if(!pass_reg.test(username)){
				alert("密码只能为字母、数字");
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
		if(class_id==0||class_id==undefined){
			alert("请选择班级");
			return;
		}
		$.ajax({ 
            dataType: "json",
            type: "post", 
            url: "update_students.jsp",
            data: "action=update&name="+name+"&sex="+sex+"&mobile="+mobile+"&username="+username+"&password="+password+"&student_id=<%=student_id%>&class_id="+class_id, 
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
