<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    String ifrurl = "main.jsp";
    String ifrstr = "首页";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="robots" content="noarchive"/>
    <title>派司德</title>
    <base target="_self"/>
    <link href="css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="css/base.css" rel="stylesheet" type="text/css"/>
    <link href="css/colortemplate.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css"
          href="js/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="js/themes/icon.css"/>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <script language="javascript" src='js/sys.js'></script>
    <script type="text/javascript"
            src="js/artDialog4.1.6/artDialog.js?skin=green"></script>
    <script type="text/javascript"
            src="js/artDialog4.1.6/plugins/iframeTools.source.js"></script>

    <script type="text/javascript">
        var timeout = 500;
        var closetimer = 0;
        var ddmenuitem = 0;

        function jsddm_open() {
            jsddm_canceltimer();
            jsddm_close();
            var pop_x = $(this).position().left;
            ddmenuitem = $(this).find('ul').eq(0).css({
                'visibility': 'visible',
                'left': pop_x
            });
        }

        function jsddm_close() {
            if (ddmenuitem)
                ddmenuitem.css('visibility', 'hidden');
        }

        function jsddm_timer() {
            closetimer = window.setTimeout(jsddm_close, timeout)
        }

        function jsddm_canceltimer() {
            if (closetimer) {
                window.clearTimeout(closetimer);
                closetimer = null;
            }
        }

        $(document).ready(function () {
            $('#jsddm > li').bind('mouseover', jsddm_open);
            $('#jsddm > li').bind('mouseout', jsddm_timer);
        });

        document.onclick = jsddm_close;
    </script>
    <script type="text/javascript">
        function jianyi3(urls, titles) {
            var tab = $("#tabsN").tabs('getSelected');
            if ($('#tabsN').tabs('exists', titles)) {
                $('#tt')
                        .tabs(
                                'add',
                                {
                                    title: 'titles ',
                                    content: '<iframe style="border-top-width: 0px; border-left-width: 0px;'
                                    + ' border-bottom-width: 0px;  border-right-width: 0px"'
                                    + ' src="'
                                    + urls
                                    + '" frameborder="0" width="100%" scrolling="yes" height="100%"></iframe>',
                                    closable: true
                                });
            }
        }
        function jianyi2(urls, titles) {
            var chk = true;
            var tab = $('#tabsN').tabs('getSelected');
            if ($('#tabsN').tabs('exists', titles)) {
                $('#tabsN').tabs('select', titles);
                tab = $('#tabsN').tabs('getSelected');
                $('#tabsN')
                        .tabs(
                                'update',
                                {
                                    tab: tab,
                                    options: {
                                        content: '<iframe src="'
                                        + urls
                                        + '" frameborder="0" width="100%" scrolling="auto" height="100%"></iframe>'
                                    }
                                });

            } else {
                $('#tabsN')
                        .tabs(
                                'add',
                                {
                                    title: titles,
                                    closed: true,
                                    border: false,
                                    content: '<iframe src="'
                                    + urls
                                    + '" frameborder="0" width="100%" scrolling="auto" height="100%"></iframe>',
                                    closable: true

                                });
            }
        }
        function tabclose(titles) {
            $('#tabsN').tabs('close', titles);
        }
        //设备入库
        function deviceEdit(id, title) {
            openurl('shebei/device_library_edit.jsp?id=' + id + '', 'shezhi',
                    title, 700, 380, 0, 20, true);
        }
    </script>


</head>

<body style="" scroll=no>
<div id="container">

    <div class="header">
        <h1>派司德教学资源管理系统</h1>
        <div class="nav_click">
            <div class="nc_left"></div>
            <!--left down-->

            <ul class="nc_cont" id="jsddm">
				<li class="ncc_01"><a href="javascript:void(0);">用户管理</a>
                    <ul class="nav_list">
                     <%
                            if (current_flags.contains("1001")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('teacher/schools.jsp','学校管理')">学校管理</a></li>
                        <%} %>
                        <%
                            if (current_flags.contains("1002")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('teacher/teachers.jsp','教师管理')">教师管理</a></li>
                        <%} 
                        	if (current_flags.contains("1003")) {
                            %>
                            <li><a href="javascript:window.parent.jianyi2('teacher/students.jsp','学生管理')">学生管理</a></li>
                        	<%} %>
                    </ul>
                </li>
                <li class="ncc_01"><a href="javascript:void(0);">课程管理</a>
                    <ul class="nav_list">
                     	<%
                     		if(current_flags.contains("2001")){
                     	%>
                        <li><a href="javascript:window.parent.jianyi2('course/course.jsp','课程管理')">课程管理</a></li>
                     	<%
                     		}
                     	%>
                    </ul>
                </li>
                <li class="ncc_03"><a
                        href="javascript:void(0);">信息内容</a>
                    <ul class="nav_list">
                        <% if (current_flags.contains("3001")) {%>
                        <li><a href="javascript:window.parent.jianyi2('xinxi/newsclass.jsp','信息内容')">信息栏目</a></li>
                        <%
                            }
                            if (current_flags.contains("3002")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('xinxi/news.jsp','信息内容')">信息内容</a></li>

                        <%
                            }
                            if (current_flags.contains("3003")) {
                            %>
                            <li><a href="javascript:window.parent.jianyi2('xinxi/cooperation_unit.jsp','合作院校、企业')">合作院校、企业</a></li>
                            <%
                           }if(current_flags.contains("3004")){
                        	   %>
                        	  <!--  <li><a href="javascript:window.parent.jianyi2('xinxi/banner.jsp','首页banner图')">首页banner图</a></li> -->
                        	   <%
                           }if(current_flags.contains("3005")){
                        	   %>
                        	   <li><a href="javascript:window.parent.jianyi2('xinxi/info.jsp?type=1','课程大纲')">课程大纲</a></li>
                        	   <%
                           }if(current_flags.contains("3006")){
                        	   %>
                        	   <li><a href="javascript:window.parent.jianyi2('xinxi/info.jsp?type=2','习题库介绍')">习题库介绍</a></li>
                        	   <%
                           }
                         %>
                    </ul>
                </li>
               <li class="ncc_06"><a href="javascript:void(0);">系统管理</a>
                    <ul class="nav_list">
                       <%
                        if (current_flags.contains("4001")) { %>
                        <li><a href="javascript:window.parent.jianyi2('xitong/rizhi.jsp','系统日志')">系统日志</a></li>
                        <%
                            }
                            if (current_flags.contains("4002")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('xitong/keyword.jsp','关键词管理')">关键词管理</a></li>
                        <%
                            }
                            if (current_flags.contains("4003")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('xitong/guanliyuan.jsp','后台管理员管理')">后台管理员管理</a>
                        </li>
                        <%
                            }
                            if (current_flags.contains("4004")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('xitong/userfeedback.jsp','用户反馈')">用户反馈</a></li>
                        <%
                    		 }
                        %>
                        <li><a href="javascript:window.parent.jianyi2('xitong/password_edit.jsp','修改密码')">修改密码</a></li>
                    </ul>
                </li>
            </ul>
            <div class="c_right"></div>
            <!--right down-->
        </div>
        <span class="right_exit">操作员：<%=user_name%> | <a href="login.jsp?action=logout" class="quit">退出</a></span>
    </div>
    <!--End Header-->
    <div class="easyui-tabs" fit="true" border="false" id="tabsN">
        <div title="<%=ifrstr%>">
            <iframe src="<%=ifrurl%>" frameborder="0" id="iframeid" width="100%" height="100%"></iframe>
        </div>
    </div>
</div>
<!--End Container-->
</body>
</html>

