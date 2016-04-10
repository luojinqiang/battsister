<%@page import="com.baje.sz.util.RequestUtil"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	int examination_id=ru.getInt("examination_id");
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>考试详情</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
<!-- 引入头部 -->
<jsp:include page="head.jsp">
	<jsp:param value="2" name="type"/>
</jsp:include>
<div class="container">
    <div class="info">
    	<a href="teacher_home.jsp">首页</a><em>></em><a href="teaching.jsp">我要授课</a><em>></em><a href="examination_system.jsp">考试系统</a><em>></em><a href="examination_record.jsp">考试记录</a>
    </div>
</div>
<div class="container">
	<div class="ex_wrap">
		<div class="title_r">考试名称<i>参考人员：全体学员</i><i>考试时长：120分钟</i><i>考试总分：100分</i><a href="examination_details.jsp?examination_id=<%=examination_id%>">试题详情</a></div> 
        <div class="ex_two">
           <!--  <div class="ex_user"><img src="images/user.jpg"></div> -->
            <div class="ex_word">
                <h4>张帆</h4>
                <div><em>2016-02-12 13:00</em><em>答题时间：60分钟</em></div>
            </div>
            <div class="ex_score">96分</div>
            <div class="mod_botton"><a href="examination_details1.jsp">查看详情</a></div>
            <div class="clear"></div>
        </div>
        <div class="ex_two">
           <!--  <div class="ex_user"><img src="images/user.jpg"></div> -->
            <div class="ex_word">
                <h4>张帆</h4>
                <div><em>2016-02-12 13:00</em><em>答题时间：60分钟</em></div>
            </div>
            <div class="ex_score">96分</div>
            <div class="mod_botton"><a href="examination_details1.html">查看详情</a></div>
            <div class="clear"></div>
        </div>
        <div class="ex_two">
          <!--   <div class="ex_user"><img src="images/user.jpg"></div> -->
            <div class="ex_word">
                <h4>张帆</h4>
                <div><em>2016-02-12 13:00</em><em>答题时间：60分钟</em></div>
            </div>
            <div class="ex_score">96分</div>
            <div class="mod_botton"><a href="examination_details1.html">查看详情</a></div>
            <div class="clear"></div>
        </div>
        <div class="ex_two">
           <!--  <div class="ex_user"><img src="images/user.jpg"></div> -->
            <div class="ex_word">
                <h4>张帆</h4>
                <div><em>2016-02-12 13:00</em><em>答题时间：60分钟</em></div>
            </div>
            <div class="ex_score">96分</div>
            <div class="mod_botton"><a href="exercises_details.html">查看详情</a></div>
            <div class="clear"></div>
        </div>
        <ul class="pre">
            <li><a href="#"><</a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li class="active_pre"><a href="#">5</a></li>
            <li><a href="#">></a></li>
        </ul>
    </div>	
</div>

<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
