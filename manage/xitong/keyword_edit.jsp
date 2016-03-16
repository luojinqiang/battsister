<%@page import="com.baje.sz.ajax.AjaxXml" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.baje.sz.util.*" %>
<%@ page import="com.battsister.admin.sys.*" %>
<%@ page import="com.battsister.util.*" %>
<%@ include file="../ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    if (current_flags.indexOf(",4002,") < 0) {
        response.sendRedirect("../error.jsp?left=xitong");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    int id = ru.getInt("id");
    Keyword dw = new Keyword();
    if (action.equals("usersave")) {
        out.print(dw.keywordEdit(request, user_id, user_name).toString());
        return;
    }

    String keyword = "";
    String replace_word = "";
    int key_type = 0;
    if (id > 0) {
        Doc doc = utildb.Get_Doc("id,keyword,replace_word,key_type", "bs_sys_keyword", "where id=? and isdel=0", "mysqlss", new Object[]{id});
        if (doc != null && !doc.isEmpty()) {
            keyword = doc.get("keyword");
            replace_word = doc.get("replace_word");
            key_type = doc.getIn("key_type");
        }
    }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>table</title>
    <link href="../css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="../css/base.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script language=javascript src='../js/sys.js'></script>
    <link type="text/css" rel="stylesheet" href="../css/jquery.alert.css"/>
    <script type="text/javascript" src="../js/jquery.alert.js"></script>
    <script type="text/javascript">

        function usersave() {
            var keyword = $("#keyword").val();

            if (keyword == "") {
                $("#keyword").alert('关键字不能为空');
                return;
            }
            $("#tjbutton").attr("disabled", true);
            $("#tisspan").html("<img src='../images/loading.gif' />提交中，请稍候……");
            $.ajax({
                dataType: "json",
                type: "post",
                url: "keyword_edit.jsp",
                data: $("#form1").serialize(),
                success: function (msg) {
                    if (msg.type == true) {
                        window.parent.art.dialog({
                            id: 'tisID',
                            content: msg.msg,
                            lock: true,
                            icon: "succeed",
                            cancelVal: '确定',
                            cancel: function () {
                                window.parent.location.reload();
                                window.parent.art.dialog({id: "tisID"}).close();
                                window.parent.art.dialog({id: "xitong"}).close();
                            }
                        });
                    } else {
                        window.parent.art.dialog.alert(msg.msg);
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
            <input name="action" id="action" type="hidden" value="usersave"/>
            <ul class="row1 clearfix">
                <li>关键字：<input name="keyword" type="text" value="<%=keyword%>" id="keyword" size="40"/>
                </li>
            </ul>
            <ul class="row1 clearfix">
                <li>状态：<select name="key_type" id="key_type">
                    <option value="0" <%=(key_type == 0) ? "selected=\"selected\"" : "" %>>不能出现</option>
                </select>
                </li>
            </ul>

            <div class="row_btn">
                <button type="button" id="tjbutton" onclick="usersave()">确定提交</button>
                <span id="tisspan"></span>
            </div>
        </form>
    </div>

</div>
</body>
</html>