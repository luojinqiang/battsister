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
	String course_flag="";
    Doc doc = utildb.Get_Doc("id,course_flag", "bs_teachers", " where id=? and isdel=0", "mysqlss", new Object[]{id});
    if (doc == null) {
        out.print("信息不存在");
        return;
    } else {
    	course_flag=doc.get("course_flag");
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
               <!-- 所有的课程、章节 -->
               <%
               	JSONArray course_flag_array=new JSONArray();
               	if(course_flag!=null&&!"".equals(course_flag)){
               		course_flag_array=JSONArray.fromObject(course_flag);
               		course_flag_array=course_flag_array==null?new JSONArray():course_flag_array;
               	}
               	List<Doc> courseList=utildb.Get_List("id,name", "bs_course", " where isdel=0","mysqlss");
               	if(courseList!=null){
               		for(int i=0;i<courseList.size();i++){
               			Doc courseDoc=courseList.get(i);
               			out.print("  <ul class=\"row1 clearfix\" style=\"margin-top:20px;\">");
               			out.print(courseDoc.get("name")+"：");
               			//该课程所有的章节
               			List<Doc> chapterList=utildb.Get_List("id,name", "bs_chapter", " where isdel=0 and course_id=? ","mysqlss",new Object[]{courseDoc.getIn("id")});
               			if(chapterList!=null){
               				for(Doc chapterDoc:chapterList){
               					String add_str="";
               					for(int n=0;n<course_flag_array.size();n++){
               						if(course_flag_array.optJSONObject(n).getInt("course_id")==courseDoc.getIn("id")){
               							JSONArray chapter_array=course_flag_array.optJSONObject(n).optJSONArray("chapters");
               							if(chapter_array!=null){
               								for(int s=0;s<chapter_array.size();s++){
               									if(chapter_array.optJSONObject(s).getInt("chapter_id")==chapterDoc.getIn("id")){
               										add_str="checked";
               									}
               								}
               							}
               						}
               					}
               					out.print("&nbsp; <input name=\"flag"+i+"\" type=\"checkbox\" value=\""+chapterDoc.getIn("id")+"\" "+add_str+"/>"+chapterDoc.get("name"));
               				}
               			}
               			out.print("&nbsp;&nbsp;&nbsp;&nbsp;<input name=\"selectAll_flag"+i+"\" type=\"checkbox\" id=\"selectAll_flag"+i+"\""+
                                "onchange=\"selectall('"+i+"')\"/><span style=\"color:green;\">全选</span>");
               			out.print("  </ul>");
               		}
               	}
               %>
            </ul>
            <div class="row_btn" style="margin-top:20px;">
                <button type="button" id="tjbutton" onclick="usersave()">确定提交</button>
                <span id="tisspan"></span>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" language="javascript">
    function selectall(num) {
        if ($("#selectAll_flag"+num).attr("checked")) {
            $("input[name='flag"+num+"']").each(function () {
                $(this).attr("checked", true);
            });
        } else {
            $("input[name='flag"+num+"']").each(function () {
                $(this).attr("checked", false);
            });
        }
    }
</script>
<!--End Sidebar--> </body>
</html>