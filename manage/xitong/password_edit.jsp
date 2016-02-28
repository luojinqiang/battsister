<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.baje.sz.ajax.AjaxXml" %>
<%@ page import="com.baje.sz.util.Doc" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.hanyou.admin.sys.AdminLogin" %>
<%@ include file="../ini_sys.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    RequestUtil ru = new RequestUtil(request);
    AdminLogin admin = new AdminLogin();
    String action = ru.getString("action");
    if (action.equals("editsave")) {//修改
        out.print(admin.editPassword(request, user_id, user_name).toString());

        return;
    }
    if (action.equals("editsave")) {//修改
        out.print(admin.editPassword(request, user_id, user_name).toString());
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
    if (user_id > 0) {
        action = "editsave";
        ac_title = "修改账号";
        Doc news = utildb.Get_Doc("username", "bs_sys_user", "where id=?", "", new Object[]{user_id});
        if (news == null) {
            out.println("信息不存在");
            return;
        }
        user_name = news.get("username");
    }
    String logstarttime = AjaxXml.Get_Date("now", "YY04-MM-DD HH:MI:SS");
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>table</title>
    <link href="../css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="../css/base.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src='../js/qmango.js'></script>
    <script type="text/javascript">
        function usersave() {
            var id = $("#id").val();
            var action = $("#action").val();
            var user_name = $("#user_name").val();
            var password = $("#password").val();
            var password1 = $("#password1").val();
            if (password == "") {
                window.parent.art.dialog.alert('请输入用户密码');
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
                url: "password_edit.jsp",
                data: "id=" + id + "&action=" + action + "&user_name=" + user_name + "&user_pwd=" + password + "&user_pwd2=" + password1,

                success: function (data) {
                    if (data.type) {
                        window.parent.art.dialog({
                            id: 'tisID',
                            content: data.msg,
                            lock: true,
                            icon: "succeed",
                            cancelVal: '确定',
                            cancel: function () {
                                window.parent.location.href = "/manage/login.jsp";
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
<%@ include file="../left.jsp" %>
<div class="iframe_box">
    <div class="box_input">
        <form id="form1" name="form1" method="post" action="">
            <input name="userid" id="id" type="hidden" value="<%=user_id%>"/>
            <input name="action" id="action" type="hidden" value="<%=action%>"/>
            <ul class="row2 clearfix">
                <li>
                    帐号:<%=user_name%>
                </li>
            </ul>
            <ul class="row3 clearfix">
                <li>密 码：<input name="password" type="password" id="password" size="15"/></li>
                <li>确认密码：<input name="password1" type="password" id="password1" size="15"/></li>
                <div class="row_btn">
                    <button type="button" id="tjbutton" onclick="usersave()">确定提交</button>
                    <span id="tisspan"></span>
                </div>
            </ul>
        </form>
    </div>
</div>
</body>
</html>