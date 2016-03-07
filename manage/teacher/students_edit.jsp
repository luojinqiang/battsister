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
    	Student student=new Student();
    	out.print(student.editStudent(request, user_id, user_name));
    	return; 
    }
	String name="",username="",headpic="",account_status="";
	int sex=0,birth=0,school_id=0,teacher_id=0;
    if (id > 0) {
        Doc doc = utildb.Get_Doc("name,username,headpic,sex,birth,account_status,school_id,teacher_id", "bs_students", " where id=? and isdel=0", "mysqlss", new Object[]{id});
        if (doc == null) {
            out.print("信息不存在");
            return;
        } else {
        	name=doc.get("name");
        	username=doc.get("username");
        	headpic=doc.get("headpic");
        	sex=doc.getIn("sex");
        	birth=doc.getIn("birth");
        	account_status=doc.get("account_status");
        	school_id=doc.getIn("school_id");
        	teacher_id=doc.getIn("teacher_id");
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
                url: "students_edit.jsp",
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
        
        function getTeachers(object) {
            var school_id = $(object).val();
           /*  if (school_id == 0 || school_id == undefined) {
                return false;
            } else { */
                $.ajax({
                    dataType: "json",
                    type: "post",
                    url: "/manage/ajax/sysajax.jsp",
                    data: "action=getTeachers&school_id= " + school_id + " ",
                    success: function (backJson) {
                        if (backJson.type) {
                            var teachers = backJson.dataJson;
                            $("#teacher_id").empty();
                            $("#teacher_id").append("<option value=\"0\">--请选择老师--</option>");
                            var option = '';
                            for (var i = 0; i < teachers.length; i++) {
                               /*  if (teacher_id == teachers[i].id) {
                                    option = $("<option value=" + teachers[i].id + " selected>" + teachers[i].teacher_name + "</option>");
                                } else { */
                                    option = $("<option value=" + teachers[i].id + ">" + teachers[i].teacher_name + "</option>");
                              /*   } */
                                $("#teacher_id").append(option);
                            }
                        }
                    }
                });
           /*  } */
        }
    </script>
</head>

<body class="ifr">
<div id="dd" style="padding:5px;">
    <div class="box_input">
        <form id="form1" name="form1" method="post" action="">
            <input name="id" id="id" type="hidden" value="<%=id%>"/>
            <input name="action" id="action" type="hidden" value="save"/>

            <ul class="row2 clearfix">
                <li>登录帐号：<input type="text" name="username" value="<%=username%>" />（字母或数字）</li>
                <li>学生名称：<input type="text" value="<%=name%>" name="name"/></li>
            </ul>
            <ul class="row3 clearfix">
             <li>账号状态：
                	<select name="account_status">
                		<option value="Y" <%="Y".equals(account_status)?"selected=\"selected\"":""%>>--正常--</option>
                		<option value="N" <%="N".equals(account_status)?"selected=\"selected\"":""%>>--锁定--</option>
                	</select>
                </li>
                <li>性别：
                    <select name="sex">
                        <option value="0" <%
                            if (sex == 0) {
                                out.print("selected=\"selected\"");
                            }
                        %>>未设置
                        </option>
                        <option value="1" <%
                            if (sex == 1) {
                                out.print("selected=\"selected\"");
                            }
                        %>>男
                        </option>
                        <option value="2" <%
                            if (sex == 2) {
                                out.print("selected=\"selected\"");
                            }
                        %>>女
                        </option>
                    </select>
                </li>
                 <li>生日：<input name="birth" type="text"
                              value="<%if(birth>0){out.print(AjaxXml.timeStamp2Date(birth, "YY04-MM-DD HH:MI:SS"));} %>"
                              style="width:65px;" onclick="SelectDate(this,'yyyy-MM-dd',0,0)"/></li>
            </ul>
            <ul class="row2 clearfix">
            	 <li>所属学校：
            		<select name="school_id" onchange="getTeachers(this)">
            			<option value="0">--请选择所属学校--</option>
            			<%
            				List<Doc> school_list=utildb.Get_List("id,name","bs_schools"," where isdel=0","mysqlss");
            				if(school_list!=null){
            					for(Doc doc:school_list){
            						out.print("<option value=\""+doc.getIn("id")+"\""+(school_id==doc.getIn("id")?"selected=\"selected\"":"")+">"+doc.getString("name")+"</option>");
            					}
            				}
            			%>
            		</select>
            	</li>
            	<li>
            		所属老师：
            		<select name="teacher_id" id="teacher_id">
            			<option value="0">--请选择老师--</option>
            			<%
            				if(school_id>0){
            					List<Doc> teacher_list=utildb.Get_List("id,name","bs_teachers"," where isdel=0 and school_id=? ","mysqlss",new Object[]{school_id});
            					if(teacher_list!=null){
            						for(Doc doc:teacher_list){
            							out.print("<option value=\""+doc.getIn("id")+"\" "+(teacher_id==doc.getIn("id")?"selected=\"selected\"":"")+">"+doc.get("name")+"</option>");
            						}
            					}
            				}
            			%>
            		</select>
            	</li>
            </ul>
            <ul class="row1 clearfix">
                <li>头像图：
							<span class="input"> <span class="upload_file">
									<div>
                                        <div class="up_input">
                                            <input name="FileUpload" id="smallfileUpload1" type="file"/>
                                        </div>
                                        <div class="tips">
                                            图片尺寸建议：600*230px
                                        </div>
                                        <div class="clear"></div>
                                        <input type="hidden" name="headpic"
                                               value="<%=headpic%>"/>
                                    </div>
									<div class="img" id="smallfileDetail1" style="width: 100px;"></div>
							</span> </span>
                </li>
            </ul>
              <ul class="row3 clearfix">
                <li>密 码：<input name="password" type="password" id="password" size="15"/></li>
                <li>确认密码：<input name="password1" type="password" id="password1" size="15"/></li>
                <li>编辑时不输入则不更改密码</li>
            </ul>
            <script type="text/javascript">
                if ($('#smallfileUpload1').size()) {
                    global_obj.file_upload($('#smallfileUpload1'),
                            $('#form1 input[name=headpic]'), $('#smallfileDetail1'),
                            'web_column');
                    $('#smallfileDetail1').html(
                            global_obj.img_link($('#form1 input[name=headpic]').val()));
                    if ($('#form1 input[name=headpic]').val() != '') {
                        $('#smallfileDetail1').append('<div class="del">删除</div>');
                    }
                    $('#smallfileDetail1 div').click(function () {
                        $('#form1 input[name=headpic]').val('');
                        $(this).parent().html('');
                    });
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