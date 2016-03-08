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
    if (!(current_flags.indexOf(",1001,") > -1)) {
        out.print("<script>alert('没有对应的权限');</script>");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    int id = ru.getInt("id");
    if (action.equals("save")) {//更新
    	Teacher teacher=new Teacher();
    	out.print(teacher.editBuyClass(request, user_id, user_name));
    	return;
    }
	String video_path="";
    Doc doc = utildb.Get_Doc("id,video_path", "bs_chapter", " where id=? and isdel=0", "mysqlss", new Object[]{id});
    if (doc == null) {
        out.print("信息不存在");
        return;
    } else {
    	video_path=doc.get("video_path");
    	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>table</title>
    <link href="../css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="../css/base.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" src='../js/sys.js'></script>
    <script type='text/javascript' src='/public/js/operamasks/operamasks-ui.min.js'></script>
     <!-- 七牛上传相关开始 -->
    <script type="text/javascript" src="/js/qiniu_js/demo/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="/js/qiniu_js/demo/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/qiniu_js/demo/js/plupload/plupload.full.min.js"></script>
	<script type="text/javascript" src="/js/qiniu_js/demo/js/plupload/i18n/zh_CN.js"></script>
	<script type="text/javascript" src="/js/qiniu_js/demo/js/ui.js"></script>
	<script type="text/javascript" src="/js/qiniu_js/src/qiniu.js"></script>
	<script type="text/javascript" src="/js/qiniu_js/demo/js/highlight/highlight.js"></script>
	<script type="text/javascript" src="/js/qiniu_js/demo/js/main.js"></script>
    <!-- 结束 -->
    <script type="text/javascript">
        function usersave() {
            $("#tjbutton").attr("disabled", true);
            $("#tisspan").html("<img src='../images/loading.gif' />提交中，请稍候……");
            var chapter_str="";
            $("input:checked").each(function (){
            	chapter_str+=","+$(this).val();
            });
            $.ajax({
                dataType: "json",
                type: "post",
                url: "buy_class_edit.jsp",
                data: $("#form1").serialize()+"&chapter_str="+chapter_str,
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
                        <label>
                            视频路径：
                        </label>
                        <div class="container">
							    <div class="body">
       <div>
        <div class="col-md-12">
            <div id="container">
               <input type="button" value="选择文件" id="pickfiles" style="width:80px;height:30px;background-color: #9AFF9A;border-style: ridge;"/>
            	<%
            		if(video_path!=null&&!"".equals(video_path)){
            			out.print("<input type=\"hidden\" name=\"video_path\" value=\""+video_path+"\"/><span id=\"show_path\">"+video_path+"</span>");
            		}
            	%>
            </div>
        </div>
    </div>
</div>
</div>
 <div id="fsUploadProgress" style="width:opx;background-color:#9AFF9A;text-align: center;margin-top:3px;"></div>
                </li>
            </ul>
            <div class="row_btn" style="margin-top:20px;">
                <button type="button" id="tjbutton" onclick="usersave()">确定提交</button>
                <span id="tisspan"></span>
            </div>
        </form>
    </div>
</div>
<!--End Sidebar--> </body>
</html>