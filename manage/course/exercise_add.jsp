<%@page import="com.baje.sz.util.RequestUtil" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.battsister.model.ExerciseLibrary" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ include file="../ini_sys.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    if (current_flags.indexOf(",2001,") < 0) {
        response.sendRedirect("../error.jsp?left=yonghu");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    ExerciseLibrary el = new ExerciseLibrary();
    String action = ru.getString("action");
    if (action.equals("save")) {
        out.print(el.edit(request, user_id, user_name));
        return;
    }

    int order_num = 0;
    String thoughts = "";
    String pic = "";
    String name = "";
    int id = ru.getInt("id");
    int course_id = ru.getInt("course_id");
    int chapter_id = ru.getInt("chapter_id");
    int type = 0;
    action = "save";
    if (id > 0) {
        JSONObject doc = el.queryById(id);
        if (!doc.isEmpty()) {
            name = doc.getString("name");
            pic = doc.getString("name_pic");
            order_num = doc.getInt("order_num");
            thoughts = doc.getString("thoughts");
            type = doc.getInt("type");
        }
    }
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>table</title>
    <link href="../css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="../css/base.css" rel="stylesheet" type="text/css"/>


    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script language="javascript" src='../js/sys.js'></script>
    <script type="text/javascript" src="/public/js/ueditor1_2_3_0/editor_config.js"></script>
    <script type="text/javascript" src="/public/js/ueditor1_2_3_0/editor_all.js"></script>
    <link rel="stylesheet" href="/public/js/ueditor1_2_3_0/themes/default/ueditor.css"/>
    <script type='text/javascript' src='/public/js/global.js'></script>
    <link type="text/css" rel="stylesheet" href="/public/js/jquery.alerts.css"/>
    <script type="text/javascript" src="/public/js/jquery.alerts.js"></script>
    <link href='/public/js/operamasks/operamasks-ui.css' rel='stylesheet' type='text/css'/>
    <script type='text/javascript' src='/public/js/operamasks/operamasks-ui.min.js'></script>
    <style type="text/css">
        .del {
            bottom: 0;
            height: 22px;
            width: 100px;
            line-height: 22px;
            text-align: center;
            background: #000;
            color: #fff;
            filter: alpha(opacity=70);
            -moz-opacity: 0.7;
            -khtml-opacity: 0.7;
            opacity: 0.7;
            cursor: pointer;
        }
    </style>
</head>
<body class="ifr">
    <div class="box_input">
        <form id="form1" name="form1">
            <input name="id" id="id" type="hidden" value="<%=id%>"/>
            <input name="action" id="action" type="hidden" value="<%=action%>"/>
            <input type="hidden" name="course_id" value="<%=course_id%>">
            <input type="hidden" name="chapter_id" value="<%=chapter_id%>">
            <ul class="row1 clearfix">
                <li>
                    <label for="name">习题名称：</label>
                    <input type="text" name="name" id="name" value="<%=name %>" style="width:300px;"/>
                </li>
            </ul>
            <ul class="row1 clearfix">
                <li>
                    <span class="input">
                        <span class="upload_file">
                            <div>
                                <div class="up_input">
                                    <input name="FileUpload" id="smallfileUpload" type="file"/>
                                </div>
                                <div class="tips"></div>
                                <div class="clear"></div>
                                <input type="hidden" name="name_pic" value="<%=pic%>"/>
                            </div>
                            <div class="img" id="smallfileDetail"></div>
                        </span>
                    </span>
                </li>
            </ul>
            <ul class="row2 clearfix">
                <li>题目类型：
                    <select name="type" id="type">
                        <option value="0" <%=type==0?"selected":""%>>单选题</option>
                        <option value="1" <%=type==1?"selected":""%>>多选题</option>
                    </select>
                </li>
                <li>排序：<input type="text" name="order_num" id="order_num" value="<%=order_num %>" style="width:50px;"/>数字越小排序越靠前</li>
            </ul>
            <script>
                global_obj.file_upload($('#smallfileUpload'), $('#form1 input[name=name_pic]'), $('#smallfileDetail'), 'web_column');
                $('#smallfileDetail').html(global_obj.img_link($('#form1 input[name=name_pic]').val()));
                if ($('#form1 input[name=name_pic]').val() != '') {
                    $('#smallfileDetail').append('<div class="del">删除</div>');
                }
                $('#smallfileDetail div').click(function () {
                    $('#form1 input[name=name_pic]').val('');
                    $(this).parent().html('');
                });
            </script>
            <ul class="row1 clearfix">
                <li>解题思路：
                    <script type="text/plain" id="contents" name="contents" class="ckeditor"><%=thoughts %></script>
                    <script type="text/javascript">var editor = new baidu.editor.ui.Editor(edit_options);editor.render("contents");</script>
                </li>
            </ul>
            <div class="row_btn">
                <button type="button" class="btn_formA" onclick="usersave()" name="tjbutton" id="tjbutton">确定保存</button>
                <span id="tisspan"></span>
            </div>
        </form>
</div><!--r_iframe END-->

<script type="text/javascript">
    function usersave() {
        var name = $("#name").val();
        if (name == "") {
            window.parent.art.dialog.alert('请输入课程名称');
            return;
        }
        var content = editor.getContent();
        if (content == "") {
            content = "<p></p>";
        }
        String.prototype.replaceAll = function (s1, s2) {
            return this.replace(new RegExp(s1, "gm"), s2);
        };
        content = content.replaceAll("&", "^…");
        $("#tjbutton").attr("disabled", true);
        $("#tisspan").html("<img src='../images/loading.gif' />提交中，请稍候……");
        $.ajax({
            type: "post",
            dataType: "json",
            url: "exercise_add.jsp",
            data: $("#form1").serialize() + "&thoughts=" + content + "",
            success: function (msg) {
                if (msg.type) {
                    window.parent.art.dialog({
                        id: 'tisID',
                        content: msg.msg,
                        lock: true,
                        icon: "succeed",
                        cancelVal: '确定',
                        cancel: function () {
                            $("#tjbutton").attr("disabled", false);
                            $("#tisspan").html("");
                            window.parent.location.reload();
                            window.parent.art.dialog({id: "tisID"}).close();
                            window.parent.art.dialog({id:"user"}).close();
                            //window.parent.jianyi2('/manage/course/course.jsp', '课程管理');
                            //window.parent.tabclose("课程管理");
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
<%@ include file="../end.jsp" %><!--End Sidebar-->
</body>
</html>