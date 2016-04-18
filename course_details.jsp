<%@page import="com.baje.sz.ajax.AjaxXml"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	int course_id=ru.getInt("course_id");
	Selectic selectic=new Selectic();
	Doc courseDoc=selectic.Get_Doc("id,name,content,add_time", "bs_course", " where isdel=0 and id=? ","mysqlss",new Object[]{course_id});
	if(courseDoc==null||courseDoc.isEmpty()){
		out.print("	<script>alert(\"信息不存在\");window.location.href='course.jsp';</script>");
		return;
	}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>课程详细</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
</head>
<body class="bg_white">
<jsp:include page="head.jsp">
	<jsp:param value="3" name="type"/>
</jsp:include>
<!--=== End Header ===-->
<!-- <div class="banner_news"></div> -->
<div class="container">
   <div class="news_title">
        <h2><%=courseDoc.get("name")%></h2>
       <%--  <p><%=AjaxXml.timeStamp2Date(courseDoc.getIn("add_time"), "YY04-MM-DD HH:MI:SS")%></p> --%>
   </div>
   <div class="news_con">
       <%=courseDoc.get("content") %>
   </div>
</div>
<!-- 引入尾部 -->
<%@include file="front_footer.jsp" %>
</body>
</html>
