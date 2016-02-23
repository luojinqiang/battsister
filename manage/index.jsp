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
    <title>健身房</title>
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
        <h1>健身房管理系统</h1>

        <div class="nav_click">
            <div class="nc_left"></div>
            <!--left down-->

            <ul class="nc_cont" id="jsddm">
				<%
					if(gym_group_id==0){
				%>
				<li class="ncc_01"><a href="javascript:jianyi2('yonghu/yonghu.jsp','用户管理')">用户管理</a>
                    <ul class="nav_list">
                        <%
                            if (current_flags.contains("1001")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('yonghu/yonghu.jsp','用户管理')">用户管理</a></li>
                        <%
                            }
                            if (current_flags.contains("1004")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('yonghu/level_experience_group.jsp?group_type=1','积分操作组别')">积分操作组别</a></li>
                        <%
                            }
                            if (current_flags.contains("1005")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('yonghu/level_experience_operating.jsp?operating_type=1','积分操作')">积分操作</a></li>
                        <%
                            }
                            if (current_flags.contains("1007")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('yonghu/level_experience_operating_user.jsp?operating_type=1','积分获取情况')">积分获取情况</a></li>
                        <%} %>
                    </ul>
                </li>
				<%
					}
				%>
                <li class="ncc_01"><a href="javascript:jianyi2('order/hy_order.jsp','订单管理')">订单管理</a>
                    <ul class="nav_list">
                        <%if (current_flags.contains("2007")) { %>
                        <li><a href="javascript:window.parent.jianyi2('order/hy_order.jsp','订单管理')">订单管理</a></li>
                        <%
                            }
                        if(gym_group_id==0){
                        	if(current_flags.contains("2025")){
                        		%>
                        		<li><a href="javascript:window.parent.jianyi2('order/member_measure_item.jsp','体测项目')">体测项目</a>
                        </li>
                        		<%                       		
                        	}
                            if (current_flags.contains("2026")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('order/plan_action_type.jsp','动作类型')">动作类型</a>
                        </li>
                        <%
                            }
                            if (current_flags.contains("2027")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('order/default_action.jsp','默认动作')">默认动作</a></li>
                        <%
                            }
                            if (current_flags.contains("2028")) {
                        %>
                        <li>
                            <a href="javascript:window.parent.jianyi2('order/plan_action_type.jsp?type=1','健身目标')">健身目标</a>
                        </li>
                        <%} if (current_flags.contains("2029")) {
                            %>
                            <li>
                                <a href="javascript:window.parent.jianyi2('order/common_language_class.jsp?','常用语类型')">常用语类型</a>
                            </li><%}
                            if(current_flags.contains("2030")){
                        	%>
                        	 <li>
                            	<a href="javascript:window.parent.jianyi2('order/common_language.jsp','常用语设置')">常用语设置</a>
                        	</li>
                        	<%
                        	
                       		 }
                            if(current_flags.contains("2031")){
                        	%>
                        	<li><a href="javascript:window.parent.jianyi2('order/pro_class.jsp?class_status=1','商品栏目')">商品栏目</a></li>
                        	<%
                       		 }
                        }
                            if(current_flags.contains("2032")){
                        	%>
                        	 <li><a href="javascript:window.parent.jianyi2('order/pro_product.jsp','商品管理')">商品管理</a></li>
                        	<%
                        }
                            if(gym_group_id==0){
	                            if(current_flags.contains("2033")){
	                        	%>
	                       	<li><a href="javascript:window.parent.jianyi2('order/user_money.jsp','用户资金记录')">用户资金记录</a></li>
	                       	<%
	                       		}
	                        }%>
                    </ul>
                </li>
                <%
                    if (gym_id == 0) {
                        out.print("<li class=\"ncc_02\"><a href=\"javascript:jianyi2('jianshenfang/gym.jsp','健身房管理')\">健身房管理</a>");
                    } else {
                        out.print("<li class=\"ncc_02\"><a href=\"javascript:jianyi2('jianshenfang/coach.jsp','教练管理')\">教练管理</a>");
                    }
                %>

                <ul class="nav_list">
                    <%
                        if (gym_group_id == 0) {
                            if (current_flags.contains("3001")) {
                    %>
                    <li><a href="javascript:window.parent.jianyi2('jianshenfang/jituan.jsp','连锁集团管理')">连锁集团管理</a></li>
                    <%
                            }
                        }
                    if(gym_id==0){
                        if (current_flags.contains("3005")) {
                    %>
                    <li><a href="javascript:window.parent.jianyi2('jianshenfang/gym.jsp','健身房管理')">健身房管理</a></li>
                    <%
                        }
                    }
                        if (current_flags.contains("3009")) {
                    %>
                    <li><a href="javascript:window.parent.jianyi2('jianshenfang/coach.jsp','教练管理')">教练管理</a></li>
                    <%} 
					if(current_flags.contains("3045")){ %>
                    <li><a href="javascript:window.parent.jianyi2('jianshenfang/device.jsp','设备管理')">设备管理</a></li>
                    <%
                        }
                        if (current_flags.contains("3049")) {
                    %>
                    <li>
                        <a href="javascript:window.parent.jianyi2('jianshenfang/bodyMeasure_titai.jsp', '体态管理')">体态管理</a>
                    </li>
                    <%
                        } 
                        if(current_flags.contains("3050")){
                        	%>
                        	 <li>
                        <a href="javascript:window.parent.jianyi2('jianshenfang/bodyMeasure_tineng.jsp', '体能管理')">体能管理</a>
                    </li>
                        	<%
                        }
                        if(current_flags.contains("3051")){
                     		%>
                     		  <li><a href="javascript:window.parent.jianyi2('jianshenfang/bodyMeasure_tice.jsp', '体测管理')">体测管理</a>
                   				 </li>
                     		<%
                        }
                        if (current_flags.contains("3017")) {
                    %>
                    <li>
                        <a href="javascript:window.parent.jianyi2('jianshenfang/gym_member_book.jsp?book_type=1','预约私教')">预约私教</a>
                    </li>
                    <% 
                        }
                    %>
                </ul>
                </li>
                <%
                if(gym_group_id==0){
                    if (current_flags.contains("4004")) {
                %>
                <li class="ncc_03"><a
                        href="javascript:window.parent.jianyi2('xinxi/news.jsp','信息内容')">信息内容</a>
                    <ul class="nav_list">
                        <% if (current_flags.contains("4001")) {%>
                        <li><a href="javascript:window.parent.jianyi2('xinxi/newsclass.jsp','信息内容')">信息栏目</a></li>
                        <%
                            }
                            if (current_flags.contains("4002")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('xinxi/news.jsp','信息栏目')">信息内容</a></li>

                        <%
                            }
                            if (current_flags.contains("4003")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('xinxi/news_edit.jsp','发布信息')">发布信息</a></li>
                        <%
                            }
                        %>
                    </ul>
                </li>
                <%
                    }
                }
                %>
                <%
                	if(gym_group_id==0){
                %>
                <li class="ncc_04"><a href="javascript:window.parent.jianyi2('faxian/wenzhang.jsp','发现文章')">发现文章</a>
                    <ul class="nav_list">
                        <% if (current_flags.contains("5001")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('faxian/wenzhang.jsp','发现文章')">发现文章</a></li>
                        <%
                            }
                            if (current_flags.contains("5005")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('faxian/huifu.jsp','文章评论')">文章评论</a></li>
                        <%
                            }
                            if (current_flags.contains("5007")) {
                        %>
                        <li>
                            <a href="javascript:window.parent.jianyi2('faxian/hy_friendster_carousel.jsp','每日推荐')">每日推荐</a>
                        </li>
                        <%} %>
                    </ul>
                </li>
                <%
                	}
                %>
              <%
              if(gym_group_id==0){
              %>
               <li class="ncc_06"><a href="javascript:jianyi2('xitong/rizhi.jsp','系统管理')">系统管理</a>
              <%
              }else{
            	  %>
				 <li class="ncc_06"><a href="javascript:jianyi2('xitong/password_edit.jsp','修改密码')">修改密码</a>
            	  <%
              }
              %>
                    <ul class="nav_list">
                        <%
                     if(gym_group_id==0){
                        if (current_flags.contains("6001")) { %>
                        <li><a href="javascript:window.parent.jianyi2('xitong/rizhi.jsp','系统日志')">系统日志</a></li>
                        <li>
                            <a href="javascript:window.parent.jianyi2('xitong/rizhi.jsp?log_type=2','教练系统日志')">教练系统日志</a>
                        </li>
                        <%
                            }
                            if (current_flags.contains("6002")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('xitong/keyword.jsp','关键词管理')">关键词管理</a></li>
                        <%
                            }
                            if (current_flags.contains("6009")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('xitong/thirdPartyApply.jsp','加盟申请')">加盟申请</a>
                        </li>
                        <%
                            }
                            if (current_flags.contains("6006")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('xitong/guanliyuan.jsp','后台管理员管理')">后台管理员管理</a>
                        </li>
                        <%
                            }
                            if (current_flags.contains("6003")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('xitong/userfeedback.jsp','用户反馈')">用户反馈</a></li>
                        <%
                            }
                            if (current_flags.contains("6008")) {
                        %>
                        <li><a href="javascript:window.parent.jianyi2('xitong/tuisong.jsp','会员推送')">会员推送</a></li>
                        <%
                        }
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

