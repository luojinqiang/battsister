<%@page import="java.util.ArrayList" %>
<%@page import="com.battsister.util.BasicType" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.battsister.admin.sys.*" %>
<%@ page import="com.baje.sz.util.*" %>
<%@page import="com.baje.sz.ajax.AjaxXml" %>
<%@ include file="../ini_sys.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    if (current_flags.indexOf(",4003,") < 0) {
        response.sendRedirect("../error.jsp?left=xitong");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    AdminLogin admin = new AdminLogin();
    String action = ru.getString("action");
    String action1 = ru.getString("action1");
    int id = ru.getInt("id");
    if (action.equals("addsave")) {//增加
        out.print(admin.editAdminUser(request, user_id, user_name).toString());
        return;
    }
    if (action.equals("editsave")) {//修改
        out.print(admin.editAdminUser(request, user_id, user_name).toString());
        return;
    }

    String ac_title = "";
    String name = "", username = "";
    String tel = "", sex = "", email = "", mobile = "", status = "Y", chengshi = "";
    String zhiwei = "", admin_zu = "", zhekous = "", flags = "";
    int jibie = 0, qiandan = 0, yuangong_id = 0;

    int login_err = 0;
    int islock = 0;
    String ka_no = "";
    int gymGroupId = 0, gymId = 0;
    double zhekou = 0;
    if (id == 0) {
        action = "addsave";
        ac_title = "添加账号";
    } else {
        action = "editsave";
        ac_title = "修改账号";
        Doc news = utildb.Get_Doc("*", "bs_sys_user", "where id=?", "", new Object[]{id});
        if (news == null) {
            out.println("信息不存在");
            return;
        }
        username = news.get("username");
        islock = news.getIn("islock");
        login_err = news.getIn("login_err");
        flags = news.get("flag", "");
    }
    String admin_flag = flags;
    String logstarttime = AjaxXml.Get_Date("now", "YY04-MM-DD HH:MI:SS");
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>table</title>
    <link href="../css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="../css/base.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script language="javascript" src='../js/sys.js'></script>
    <script language="javascript"  src='../js/qmango.js'></script>
    <script type="text/javascript">

        function usersave() {
            var id = $("#id").val();
            var action = $("#action").val();
            var user_name = $("#user_name").val();
            var islock = getradiobox("islock");
            var password = $("#password").val();
            var password1 = $("#password1").val();
            var login_err = $("#login_err").val();
            var flag1 = getcheckbox("flag1");
            var flag2 = getcheckbox("flag2");
            var flag3 = getcheckbox("flag3");
            var flag4 = getcheckbox("flag4");
            var flag = flag1 + "," + flag2 + "," + flag3 + "," + flag4 +",";
            if (user_name == "") {
                window.parent.art.dialog.alert('请输入账号');
                return;
            }
            if (action == "addsave" && password == "") {
                window.parent.art.dialog.alert('新增账号请输入用户密码');
                return;
            }
            if (password != "" && password != password1) {
                window.parent.art.dialog.alert('两次输入的密码不一致');
                return;
            }
            $("#tjbutton").attr("disabled", true);
            $("#tisspan").html("<img src='../images/loading.gif' />提交中，请稍候……");
            $.ajax({
                dataType: "json",
                type: "post",
                url: "guanliyuan_edit.jsp",
                data: "id=" + id + "&action=" + action + "&user_flag=" + flag + "&user_name=" + user_name + "&islock=" + islock +
                "&user_pwd=" + password + "&user_pwd2=" + password1 + "&login_err=" + login_err + "&logstarttime=<%=logstarttime%>",
                success: function (data) {
                    if (data.type) {
                        window.parent.art.dialog({
                            id: 'tisID',
                            content: data.msg,
                            lock: true,
                            icon: "succeed",
                            cancelVal: '确定',
                            cancel: function () {
                            	 <%=id>0?"window.parent.parent.location = '/manage/login.jsp'":" window.parent.location.reload();"%>
                                window.parent.art.dialog({id: "tisID"}).close();
                               
                                
                            }
                        });
                    } else {
                        window.parent.art.dialog.alert(data.msg);
                        $("#tjbutton").attr("disabled", false);
                        $("#tisspan").html("");
                    }

                }
            });
        }

    </script>
</head>
<body class="ifr">
<div id="dd" style="padding:5px;">
    <div class="box_input">
        <form id="form1" name="form1" method="post" action="">
            <input name="id" id="id" type="hidden" value="<%=id%>"/>
            <input name="action" id="action" type="hidden" value="<%=action1%>"/>
            <ul class="row2 clearfix">
                <li>帐号：
                    <%
                        if (id == 0) {
                            out.print("<input name=\"user_name\" type=\"text\" id=\"user_name\" size=\"15\" maxlength=\"20\" value=\"" + username + "\"/>");
                        } else {
                            out.print(username + "<input name=\"user_name\" type=\"hidden\" id=\"user_name\" size=\"15\" maxlength=\"20\" value=\"" + username + "\"/>");
                        }
                    %>
                    <input name="islock" id="islock" type="radio" value="0" <%
                        if (islock == 0) {
                            out.print("checked");
                        }
                    %>/>正常
                    <input type="radio" name="islock" id="islock" value="1" <%
                        if (islock == 1) {
                            out.print("checked");
                        }
                    %>/>锁定
                </li>
            </ul>
            <ul class="row3 clearfix">
                <li>密 码：<input name="password" type="password" id="password" size="15"/></li>
                <li>确认密码：<input name="password1" type="password" id="password1" size="15"/></li>
                <li>编辑时不输入则不更改密码</li>
            </ul>

            <ul class="row3 clearfix">
                <li>登录错误次数： <input name="login_err" id="login_err" type="text" value="<%=login_err%>"
                                   style="width:30px;"/></li>
                <li>错误5次帐号会被锁定，修改为0解锁</li>
            </ul>
            <ul class="row1 clearfix">
                <li>用户管理：
                    <input name="flag1" type="checkbox" value="1001" <%
                        if (admin_flag.indexOf(",1001,") > -1) {
                            out.print("checked");
                        }
                    %>/>学校管理
                     <input name="flag1" type="checkbox" value="1002" <%
                        if (admin_flag.indexOf(",1002,") > -1) {
                            out.print("checked");
                        }
                    %>/>教师管理
                     <input name="flag1" type="checkbox" value="1003" <%
                        if (admin_flag.indexOf(",1003,") > -1) {
                            out.print("checked");
                        }
                    %>/>学生管理
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="selectAll_flag1" type="checkbox" id="selectAll_flag1"
                                                         onchange="selectall(1)"/><span style="color:green;">全选</span>
                </li>
            </ul>
               <ul class="row1 clearfix">
                <li>课程管理：
                    <input name="flag2" type="checkbox" value="2001" <%
                        if (admin_flag.indexOf(",2001,") > -1) {
                            out.print("checked");
                        }
                    %>/>课程管理
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="selectAll_flag2" type="checkbox" id="selectAll_flag2"
                                                         onchange="selectall(2)"/><span style="color:green;">全选</span>
                </li>
            </ul>
            <ul class="row1 clearfix">
                <li>信息管理：
                    <input name="flag3" type="checkbox" value="3001" <%
                        if (admin_flag.indexOf(",3001,") > -1) {
                            out.print("checked");
                        }
                    %>/>信息栏目
                    <input name="flag3" type="checkbox" value="3002" <%
                        if (admin_flag.indexOf(",3002,") > -1) {
                            out.print("checked");
                        }
                    %>/>信息内容
                    <input name="flag3" type="checkbox" value="3003" <%
                        if (admin_flag.indexOf(",3003,") > -1) {
                            out.print("checked");
                        }
                    %>/>校企合作
                     <input name="flag3" type="checkbox" value="3004" <%
                        if (admin_flag.indexOf(",3004,") > -1) {
                            out.print("checked");
                        }
                    %>/>首页banner图 
                    <input name="flag3" type="checkbox" value="3005" <%
                        if (admin_flag.indexOf(",3005,") > -1) {
                            out.print("checked");
                        }
                    %>/>课程大纲
                     <input name="flag3" type="checkbox" value="3006" <%
                        if (admin_flag.indexOf(",3006,") > -1) {
                            out.print("checked");
                        }
                    %>/>习题库介绍
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="selectAll_flag3" type="checkbox" id="selectAll_flag3"
                                                         onchange="selectall(3)"/><span style="color:green;">全选</span>
                </li>
            </ul>
            <ul class="row1 clearfix">
                <li>系统：
                    <input name="flag4" type="checkbox" value="4001" <%
                        if (admin_flag.indexOf(",4001,") > -1) {
                            out.print("checked");
                        }
                    %>/>日志管理
                    <input name="flag4" type="checkbox" value="4002" <%
                        if (admin_flag.indexOf(",4002,") > -1) {
                            out.print("checked");
                        }
                    %>/>关键字管理
                   
                    <input name="flag4" type="checkbox" value="4003" <%
                        if (admin_flag.indexOf(",4003,") > -1) {
                            out.print("checked");
                        }
                    %>/>后台管理员管理
                     <input name="flag4" type="checkbox" value="4004" <%
                        if (admin_flag.indexOf(",4004,") > -1) {
                            out.print("checked");
                        }
                    %>/>用户反馈
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="selectAll_flag4" type="checkbox" id="selectAll_flag4"
                                                         onchange="selectall(4)"/><span style="color:green;">全选</span>
                </li>
            </ul>
            <div class="row_btn">
                <button type="button" id="tjbutton" onclick="usersave()">确定提交</button>
                <span id="tisspan"></span>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" language="javascript">
    function selectall(num) {
        switch (num) {
            case 1:
                if ($("#selectAll_flag1").attr("checked")) {
                    $("input[name='flag1']").each(function () {
                        $(this).attr("checked", true);
                    });
                } else {
                    $("input[name='flag1']").each(function () {
                        $(this).attr("checked", false);
                    });
                }
                break;
            case 2:
                if ($("#selectAll_flag2").attr("checked")) {
                    $("input[name='flag2']").each(function () {
                        $(this).attr("checked", true);
                    });
                } else {
                    $("input[name='flag2']").each(function () {
                        $(this).attr("checked", false);
                    });
                }
                break;
            case 3:
                if ($("#selectAll_flag3").attr("checked")) {
                    $("input[name='flag3']").each(function () {
                        $(this).attr("checked", true);
                    });
                } else {
                    $("input[name='flag3']").each(function () {
                        $(this).attr("checked", false);
                    });
                }
                break;
            case 4:
                if ($("#selectAll_flag4").attr("checked")) {
                    $("input[name='flag4']").each(function () {
                        $(this).attr("checked", true);
                    });
                } else {
                    $("input[name='flag4']").each(function () {
                        $(this).attr("checked", false);
                    });
                }
                break;
        }
    }
</script>
</body>
</html>