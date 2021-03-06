<%@page import="com.baje.sz.util.Doc" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.battsister.model.Course" %>
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
    String action = ru.getString("action");
    if (action.equals("save")) {
        Course course = new Course();
        JSONObject result = course.edit(request, user_id, user_name);
        out.print(result);
        return;
    }

    int order_num = 0;
    int is_recommend = 0;
    String content = "";
    String pic = "";
    String name = "";
    int id = ru.getInt("id");
    action = "save";
    if (id > 0) {
        Doc doc = utildb.Get_Doc("id,name,content,add_time,is_recommend,pic,order_num", "bs_course", "where id=?", "", new Object[]{new Integer(id)});
        if (doc != null) {
            name = doc.get("name");
            pic = doc.get("pic");
            is_recommend = doc.getIn("is_recommend");
            order_num = doc.getIn("order_num");
            content = doc.getString("content");
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
            <ul class="row3 clearfix">
                <li>
                    <label for="name">题目：</label>
                    <input type="text" name="name" id="name" value="<%=name %>" style="width:300px;"/>
                </li>
                <li>
                    <label for="name">题目类型：</label>
                    <select name="type" id="type">
                        <option value="0">单选</option>
                        <option value="2">多选</option>
                    </select>
                </li>
                <li>排序：<input type="text" name="order_num" id="order_num" value="<%=order_num %>" style="width:50px;"/>数字越小排序越靠前</li>
            </ul>
            <ul class="row1 clearfix">
                <li>题目图片：
                    <span class="input">
                        <span class="upload_file">
                            <div>
                                <div class="up_input">
                                    <input name="FileUpload" id="smallfileUpload" type="file"/>
                                </div>
                                <div class="tips"></div>
                                <div class="clear"></div>
                                <input type="hidden" name="pic" value="<%=pic%>"/>
                            </div>
                            <div class="img" id="smallfileDetail"></div>
                        </span>
                    </span>
                </li>
            </ul>

            <ul class="row3">
                <div class="form_table">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <th width="4%"></th>
                        <th width="8%">答案</th>
                        <th width="8%">图片</th>
                        <th width="8%">标记为答案</th>
                        <th width="8%">操作</th>
                    </tr>
                    <tr>
                        <td>1、</td>
                        <td><input type="text" value=""></td>
                        <td><input type="file"></td>
                        <td><input name="answer" type="radio"></td>
                    </tr>
                    <tr>
                        <td>2、</td>
                        <td><input type="text" value=""></td>
                        <td><input type="file"></td>
                        <td><input name="answer" type="radio"></td>
                    </tr>
                    <tr>
                        <td>3、</td>
                        <td><input type="text" value=""></td>
                        <td><input type="file"></td>
                        <td><input name="answer" type="radio"></td>
                    </tr>
                </table>
                    </div>
            </ul>

            <script>
                if ($('#smallfileUpload').size()) {
                    global_obj.file_upload($('#smallfileUpload'), $('#form1 input[name=pic]'), $('#smallfileDetail'), 'web_column');
                    $('#smallfileDetail').html(global_obj.img_link($('#form1 input[name=pic]').val()));
                    if ($('#form1 input[name=pic]').val() != '') {
                        $('#smallfileDetail').append('<div class="del">删除</div>');
                    }
                    $('#smallfileDetail div').click(function () {
                        $('#form1 input[name=pic]').val('');
                        $(this).parent().html('');
                    });
                }
            </script>
            <ul class="row1 clearfix">
                <li>
                    <script type="text/plain" id="contents" name="contents" class="ckeditor"><%=content %></script>
                    <script type="text/javascript">var editor = new baidu.editor.ui.Editor(edit_options);
                    editor.render("contents");
                    </script>
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
        var content = editor.getContent();
        if (name == "") {
            window.parent.art.dialog.alert('请输入课程名称');
            return;
        }
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
            url: "course_edit.jsp",
            data: $("#form1").serialize() + "&content=" + content + "",
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