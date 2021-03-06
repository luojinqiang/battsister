<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.baje.sz.util.*" %>
<%@ page import="com.baje.sz.ajax.*" %>
<%@ page import="com.battsister.admin.sys.*" %>
<%@ include file="../ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    if (current_flags.indexOf(",1001,") < 0) {
        response.sendRedirect("../error.jsp?left=yonghu");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    int id = ru.getInt("id");
    if (action.equals("save")) {//更新
    	School school=new School();
    	out.print(school.editSchool(request, user_id, user_name));
    	return; 
    }
	String name="",address="",tel="",fax="",email="",contact="",beizhu="",weburl="",logo="";
    if (id > 0) {
        Doc doc = utildb.Get_Doc("name,address,tel,fax,email,contact,beizhu,weburl,logo","bs_schools", " where id=? and isdel=0", "mysqlss", new Object[]{id});
        if (doc == null) {
            out.print("信息不存在");
            return;
        } else {
        	name=doc.get("name");
        	address=doc.get("address");
        	tel=doc.get("tel");
        	fax=doc.get("fax");
        	email=doc.get("email");
        	contact=doc.get("contact");
        	beizhu=doc.get("beizhu");
        	weburl=doc.get("weburl");
        	logo=doc.get("logo");
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
    <script language="javascript" src='../js/sys.js'></script>
    <script language="javascript" src='../js/webcalendar.js'></script>
    <script type='text/javascript' src='/public/js/global.js'></script>
    <script type='text/javascript' src='/public/js/operamasks/operamasks-ui.min.js'></script>
    <script type="text/javascript">
        function usersave() {
            $("#tjbutton").attr("disabled", true);
            $("#tisspan").html("<img src='../images/loading.gif' />提交中，请稍候……");
            $.ajax({
                dataType: "json",
                type: "post",
                url: "schools_edit.jsp",
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
                                window.parent.location.reload();
                                window.parent.art.dialog({id: "tisID"}).close();
                                window.parent.art.dialog({id: "user"}).close();
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
            <input name="action" id="action" type="hidden" value="save"/>

            <ul class="row3 clearfix">
                <li>学校名称：<input type="text" name="name" value="<%=name%>" /></li>
                <li>联系人：<input type="text" value="<%=contact%>" name="contact"/></li>
                <li>联系电话：<input type="text" name="tel" value="<%=tel%>"/></li>
            </ul>
            <ul class="row3 clearfix">
            <li>
            	邮箱：<input type="text" name="email" value="<%=email%>"/>
            </li>
            <li>
            	传真：<input type="text" name="fax" value="<%=fax%>"/>
            </li>
                <li>
              	  学校地址：<input type="text" name="address" value="<%=address%>"/>
                </li>
            </ul>
            <ul class="row3 clearfix">
	           	<li>
	           		学校官网：<input type="text" name="weburl" value="<%=weburl%>"/>
	           	</li>
	           
            </ul>
             <ul class="row1 clearfix">
                <li>logo：
							<span class="input"> <span class="upload_file">
									<div>
                                        <div class="up_input">
                                            <input name="FileUpload" id="smallfileUpload1" type="file"/>
                                        </div>
                                        <div class="tips">
                                            图片尺寸建议：200px*60px
                                        </div>
                                        <div class="clear"></div>
                                        <input type="hidden" name="logo"
                                               value="<%=logo%>"/>
                                    </div>
									<div class="img" id="smallfileDetail1" style="width: 100px;"></div>
							</span> </span>
                </li>
            </ul>
             <script type="text/javascript">
                if ($('#smallfileUpload1').size()) {
                    global_obj.file_upload($('#smallfileUpload1'),
                            $('#form1 input[name=logo]'), $('#smallfileDetail1'),
                            'web_column');
                    $('#smallfileDetail1').html(
                            global_obj.img_link($('#form1 input[name=logo]').val()));
                    if ($('#form1 input[name=logo]').val() != '') {
                        $('#smallfileDetail1').append('<div class="del">删除</div>');
                    }
                    $('#smallfileDetail1 div').click(function () {
                        $('#form1 input[name=logo]').val('');
                        $(this).parent().html('');
                    });
                }
            </script>
            <ul class="row1 clearfix">
            	<li>
            	备注：<textarea rows="5" cols="50"><%=beizhu%></textarea>
            	</li>
            </ul>
            <div class="row_btn">
                <button type="button" id="tjbutton" onclick="usersave()">确定提交</button>
                <span id="tisspan"></span>
            </div>
        </form>
    </div>

</div>
<!--End Sidebar--> </body>
</html>