<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ include file="ini_sys.jsp" %>
<%
   JSONObject result =new AdminLogin().getMainInfo();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="robots" content="noarchive"/>
    <title>派司德教学资源管理系统</title>

    <base target="_self"/>
    <link href="css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="css/base.css" rel="stylesheet" type="text/css"/>
    <link href="css/colortemplate.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <script language="javascript" src='js/sys.js'></script>
    <link type="text/css" rel="stylesheet" href="css/jquery.alert.css"/>
    <script type="text/javascript" src="js/jquery.alert.js"></script>
    <script type="text/javascript" src="js/artDialog4.1.6/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="js/artDialog4.1.6/plugins/iframeTools.source.js"></script>
    <script type="text/javascript">
        function tiaozhuan(type) {
            var loupan_id = $("#loupan_id").val();
            $.ajax({
                cache: false,
                async: false,
                type: "post",
                url: "ajax/loupan.jsp",
                data: "action=addLCookies&loupan_id=" + loupan_id + "",
                success: function (msg) {
                },
                error: function () {
                }
            });
            window.location.href = "kuaijie.jsp?loupan_id=" + loupan_id + "";
        }
        function clicknum(opt) {
            if (opt == "用户管理") {
                window.parent.jianyi2('teacher/schools.jsp', '学校管理');
            }
        }
        function readNew(id, str) {
            openurl('xitong/news_read.jsp?id=' + id + '', 'xitong', str, 950, 380, 0, 10, true);
        }
        $(function () {
            $("#gonggao").fadeOut(30000);
        });//公告显示
        function hid() {
            $("#gonggao").hide();
        }
    </script>

    <style type="text/css">
        .panel-body {
            overflow-x: hidden;
        }

        .tabs-header {
            background: #8ebf6e;
            border-top: 1px #c3deb1 solid;
        }

        .tabs {
            border-bottom: 1px #5ca02e solid;
        }

        .tabs li.tabs-selected {
            -moz-border-bottom-colors: none;
            -moz-border-image: none;
            -moz-border-left-colors: none;
            -moz-border-right-colors: none;
            -moz-border-top-colors: none;
            border-color: #5ca02e #5ca02e #fff;
            border-style: solid;
            border-width: 1px;
        }

        .tabs li {
            border: 1px solid #5ca02e;
            border-radius: 5px 5px 0 0;
            display: inline-block;
            float: left;
            margin-bottom: -1px;
            margin-right: 4px;
            padding: 0;
            position: relative;
        }

        .tabs li a.tabs-inner {
            background: url("images/tabs_enabled.png") repeat-x scroll left top transparent;
            border-radius: 5px 5px 0 0;
            color: #476c2e;
            display: inline-block;
            height: 25px;
            line-height: 25px;
            margin: 0;
            padding: 0 10px;
            text-align: center;
            text-decoration: none;
            white-space: nowrap;
        }

        .tabs li a.tabs-inner:hover {
            background: url("images/tabs_selected.png") repeat-x scroll left top transparent;
        }

        .tabs li.tabs-selected a.tabs-inner {
            background: url("images/tabs_selected.png") repeat-x scroll left bottom;
            color: #476c2e;
        }

        .tabs li a.tabs-close {
            background: url("images/tabs_close.gif") no-repeat scroll 2px 2px transparent;
            display: block;
            font-size: 1px;
            height: 11px;
            opacity: 0.6;
            padding: 0;
            position: absolute;
            right: 5px;
            top: 7px;
            width: 11px;
        }

        .tabs li a.tabs-close:hover {
            background: url("images/tabs_closeB.gif") no-repeat scroll 2px 2px transparent;
            background-color: #F90;
        }
    </style>

</head>

<body class="ifr">
<div class="full_box">
    <div class="kj_nav">
        <div class="kj_leftbox">
            <div class="k_l_mt">快捷菜单通道</div>
            <div class="k_l_mc">
                <ul class="k_l_menu clearfix">
                    <li>
                        <button class="btn_kjmenu" type="button" onclick="clicknum('用户管理')">用户管理</button>
                    </li>
                </ul>
            </div>
        </div>
    </div><!--kj_nav e-->

    <div class="kj_main">
        <div class="kj_tabs_title">
            <ul class="clearfix">
                <li><strong>用户数据信息</strong></li>
            </ul>
        </div>
        <div class="kj_tabs_cont">
            <div class="k_r_mc">
                <ul class="kl_form clearfix">
                    <li><span class="k_f_text">当前用户数量：<b class="red"><%=result.optInt("teacherNum") %>
                    </b></span><a href="javascript:window.parent.jianyi2('teacher/teachers.jsp','教师管理')">查看</a></li>
                    <li><span class="k_f_text">今日新增：<b class="red"><%=result.optInt("teacherNum_totday") %>
                    </b></span></li>
                </ul>
            </div>
        </div>
    </div><!--kj_main e-->
</div>
</body>
</html>
