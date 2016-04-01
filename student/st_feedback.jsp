<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.battsister.student.StudentApi" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    if ("save".equals(action)) {
        out.print(new StudentApi().feedBack(request));
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
<link href="../front_style/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../front_style/js/jquery.min.js"></script>
</head>

<body>
<!--=== Header ===-->
<jsp:include page="header.jsp">
    <jsp:param value="5" name="type"/>
</jsp:include>
<!--=== End Header ===-->

<div class="container">
    <div class="info">
    	<a href="student_home.jsp">首页</a><em>></em><a href="st_personal.jsp">个人中心</a><em>></em><a href="st_feedback.jsp">意见反馈</a>
    </div>
</div>

<div class="container">
    <jsp:include page="user_left.jsp">
        <jsp:param value="2" name="type"/>
    </jsp:include>
    <form id="feedBackForm">
        <input type="hidden" name="action" value="save">
        <div class="right_w mt_none">
            <div class="title_r">意见反馈</div>
            <div class="input_c">
                <div class="input_word">问题分类</div>
                <div class="input_text"><input name="type" type="radio" value="1" checked><em>报错</em> <input name="type" type="radio" value="2"><em>建议</em> </div>
                <div class="clear"></div>
            </div>
            <div class="input_c">
                <div class="input_word">问题描述</div>
                <div class="input_text"><textarea name="content" cols="" rows="" placeholder="请输入您要反馈的问题,不少于10个字" class="textarea_c"></textarea></div>
                <div class="clear"></div>
            </div>
            <div class="input_c">
                <div class="botton2"><a href="#" onclick="userSave(this);">提交</a></div>
            </div>
        </div>
    </form>
    <div class="clear"></div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
<script>
    function userSave(obj) {
        if ($('textarea[name=content]').val().length < 10) {
            alert('请输入10个字以上哦');
            return;
        }
        $(obj).html('提交中...').attr('onclick', 'void(0);');
        $.post('?',$('#feedBackForm').serialize(),function (data) {
            $(obj).html(data.msg);
            /*setTimeout(function () {
                $(obj).attr('onclick', 'userSave(this);').html('提交');
            }, 3000);*/
        },'json');
    }
</script>
</body>
</html>
