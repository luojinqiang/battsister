<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html; charset=utf-8" %>
<%@page import="com.baje.sz.util.RequestUtil" %>
<%@page import="com.battsister.model.ExerciseOption" %>
<%@page import="net.sf.json.JSONObject" %>
<%@include file="../ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    if (current_flags.indexOf(",2001,") < 0) {
        response.sendRedirect("../error.jsp?left=yonghu");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    ExerciseOption eo = new ExerciseOption();
    String action = ru.getString("action");
    if (action.equals("save")) {
        out.print(eo.edit(request, user_id, user_name));
        return;
    }

    int order_num = 0;
    String pic = "";
    String name = "";
   /*  qName=new String(qName.getBytes("ISO-8859-1"),"UTF-8"); */
    int id = ru.getInt("id");
    int course_id = ru.getInt("course_id");
    int chapter_id = ru.getInt("chapter_id");
    int elId = ru.getInt("elId");
    Doc questionDoc=utildb.Get_Doc("id,name","bs_exercise_library", "where id=? ","mysqlss",new Object[]{elId});
    if(questionDoc==null||questionDoc.isEmpty()){
    	out.print("信息不存在");
    	return;
    }
    String qName = questionDoc.get("name");
    int type = ru.getInt("type");
    int is_answer = 0;
    action = "save";
    if (id > 0) {
        JSONObject doc = eo.queryById(id);
        if (!doc.isEmpty()) {
            name = doc.getString("name");
            pic = doc.getString("pic");
            order_num = doc.getInt("order_num");
            is_answer = doc.getInt("is_answer");
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
            <input type="hidden" name="elId" value="<%=elId%>">
            <input type="hidden" name="type" value="<%=type%>">
            <ul class="row1 clearfix">
                <li>
                    <label for="name">问题：<%=qName%> [<%=type==1?"多选题":"单选题"%>]</label>
                </li>
                <li>
                    <label for="name">选项：</label>
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
                <li>设为答案：
                    <select name="is_answer" id="is_answer">
                        <option value="0" <%=is_answer==0?"selected":""%>>否</option>
                        <option value="1" <%=is_answer==1?"selected":""%>>是</option>
                    </select>
                    <%=type==1?"":"(如果设为答案，其他选项将无效)"%>
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

            <div class="row_btn">
                <button type="button" class="btn_formA" onclick="usersave()" name="tjbutton" id="tjbutton">确定保存</button>
                <span id="tisspan"></span>
            </div>
        </form>
</div><!--r_iframe END-->

<script type="text/javascript">
    function usersave() {
        /*var name = $("#name").val();
        if (name == "") {
            window.parent.art.dialog.alert('请输入答案');
            return;
        }*/

        $("#tjbutton").attr("disabled", true);
        $("#tisspan").html("<img src='../images/loading.gif' />提交中，请稍候……");
        $.ajax({
            type: "post",
            dataType: "json",
            url: "exercise_option_add.jsp",
            data: $("#form1").serialize(),
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