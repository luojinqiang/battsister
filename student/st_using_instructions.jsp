<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
	String student_remark="";
	Selectic selectic=new Selectic();
	Doc infoDoc=selectic.Get_Doc("student_remark", "bs_info", "","mysqlss");
	if(infoDoc!=null){
		student_remark=infoDoc.get("student_remark");
	}
%>
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
<!--=== Header ===-->
<jsp:include page="header.jsp">
    <jsp:param value="5" name="type"/>
</jsp:include>
<!--=== End Header ===-->

<div class="container">
    <div class="info">
    	<a href="student_home.html">首页</a><em>></em><a href="st_personal.jsp">个人中心</a><em>></em><a href="st_using_instructions.jsp">平台使用手册</a>
    </div>
</div>


<div class="container">
	    <jsp:include page="user_left.jsp">
        <jsp:param value="3" name="type"/>
    </jsp:include>
    <div class="right_w mt_none">
    	<div class="title_r">平台使用手册</div>
    	<div style="padding-left: 10px;padding-right: 10px; ">
    	<%=student_remark%>
    	</div>
    </div>
    <div class="clear"></div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
