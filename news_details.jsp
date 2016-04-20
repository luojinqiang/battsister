<%@page import="com.baje.sz.ajax.AjaxXml"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	int news_id=ru.getInt("news_id");
	int type=ru.getInt("type");
	type=type==4?type:2;
	Selectic selectic=new Selectic();
	Doc newsDoc=selectic.Get_Doc("id,newstitle,bigfile,addtime,content", "bs_news", " where isdel=0 and id=? ","mysqlss",new Object[]{news_id});
	if(newsDoc==null||newsDoc.isEmpty()){
		out.print("	<script>alert(\"信息不存在\");window.location.href='news.jsp';</script>");
		return;
	}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>新闻动态</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
</head>
<body class="bg_white">
<jsp:include page="head.jsp">
	<jsp:param value="<%=type%>" name="type"/>
</jsp:include>
<!--=== End Header ===-->
<!-- <div class="banner_news"></div> -->
<div class="container">
   <div class="news_title">
        <h2><%=newsDoc.get("newstitle")%></h2>
        <p><%=AjaxXml.timeStamp2Date(newsDoc.getIn("addtime"), "YY04-MM-DD HH:MI:SS")%></p>
   </div>
   <div class="news_con">
       <%=newsDoc.get("content") %>
   </div>
</div>
<!-- 引入尾部 -->
<%@include file="front_footer.jsp" %>
</body>
</html>
