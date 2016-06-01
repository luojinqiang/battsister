<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.baje.sz.ajax.AjaxXml" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ include file="../ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    if (current_flags.indexOf(",3002,") < 0) {
        response.sendRedirect("../error.jsp?left=xinxi");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    if (action.equals("save")) {
    	InfoApi infoApi=new InfoApi();
        JSONObject result = infoApi.ediCourseOutline(request, user_id, user_name);
        out.print(result);
        return;
    }
    String course_outline="";
    Doc doc=utildb.Get_Doc("id,course_outline", "bs_info", "","mysqlss");
   	if(doc!=null){
   		course_outline=doc.get("course_outline");
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
    <script language="javascript" src='../js/sys.js'></script>
    <script type="text/javascript" src="/public/js/ueditor1_2_3_0/editor_config.js"></script>
    <script type="text/javascript" src="/public/js/ueditor1_2_3_0/editor_all.js"></script>
    <link rel="stylesheet" href="/public/js/ueditor1_2_3_0/themes/default/ueditor.css"/>
    <script type='text/javascript' src='/public/js/global.js'></script>
    <link type="text/css" rel="stylesheet" href="/public/js/jquery.alerts.css"/>
    <script type="text/javascript" src="/public/js/jquery.alerts.js"></script>
    <link href='/public/js/operamasks/operamasks-ui.css' rel='stylesheet' type='text/css'/>
    <script type='text/javascript' src='/public/js/operamasks/operamasks-ui.min.js'></script>
    <script type="text/javascript">
        function usersave() {
            $("#tjbutton").attr("disabled", true);
            $("#tisspan").html("<img src='../images/loading.gif' />提交中，请稍候……");
            $.ajax({
                dataType: "json",
                type: "post",
                url: "outline.jsp",
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
                                 window.parent.art.dialog({id: "tisID"}).close();
                                 window.parent.tabclose("课程大纲"); 
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
<%
	StringBuffer addBuffer=new StringBuffer("");
	if(course_outline!=null&&!"".equals(course_outline)){
		addBuffer.append("<div style=\"margin-top:10px;\">"+
				"<a href=\"/pdf/web/viewer.jsp?file=" +course_outline + "\" target=\"_blank\"><img src=\"/public/images/word.png\""+
                      " height=150></a><input type=\"hidden\" name=\"course_outline\" value=\""+
                       ""+course_outline+" \" /></div>");
		
	}
%>
<div id="dd" style="padding:5px;">
    <div class="box_input">
        <form id="form1" name="form1" method="post" action="">
        <input type="hidden" name="action" value="save"/>
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
                            </div>
                            <div class="img" id="smallfileDetail"></div>
                        </span>
                    </span>
                </li>
            </ul>
           <script type="text/javascript">
             
                var callback = function (imgpath, realName) {
                    var append = '<div style="margin-top:10px;"><a href="/pdf/web/viewer.jsp?file=' + (imgpath) + '" target="_blank"><img src="'
                            + '/public/images/word.png'
                            + '" height=150></a><input type="hidden" name="course_outline" value="'
                            + imgpath + '" /></div>';
                    $('#smallfileDetail').html(append);
                };
                global_obj.file_upload($('#smallfileUpload'), '', $('#smallfileDetail'), '', true, 20, callback, '.pdf');

            </script>
            <div class="row_btn" style="margin-top:20px;">
                <button type="button" id="tjbutton" onclick="usersave()">确定提交</button>
                <span id="tisspan"></span>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
	$(document).ready(function (){
		$('#smallfileDetail').html('<%=addBuffer%>');
		 $('.del').off('click').on('click', function () {
             $(this).parent().remove();
         });
	});
</script>
<%@ include file="../end.jsp" %><!--End Sidebar-->
<!--End Sidebar--> </body>
</html>