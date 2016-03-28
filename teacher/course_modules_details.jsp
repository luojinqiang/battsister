<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	int course_id=ru.getInt("course_id");
	Selectic selectic=new Selectic();
	Doc coursedDoc=selectic.Get_Doc("id,name,introduce,pic", "bs_course", " where id=? ","mysqlss",new Object[]{course_id});
	if(coursedDoc==null||coursedDoc.isEmpty()){
		out.print("	<script>alert(\"该课程不存在\");window.location.href='/teahcer/teacher_home.jsp';</script>");
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
<script type="text/javascript">
$(function() {
	// 调用插件
	$("#example-one").organicTabs();
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
    	<a href="teacher_home.jsp">首页</a><em>></em><a href="teacher_home.jsp">我要备课</a><em>></em><a href="course_modules.jsp">课程模块</a><em>></em><a href="course_modules_details.jsp">课程模块1</a>
    </div>
</div>

<div class="container">
    <div class="one_top">
        <div class="one_img"><img src="images/tu.jpg"></div>	
        <div class="one_word1">
          <h3>课程模块1</h3>
          <p>基础部分我讲的比较慢，基础好的同学前面可以快进学习。到后面进阶和高级部分我加快了语速和进度，心急的同学就不用再等待了！基础部分我讲的比较慢，基础好的同学前面可以快进学习。到后面进阶和高级部分我加快了语速和进度，心急的同学就不用再等待了！</p>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="container">
	<div id="example-two">
		<ul class="nav">
			<li class="nav-one"><a href="#ab" class="current">教学指南</a></li>
			<li class="nav-two"><a href="#bb">教案</a></li>
			<li class="nav-three"><a href="#cb">教学评价</a></li>
		</ul>
		<div class="list-wrap">
			<ul id="ab">
				<li class="one_mod">
                    <div class="one_mod_word">
                        <h3>教学指南标题1</h3>
                        <p>基础部分我讲的比较慢，基础好的同学前面可以快进学习。到后面进阶和高级部分我加快了语速和进度，心急的同学就不用再等待了！</p>
                    </div>
                    <div class="mod_botton"><a href="#">查看详情</a></div>
                    <div class="clear"></div>
                </li>
                <li class="one_mod">
                    <div class="one_mod_word">
                        <h3>教学指南标题2</h3>
                        <p>基础部分我讲的比较慢，基础好的同学前面可以快进学习。到后面进阶和高级部分我加快了语速和进度，心急的同学就不用再等待了！</p>
                    </div>
                    <div class="mod_botton"><a href="#">查看详情</a></div>
                    <div class="clear"></div>
                </li>
                <li class="one_mod bb_none">
                    <div class="one_mod_word">
                        <h3>教学指南标题3</h3>
                        <p>基础部分我讲的比较慢，基础好的同学前面可以快进学习。到后面进阶和高级部分我加快了语速和进度，心急的同学就不用再等待了！</p>
                    </div>
                    <div class="mod_botton"><a href="#">查看详情</a></div>
                    <div class="clear"></div>
                </li>
            </ul>
			<ul id="bb" class="hide">
				<li class="one_mod">
                    <div class="one_mod_word">
                        <h3>教案1</h3>
                        <p>基础部分我讲的比较慢，基础好的同学前面可以快进学习。到后面进阶和高级部分我加快了语速和进度，心急的同学就不用再等待了！</p>
                    </div>
                    <div class="mod_botton"><a href="#">查看详情</a></div>
                    <div class="clear"></div>
                </li>
                <li class="one_mod bb_none">
                    <div class="one_mod_word">
                        <h3>教案2</h3>
                        <p>基础部分我讲的比较慢，基础好的同学前面可以快进学习。到后面进阶和高级部分我加快了语速和进度，心急的同学就不用再等待了！</p>
                    </div>
                    <div class="mod_botton"><a href="#">查看详情</a></div>
                    <div class="clear"></div>
                </li>	
			</ul>
			<ul id="cb" class="hide">
				<li class="one_mod">
                    <div class="one_mod_word">
                        <h3>教学评价1</h3>
                        <p>基础部分我讲的比较慢，基础好的同学前面可以快进学习。到后面进阶和高级部分我加快了语速和进度，心急的同学就不用再等待了！</p>
                    </div>
                    <div class="mod_botton"><a href="#">查看详情</a></div>
                    <div class="clear"></div>
                </li>	
                <li class="one_mod bb_none">
                    <div class="one_mod_word">
                        <h3>教学评价2</h3>
                        <p>基础部分我讲的比较慢，基础好的同学前面可以快进学习。到后面进阶和高级部分我加快了语速和进度，心急的同学就不用再等待了！</p>
                    </div>
                    <div class="mod_botton"><a href="#">查看详情</a></div>
                    <div class="clear"></div>
                </li>	
			</ul>
		</div>
	</div>
</div>

<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
