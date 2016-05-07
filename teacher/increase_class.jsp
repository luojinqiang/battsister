<%@page import="com.battsister.teacher.TeacherApi"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
RequestUtil ru=new RequestUtil(request);
String action=ru.getString("action");
if("edit".equals(action)){
	out.print(new TeacherApi().editClass(request));
	return;
}
int id=ru.getInt("class_id");
String class_name="";
if(id>0){
	Selectic selectic=new Selectic();
	Doc doc=selectic.Get_Doc("id,class_name","bs_class"," where isdel=0 and id=? ","mysqlss",new Object[]{id});
	if(doc!=null){
		class_name=doc.get("class_name");
	}
}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title><%=id>0?"编辑班级":"新增班级"%></title>
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
    	<a href="teacher_home.jsp">首页</a><em>></em><a href="student_management.jsp">学生管理</a><em>></em><a href="javascript:void(0)"><%=id>0?"编辑班级":"新增班级"%></a>
    </div>
</div>
<div class="container">
	<div class="ex_wrap">
		<div class="title_r"><%=id>0?"编辑班级":"新增班级"%></div>
        <div class="input_c">
            <div class="input_word">班级名称</div>
            <div class="input_text"><input name="class_name" value="<%=class_name%>" type="text" class="input_k" placeholder="请输入班级名称"></div>
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
		var class_name=$("input[name=class_name]").val();
		if(class_name==""||class_name==undefined){
			alert("请输入班级名称");
			return;
		}
		$.ajax({ 
            dataType: "json",
            type: "post", 
            url: "increase_class.jsp",
            data: "action=edit&class_name="+class_name+"&id=<%=id%>", 
            success: function (msg) {
                if (msg.type) {
                  	window.location.href='class_management.jsp';
                } else {
                    alert(msg.msg);
                }
            }
        });
	}
</script>
</body>
</html>
