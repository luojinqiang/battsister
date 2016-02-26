<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.hanyou.admin.sys.AdminLogin" %>
<%@ page import="net.sf.json.JSONObject" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    if (action.equals("denglu")) {
        AdminLogin login = new AdminLogin();
        JSONObject result = login.checkAdminLogin(request, response);
        out.print(result.toString().trim());
        return;
    }
    if (action.equals("logout")) {
        AdminLogin login = new AdminLogin();
        login.logout(request, response);
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>派司德教学资源管理系统登录页面</title>
    <link href="css/logincss.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <link type="text/css" rel="stylesheet" href="css/jquery.alert.css"/>
    <script type="text/javascript" src="js/jquery.alert.js"></script>
    <script type="text/javascript" src='js/sys.js'></script>
    <script type="text/javascript" src="js/artDialog4.1.6/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="js/artDialog4.1.6/plugins/iframeTools.source.js"></script>
    <script type="text/javascript">
        function denglu_check() { //
            var user_name = $("#user_name").val();
            var user_pwd = $("#user_pwd").val();
            if (user_name == "" || user_name == "请输入后台帐号") {
                alert("请输入后台帐号");
                return;
            }
            $("#tipsspan").html("<img src='images/loading.gif' />加载中……请稍候……");
            $.ajax({ //admin_login.jsp?action=denglu
                dataType: "json",
                type: "post", //post
                url: "login.jsp", //
                data: "action=denglu&user_name=" + user_name + "&user_pwd=" + user_pwd + "", //
                success: function (msg) {
                    if (msg.type == true) {
                        window.location.href = "index.jsp";
                    } else {
                        alert(msg.msg);
                        $("#tipsspan").html("");
                    }
                }
            });
        }
        function inputonclick(obj, NowClass) {
            document.getElementById(obj).className = NowClass;
        }

        function SetFocus() {
            if (document.Login.username.value == "") {
                document.Login.username.focus();
            } else {
                document.Login.username.select();
            }
        }

    </script>
</head>

<body>
<div class="header">
    <div class="header-warp">
        <div class="logo"><img src="images/logo.png" width="198"/></div>
    </div>
</div>
<div class="wrapper">
    <div class="title">派司德教学资源后台管理</div>
    <div class="line"></div>
    <div class="content">
        <div class="text">用户名</div>
        <input type="text" name="user_name" id="user_name" class="input_txt" value=""/>

        <div class="text">密码</div>
        <input type="password" class="input_txt" name="user_pwd" id="user_pwd"
               onkeydown="if(event.keyCode==13){denglu_check();}"/>
        <span id="tipsspan"></span>
        <input type="button" id="denglu" name="denglu" value="登 录 " class="submit" onclick="denglu_check()"/>
    </div>
</div>

<div class="footer"><a href="http://www.battsister.com" title="派司德官网" target="_blank">派司德官网</a> Copyright&copy;2010 – 2015 v1.0.1</div>
</body>
</html>


