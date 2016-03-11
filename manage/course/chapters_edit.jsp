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
        out.print("<script>alert('æ²¡æå¯¹åºçæé');</script>");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    int id = ru.getInt("id");
    if (action.equals("save")) {//
    	Chapter chapter=new Chapter();
    	out.print(chapter.editChapter(request, user_id, user_name));
    	return; 
    }
	String name="",content="";
	int course_id=0,order_num=0;
    if (id > 0) {
        Doc doc = utildb.Get_Doc("name,content,course_id,order_num", "bs_chapter", " where id=? and isdel=0", "mysqlss", new Object[]{id});
        if (doc == null) {
            out.print("信息不存在");
            return;
        } else {
        	name=doc.get("name");
        	content=doc.get("content");
        	course_id=doc.getIn("course_id");
        	order_num=doc.getIn("order_num");
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
            var content = escape(escape(editor.getContent()));
            if (content == "") {
                content = "<p></p>";
            }
            String.prototype.replaceAll = function (s1, s2) {
                return this.replace(new RegExp(s1, "gm"), s2);
            };
            content = content.replaceAll("&", "^…");
            $.ajax({
                dataType: "json",
                type: "post",
                url: "chapter_edit.jsp",
                data: $("#form1").serialize()+"&desc="+content,
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
                <li>章节名称<input type="text" value="<%=name%>" name="chapter_name"/></li>
               	<li>
               	所属课程：
               		<select name="course_id">
               			<option value="0">--所属课程--</option>
               			<%
               				List<Doc> courseList=utildb.Get_List("id,name","bs_course"," where isdel=0","mysqlss");
               				if(courseList!=null){
               					for(Doc doc:courseList){
               						out.print("<option value=\""+doc.getIn("id")+"\" "+(course_id==doc.getIn("id")?"selected=\"selected\"":"")+">"+(doc.get("name"))+"</option>");
               					}
               				}
               			%>
               		</select>
               	</li>
               		<li>
           		排序：
           		<input type="text" name="order_num" value="<%=order_num%>" style="width:50px;"/>
           		</li>
            </ul>
            <ul class="row1 clearfix">
                <li>
                    <script type="text/plain" id="contents" name="contents" class="ckeditor">
                        <%=content%>
                    </script>
                    <script type="text/javascript">var editor = new baidu.editor.ui.Editor(edit_options);
                    editor.render("contents");
                    </script>
                </li>
            </ul>
            <div class="row_btn">
                <button type="button" id="tjbutton" onclick="usersave()">确认提交</button>
                <span id="tisspan"></span>
            </div>
        </form>
    </div>

</div>
<!--End Sidebar--> </body>
</html>