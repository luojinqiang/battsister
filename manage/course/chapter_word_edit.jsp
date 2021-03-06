<%@page import="com.g.Tojpg.Pdf2Jpg"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
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
    if (current_flags.indexOf(",2001,") < 0) {
        response.sendRedirect("../error.jsp?left=yonghu");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    int id = ru.getInt("id");
    if (action.equals("save")) {//更新
    	Chapter chapter=new Chapter();
    	out.print(chapter.editWord(request, user_id, user_name));
    	return;
    }
	String word_path="",name="";
    Doc doc = utildb.Get_Doc("id,word_path,name", "bs_chapter", " where id=? and isdel=0", "mysqlss", new Object[]{id});
    if (doc == null) {
        out.print("信息不存在");
        return;
    } else {
    	word_path=doc.get("word_path");
    	name=doc.get("name");
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
    <script type='text/javascript' src='/public/js/operamasks/operamasks-ui.min.js'></script>
     <script type='text/javascript' src='/public/js/global.js'></script>
     <link href='/public/js/operamasks/operamasks-ui.css' rel='stylesheet' type='text/css'/>
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
    <script type="text/javascript">
        function usersave() {
            $("#tjbutton").attr("disabled", true);
            $("#tisspan").html("<img src='../images/loading.gif' />提交中，请稍候……");
            var title_str="";
            var word_str="";
            var num_str="";
            var order_str="";
            $("input[name=word_pic]").each(function (){
            	word_str+=","+$(this).val();
            });
            $("input[name=title]").each(function (){
            	title_str+=","+$(this).val();
            });
            $("input[name=num]").each(function (){
            	num_str+=","+$(this).val();
            });
            $("input[name=order_no]").each(function (){
            	order_str+=","+$(this).val();
            });
            $.ajax({
                dataType: "json",
                type: "post",
                url: "chapter_word_edit.jsp",
                data: $("#form1").serialize()+"&title_str="+title_str+"&word_str="+word_str+"&num_str="+num_str+"&order_str="+order_str,
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
<%
	StringBuffer addBuffer=new StringBuffer("");
	if(word_path!=null&&!"".equals(word_path)){
		JSONArray pathArray=JSONArray.fromObject(word_path);
		if(pathArray!=null){
			for(int i=0;i<pathArray.size();i++){
				JSONObject path_json=pathArray.getJSONObject(i);
				addBuffer.append("<div style=\"margin-top:10px;\"><div>请输入标题：<input type=\"text\" name=\"title\" style=\"width:120;\" value=\""+path_json.optString("title")+"\"/>排序：<input type=\"number\" name=\"order_no\" value=\""+path_json.optInt("order_no")+"\" style=\"max-width:30px;\"/>"+
						"</div><a href=\"/pdf/web/viewer.jsp?file="+path_json.optString("pic_dir")+"\" target=\"_blank\"><img src=\"/public/images/word.png\""+
                        " height=150></a><div class=\"del\">删除</div><input type=\"hidden\" name=\"word_pic\" value=\""+
                         ""+path_json.optString("pic_dir")+" \" /><input type=\"hidden\" name=\"num\" value=\""+path_json.optInt("num")+"\"/></div>");
			}
		}
		
	}
%>
<div id="dd" style="padding:5px;">
    <div class="box_input">
        <form id="form1" name="form1" method="post" action="">
            <input name="id" id="id" type="hidden" value="<%=id%>"/>
            <input name="action" id="action" type="hidden" value="save"/>
            	      <ul class="row1 clearfix">
                <li>
                       <h4 style="margin-bottom:20px;"><%=name%>--word文档上传</h4>
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
                            </div>
                            <div class="img" id="smallfileDetail"></div>
                        </span>
                    </span>
                </li>
            </ul>
           <script type="text/javascript">
             
                var callback = function (imgpath,realName) {
                    var append= '<div style="margin-top:10px;"><div>标题：<input type="text" name="title" style="width:120px;" value="'+realName+'"/>排序：<input type="number" name="order_no" value="" style="max-width:30px;"/></div><a href="/pdf/web/viewer.jsp?file='+(imgpath)+'" target="_blank"><img src="'
                            + '/public/images/word.png'
                            + '" height=150></a><div class="del">删除</div><input type="hidden" name="word_pic" value="'
                            + imgpath + '" /></div>';
                    $('#smallfileDetail').append(append);
                    $('.del').off('click').on('click', function () {
                        $(this).parent().remove();
                    });
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
		$('#smallfileDetail').append('<%=addBuffer%>');
		 $('.del').off('click').on('click', function () {
             $(this).parent().remove();
         });
	});
</script>
<!--End Sidebar--> </body>
</html>