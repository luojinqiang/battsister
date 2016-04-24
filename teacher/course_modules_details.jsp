<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.battsister.util.BasicType"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	int course_id=ru.getInt("course_id");
	Selectic selectic=new Selectic();
	Doc coursedDoc=selectic.Get_Doc("id,name,introduce,pic,content", "bs_course", " where id=? ","mysqlss",new Object[]{course_id});
	if(coursedDoc==null||coursedDoc.isEmpty()){
		out.print("	<script>alert(\"该课程不存在\");window.location.href='/teacher/teacher_home.jsp';</script>");
		return;
	}

%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>课程模块详情</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/front_style/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/front_style/js/organictabs.jquery.js"></script>
<link rel="stylesheet" href="/front_style/ppt_word/css/base.css">
<link rel="stylesheet" href="/front_style/ppt_word/css/MPreview.css">
 <script type="text/javascript" src="/front_style/ppt_word/js/MPreview.js"></script>
<script type="text/javascript">
$(function() {
	// 调用插件
	$("#example-two").organicTabs({
		"speed": 100,
	});
});
</script>
</head>

<body>
<!-- 引入头部 -->
<jsp:include page="head.jsp">
	<jsp:param value="1" name="type"/>
</jsp:include>

<div class="container">
    <div class="info">
    	<a href="teacher_home.jsp">首页</a><em>></em><a href="teacher_home.jsp">我要备课</a><em>></em><a href="course_modules.jsp">课程模块</a><em>></em><a href="course_modules_details.jsp?course_id=<%=coursedDoc.getIn("id")%>"><%=coursedDoc.get("name")%></a>
    </div>
</div>

<div class="container">
    <div class="one_top">
        <div class="one_img"><img src="<%=coursedDoc.get("pic")%>"></div>	
        <div class="one_word1">
          <h3><%=coursedDoc.get("name")%></h3>
          <p><%=coursedDoc.get("introduce")%></p>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="container">
	<div id="example-two">
		<%=coursedDoc.get("content")%>
	</div>
</div>

<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
