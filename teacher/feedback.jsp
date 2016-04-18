<%@page import="com.battsister.teacher.TeacherApi"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	String action=ru.getString("action");
	if("commit".equals(action)){
		out.print(new TeacherApi().feedBack(request));
		return;
	}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>意见反馈</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/front_style/js/jquery.min.js"></script>
<script src="/front_style/js/showList.js" type="text/javascript"></script>
</head>

<body>
<!-- 引入头部 -->
<jsp:include page="head.jsp">
	<jsp:param value="0" name="type"/>
</jsp:include>

<div class="container">
    <div class="info">
    	<a href="teacher_home.jsp">首页</a><em>></em><a href="personal.jsp">个人中心</a><em>></em><a href="feedback.jsp">意见反馈</a>
    </div>
</div>

<div class="container">
	<div class="left_nav mt_none">
      <div class="operate">
        <ul id="juheweb">
          <li>
            <h5><a href="personal.jsp">个人资料</a></h5>
          </li>
          <li>
            <h5 class="selected"><a href="feedback.jsp">意见反馈</a></h5>
          </li>
          <li >
            <h5><a href="using_instructions.jsp">平台使用手册</a></h5>
          </li>
        </ul>
        <script type="text/javascript" language="javascript">
			navList(12);
		</script>
      </div>
  	</div>
    <div class="right_w mt_none">
        <div class="title_r">意见反馈</div>
        <div class="input_c">
            <div class="input_word">问题分类</div>
            <div class="input_text"><input name="type" type="radio" value="1" checked="checked"><em>报错</em> <input name="type" type="radio" value="2"><em>建议</em> </div>
            <div class="clear"></div>
        </div>
        <div class="input_c">
            <div class="input_word">问题描述</div>
            <div class="input_text"><textarea name="content" id="content" cols="" rows="" placeholder="请输入您要反馈的问题" class="textarea_c"></textarea></div>
            <div class="clear"></div>
        </div>
        <div class="input_c">
            <div class="botton2"><a href="javascript:commit();">提交</a></div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
	function commit(){
		var content=$("#content").val();
		var type=$("input[name=type]").val();
		if(content==""||content==undefined){
			alert("请输入你要反馈的内容");
			return;
		}
		if(type!=1&&type!=2){
			alert("请选择您的反馈类型");
			return;
		}
		$.ajax({ 
            dataType: "json",
            type: "post", 
            url: "feedback.jsp",
            data: "action=commit&content="+content+"&type="+type, 
            success: function (msg) {
                if (msg.type) {
                  	alert("感谢您的反馈，祝您生活愉快");
                  	window.location.href='/teacher/teacher_home.jsp';
                } else {
                    alert(msg.msg);
                }
            }
        });
	}
</script>
</body>
</html>
