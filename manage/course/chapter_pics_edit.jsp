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
    	out.print(chapter.ediPic(request, user_id, user_name));
    	return;
    }
	String pics_path="",name="";
    Doc doc = utildb.Get_Doc("id,pics,name", "bs_chapter", " where id=? and isdel=0", "mysqlss", new Object[]{id});
    if (doc == null) {
        out.print("信息不存在");
        return;
    } else {
    	pics_path=doc.get("pics");
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
    <script type='text/javascript' src='/public/js/global.js'></script>
     <link href='/public/js/operamasks/operamasks-ui.css' rel='stylesheet' type='text/css'/>
    <script type='text/javascript' src='/public/js/operamasks/operamasks-ui.min.js'></script>
     <style type="text/css">
        .del {
        	color:red;
        	width:30px;
            cursor: pointer;
        }
    </style>
    <script type="text/javascript">
        function usersave() {
            $("#tjbutton").attr("disabled", true);
            $("#tisspan").html("<img src='../images/loading.gif' />提交中，请稍候……");
            var upload_pics = '';
            $("input[name=upload_pic]").each(function () {
                if (upload_pics == "") {
                	upload_pics = $(this).val();
                } else {
                	upload_pics += "," + $(this).val();
                }
            });
            var titles='';
            $("input[name=title]").each(function () {
                if (titles == "") {
                	titles = $(this).val();
                } else {
                	titles += "," + $(this).val();
                }
            });
            $.ajax({
                dataType: "json",
                type: "post",
                url: "chapter_pics_edit.jsp",
                data: $("#form1").serialize()+"&upload_pics="+upload_pics+"&titles="+titles,
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
               <ul class="row1 clearfix">
                <li>
                       <h4 style="margin-bottom:20px;"><%=name%>--图片上传</h4>
                </li>
            </ul>
            <ul class="row1 clearfix">
                <li>
							<span class="input"> <span class="upload_file">
									<div>
                                        <div class="up_input">
                                            <input name="introduce" id="introduceUpload1" type="file"/>
                                        </div>
                                        <div class="tips">
                                            图片尺寸建议：600*230px
                                        </div>
                                        <div class="clear"></div>
                                    </div>
									<div class="img" id="introduceDetail1"></div>
							</span> </span>
                </li>
            </ul>
            <script type="text/javascript">
                $(document).ready(function () {
                    <%if (pics_path != null && !"".equals(pics_path)) {
                           JSONArray picArray=JSONArray.fromObject(pics_path);
                              for (int i = 0; i < picArray.size(); i++) {
                            	  String path="";
                            	  String title="";
                            	  JSONObject pic_json=picArray.optJSONObject(i);
                            	  if(pic_json==null||pic_json.isEmpty()){
                            		  path=picArray.optString(i);
                            	  }else{
                            		  path=pic_json.optString("path");
                            		  title=pic_json.optString("title");
                            	  }
                                  if (!path.equals("")) {
                                      %>
                    $('#introduceDetail1').append('<span><div>标题：<input type="text" name="title" value="<%=title%>"/></div><a href="<%=path%>" target="_blank"><img src="<%=path%>" height=150></a><span class="del">删除</span><input type="hidden" name="upload_pic" value="<%=path%>" /></span>');
                    <%}
                              }
                          }%>
                    $('#introduceDetail1 span span').off('click').on('click', function () {
                        $(this).parent().remove();
                    });
                });
            </script>

            <script type="text/javascript">
                var pic_count = 200;
                var callback = function (imgpath) {
                    if ($('#introduceDetail1 div').size() >= pic_count) {
                        alert('您上传的图片数量已经超过10张，不能再上传！');
                        return;
                    }
                    $('#introduceDetail1')
                            .append(
                                    '<span><div>标题：<input type="text" name="title" value=""/></div><a href="'
                                    + imgpath
                                    + '" target="_blank"><img src="'
                                    + imgpath
                                    + '" height=150></a><span class="del">删除</span><input type="hidden" name="upload_pic" value="'
                                    + imgpath + '" /></span>');
                    $('#introduceDetail1 span span').off('click').on('click', function () {
                        $(this).parent().remove();
                    });
                };
                if ($('#introduceUpload1').size()) {
                    var obj = $('#form1').find('input[name=upload_pic]');
                    global_obj.file_upload($('#introduceUpload1'), '', $('#introduceDetail1'),
                            '', true, pic_count, callback, '');
                }
            </script>
            <div class="row_btn">
                <button type="button" id="tjbutton" onclick="usersave()">确定提交</button>
                <span id="tisspan"></span>
            </div>
        </form>
    </div>
</div>
<!--End Sidebar--> </body>
</html>