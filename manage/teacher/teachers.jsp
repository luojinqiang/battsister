<%@page import="com.hanyou.util.BasicType"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.baje.sz.ajax.*" %>
<%@ page import="com.baje.sz.util.*" %>
<%@ include file="../ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    request.setCharacterEncoding("utf-8");
    if (current_flags.indexOf(",1001,") < 0) {
        response.sendRedirect("../error.jsp?left=yonghu");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    if (action.equals("del")) {
        out.print(BasicType.delBasic(request, user_id, user_name,"bs_teachers","API--删除用户"));
        return;
    }
    if (action.equals("batchdel")) {
        out.print(BasicType.batchDelBasic(request, user_id, user_name,"bs_teachers","API--批量删除用户"));
        return;
    }
    int pages = ru.getInt("page");
    if (pages == 0) {
        pages = 1;
    }
    int pn = ru.getInt("pn");
    if (pn == 0) {
        pn = 20;
    }
    String teacher_name = ru.getString("teacher_name", "");
    String teacher_username = ru.getString("teacher_username", "");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>table</title>
    <link href="../css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="../css/base.css" rel="stylesheet" type="text/css"/>
    <link href="../css/page.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="../js/artDialog4.1.6/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="../js/artDialog4.1.6/plugins/iframeTools.source.js"></script>
    <script language="javascript" src='../js/sys.js'></script>
    <script language="javascript" src='/manage/js/webcalendar.js'></script>
    <script type="text/javascript">
        function del(id) {
            art.dialog({
                id: 'delID',
                content: '是否确定删除选中项？',
                lock: true,
                button: [
                    {
                        name: '确定',
                        callback: function () {
                            if (id == "") {
                                art.dialog({id: 'delID'}).close();
                                art.dialog.alert('请选择操作项');
                                return false;
                            }
                            $.ajax({
                                beforeSend: function () {
                                    art.dialog({id: 'delID'}).close();
                                    art.dialog({
                                        id: 'tisID',
                                        lock: true,
                                        title: '提交中，请稍候……'
                                    });
                                },
                                dataType: "json",
                                type: "post",
                                url: "teachers.jsp",
                                data: "action=del&id=" + id + "",
                                success: function (msg) {
                                    art.dialog({id: 'tisID'}).close();
                                    if (msg.type == true) {
                                        art.dialog({
                                            id: 'tisID',
                                            content: msg.msg,
                                            lock: true,
                                            icon: "succeed",
                                            cancelVal: '确定',
                                            cancel: function () {
                                                window.location.reload();
                                                art.dialog({id: "tisID"}).close();
                                            }
                                        });
                                    } else {
                                        art.dialog.alert(msg.msg);
                                    }
                                }
                            });
                            return false;
                        },
                        focus: true
                    },
                    {
                        name: '取消'
                    }
                ]
            });
        }
        function batchdel(id) {
            var ids = getcheckbox("id");
            if (ids == "") {
                alert("请选择删除项？");
                return;
            }
            art.dialog({
                id: 'delID',
                content: '是否确定删除选中项？',
                lock: true,
                button: [
                    {
                        name: '确定',
                        callback: function () {
                            $.ajax({
                                beforeSend: function () {
                                    art.dialog({id: 'delID'}).close();
                                    art.dialog({
                                        id: 'tisID',
                                        lock: true,
                                        title: '提交中，请稍候……'
                                    });
                                },
                                dataType: "json",
                                type: "post",
                                url: "teachers.jsp",
                                data: "action=batchdel&ids=" + ids + "",
                                success: function (msg) {
                                    art.dialog({id: 'tisID'}).close();
                                    if (msg.type == true) {
                                        art.dialog({
                                            id: 'tisID',
                                            content: msg.msg,
                                            lock: true,
                                            icon: "succeed",
                                            cancelVal: '确定',
                                            cancel: function () {
                                                window.location.reload();
                                                art.dialog({id: "tisID"}).close();
                                            }
                                        });
                                    } else {
                                        art.dialog.alert(msg.msg);
                                    }
                                }
                            });
                            return false;
                        },
                        focus: true
                    },
                    {
                        name: '取消'
                    }
                ]
            });
        }
        function editTeacher(id, title) {
            openurl('teachers_edit.jsp?id=' + id + '', 'user', title, 700, 380, 0, 10, true);
        }
    </script>
</head>
<body class="ifr">
<%@ include file="../left.jsp" %><!--End Sidebar-->
<div class="iframe_box">
    <div class="form_info"><strong>教师列表</strong></div>
    <div class="form_cont mb10">
        <form id="form1" name="form1" method="get" action="">
            <ul class="row3">
                <li>教师姓名：<input name="teacher_name" type="text" value="<%=teacher_name%>" style="width:100px;"/>
                </li>
                <li>教师账号：<input name="teacher_username" type="text" id="teacher_username" value="<%=teacher_username%>"
                                style="width:100px;"/></li>
            </ul>
            <ul class="row3" style="margin-top:3px;">
                <li class="btn_line" style="margin-top:3px;">
                    <button type="button" class="btn_formA" onclick="$('#form1').submit()">查&nbsp;&nbsp;询</button>
                </li>
            </ul>

        </form>
    </div>
    <div class="btnitem mb10 clearfix">
        <ul class="s_btn">
            <li><a href="javascript:editTeacher(0,'新增教师')">新增教师</a></li>
        </ul>
    </div>
    <div class="form_table">
        <form id="form2" name="form2" method="post" action="" autocomplete="off">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <th width="4%">&nbsp;</th>
                    <th width="8%">登录帐号</th>
                    <th width="8%">姓名</th>
                    <th width="12%">所属学校</th>
                    <th width="6%">账号状态</th>
                    <th width="4%">性别</th>
                    <th width="6%">头像</th>
                    <th width="12%">添加时间</th>
                   	<th width="12%">最后登录时间</th>
                   	<th width="5%">登录次数</th>
                    <th width="7%">操作</th>
                </tr>
                <%

                    String table = "bs_teachers a left join bs_schools b on a.school_id=b.id ";
                    String wheres = "a.isdel=0 ";
                    List sqllist = new ArrayList();
                    if (!"".equals(teacher_name)) {
                        wheres = wheres + " and a.name like ?";
                        sqllist.add("%" + teacher_name+ "%");
                    }
                    if (!teacher_username.equals("")) {
                        wheres = wheres + " and a.username like ?";
                        sqllist.add("%" + teacher_username + "%");
                    }
                    String file = "a.id,a.name,a.username,a.headpic,a.sex,a.last_login_time,a.addtime,"+
                    "a.last_login_ip,a.login_times,a.account_status,a.addtime,a.school_id,b.name as 'school_name'";
                    String order = " order by a.id desc";
                    String idd = "a.id";
                    int counts = utildb.Get_count(idd, table, wheres, "mysqlss", sqllist);
                    List list = utildb.Get_List(pages, pn, counts, table, wheres, file, order, "mysqlss", sqllist);
                    if (list != null) {
                        for (Iterator its = list.listIterator(); its.hasNext(); ) {
                            Doc doc = (Doc) its.next();
                %>
                <tr onmousemove="tableMove(this);" onmouseout="tableOut(this)">
                    <td><input name="id" type="checkbox" id="id" value="<%=doc.get("id")%>"/></td>
                    <td><%=doc.get("username", "")%>
                    </td>
                    <td><%=doc.get("name", "")%>
                    </td>
                      <td><%=doc.get("school_name", "") %>
                    </td>
                    <td><%="Y".equals(doc.get("account_status"))?"正常":"锁定"%></td>
                    <td><%
                    	if(doc.getIn("sex")==1){
                    		out.print("男");
                    	}else if(doc.getIn("sex")==2){
                    		out.print("女");
                    	}else{
                    		out.print("--");
                    	}
                    %>
                    </td>
                   <td><%=(doc.get("headpic") != null && !doc.get("headpic").equals("")) ? "<img src=\"" + doc.get("headpic") + "\" width=\"30\">" : "" %>
                    </td>
                     <td><%
                        if (doc.getIn("addtime") > 0) {
                            out.print(AjaxXml.timeStamp2Date(doc.getIn("addtime"), "YY04-MM-DD HH:MI:SS"));
                        }
                    %></td>
                    <td><%
                        if (doc.getIn("last_login_time") > 0) {
                            out.print(AjaxXml.timeStamp2Date(doc.getIn("last_login_time"), "YY04-MM-DD HH:MI:SS"));
                        }
                    %></td>
                     <td><%=doc.getIn("login_times")%></td>
                    <td><a href="javascript:editTeacher('<%=doc.get("id")%>','编辑教师')">编辑</a> <a
                            href="javascript:del('<%=doc.get("id")%>')">删除</a></td>
                </tr>

                <%
                        }
                    }
                %>
                <tr>
                    <td colspan="2" style="text-align:center"><input type="checkbox" name="chkall" id="chkall"
                                                                     value="checkbox" onclick="CheckAll(this.form);"/>
                        选中/取消所有
                    </td>
                    <td colspan="9" style="text-align:right"><input name="tjczft" type="button" onclick="batchdel()"
                                                                    value="批量删除"/><%out.print(AjaxXml.getPage(pages, 10, pn, counts, "", "", "", request));%>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div><!--r_iframe END-->

<%@ include file="../end.jsp" %><!--End Sidebar--></body>
</html>