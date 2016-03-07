<%@page import="com.battsister.util.BasicType"%>
<%@page import="java.net.URLDecoder" %>
<%@page import="java.net.URLEncoder" %>
<%@page import="net.sf.json.JSONObject" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.baje.sz.util.*" %>
<%@ page import="com.battsister.admin.sys.*" %>
<%@page import="com.baje.sz.ajax.AjaxXml" %>
<%@ include file="../ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    if (current_flags.indexOf(",6003,") < 0) {
        response.sendRedirect("../error.jsp?left=xitong");
        return;
    }

    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    if (action.equals("del")) {
        out.print(BasicType.delBasic(request,user_id, user_name, "bs_sys_feedback","API--删除用户反馈"));
        return;
    }
    if (action.equals("batchDel")) {
        out.print(BasicType.batchDelBasic(request, user_id, user_name, "bs_sys_feedback", "API--批量删除用户反馈"));
        return;
    }
    int feedback_type=ru.getInt("feedback_type");
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>table</title>
    <link href="../css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="../css/base.css" rel="stylesheet" type="text/css"/>
    <link href="../css/page.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src='../js/qmango.js'></script>
    <script type="text/javascript" src="../js/artDialog4.1.6/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="../js/artDialog4.1.6/plugins/iframeTools.source.js"></script>
    <script type="text/javascript" src='/manage/js/webcalendar.js'></script>
    <script type="text/javascript">
        function batchDel() {
            var id = getcheckbox("id");
            if (id == "") {
                art.dialog.alert('请选择操作项');
                return false;
            }
            var dialog = art.dialog({
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
                                url: "userfeedback.jsp",
                                data: "action=batchDel&ids=" + id + "",
                                success: function (msg) {
                                    art.dialog({id: 'tisID'}).close();
                                    if (msg.type) {
                                        art.dialog({
                                            id: 'tisID',
                                            content: msg.msg,
                                            lock: true,
                                            icon: "succeed",
                                            cancelVal: '确定',
                                            cancel: function () {
                                                window.location.reload();
                                                art.dialog({
                                                    id: "tisID"
                                                }).close();
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
            dialog.shake && dialog.shake();// 调用抖动接口
        }

        function del(id) {
            if (id == "") {
                art.dialog.alert('请选择操作项');
                return false;
            }
            var dialog = art.dialog({
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
                                url: "userfeedback.jsp",
                                data: "action=del&id=" + id + "",
                                success: function (msg) {
                                    art.dialog({id: 'tisID'}).close();
                                    if (msg.type) {
                                        art.dialog({
                                            id: 'tisID',
                                            content: msg.msg,
                                            lock: true,
                                            icon: "succeed",
                                            cancelVal: '确定',
                                            cancel: function () {
                                                window.location.reload();
                                                art.dialog({
                                                    id: "tisID"
                                                }).close();
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
            dialog.shake && dialog.shake();// 调用抖动接口
        }
    </script>
</head>
<body class="ifr">
<%@ include file="../left.jsp" %><!--End Sidebar-->
<div class="iframe_box">
    <div class="form_info"><strong>用户反馈</strong></div>
    <div class="form_cont mb10">
        <form id="form1" name="form1" method="get" action="">
            <ul class="row3">
                <li>反馈类型：
                    <select name="feedback_type">
                        <option value="0">--全部--</option>
                        <option value="1" <%= (feedback_type == 1 ? "selected=\"selected\"" : "") %>>老师反馈</option>
                        <option value="2" <%=(feedback_type == 2 ? "selected=\"selected\"" : "") %>>学生反馈</option>
                    </select>
                </li>
            </ul>
            <ul class="row3" style="margin-top: 3px;">
                <li class="btn_line">
                   <button type="button" class="btn_formA" onclick="$('#form1').submit()">确定搜索</button>
                </li>
            </ul>
        </form>
    </div>
    <div class="form_table">
        <form id="form2" name="form2" method="post" action="">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <th width="8%"></th>
                    <th width="10%">学生姓名</th>
                    <th width="10%">老师姓名</th>
                    <th width="40%">反馈内容</th>
                    <th width="20%">反馈时间</th>
                    <th width="">操作</th>
                </tr>
                <%
                    int pages = ru.getInt("page");
                    if (pages == 0) {
                        pages = 1;
                    }
                    int pn = 20;
                    StringBuffer wheres = new StringBuffer(" a.isdel=0 ");
                    if (feedback_type ==1) {
                        wheres.append(" and a.teacher_id>0 ");
                    }
                    if(feedback_type==2){
                    	 wheres.append(" and a.student_id>0 ");
                    }
                    String table = "bs_sys_feedback a left join bs_teachers b on a.teacher_id=b.id left join bs_students c on a.student_id=c.id";
                    String file = "a.id,b.name as 'teacher_name',c.name as 'student_name',a.content,a.add_time";
                    int counts = utildb.Get_count("a.id", table, wheres.toString(), "mysqlss");
                    List list = utildb.Get_mssqlList(pages, pn, counts, table, wheres.toString(), file, "order by a.add_time", "a.id", "mysqlss", new ArrayList());
                    if (list != null) {
                        for (Iterator its = list.listIterator(); its.hasNext(); ) {
                            Doc doc = (Doc) its.next();
                            if (doc != null) {

                %>
                <tr onmousemove="tableMove(this);" onmouseout="tableOut(this)">
                    <td><input name="id" type="checkbox" id="id" value="<%=doc.get("id")%>"/></td>
                      <td><%=doc.get("teacher_name")!=null&&!"".equals(doc.get("teacher_name"))?doc.get("teacher_name"):"--"%>
                    </td>
                      <td><%=doc.get("student_name")!=null&&!"".equals(doc.get("student_name"))?doc.get("student_name"):"--"%>
                    </td> 
                    <td><%=doc.get("content")%>
                    </td>
                    <td><%=AjaxXml.timeStamp2Date(doc.getIn("add_time"), "YY04-MM-DD HH:MI:SS")%>
                    </td>
                    <td><a href="javascript:del('<%=doc.get("id")%>')">删除</a></td>
                </tr>
                <%
                            }
                        }
                    }
                %>
                <tr>
                    <td colspan="2">
                        <input type="checkbox" name="chkall" id="chkall" value="checkbox"
                               onclick="CheckAll(this.form)"/> 选中/取消所有

                        <input name="tjczft " type="button" onclick="batchDel()" value="批量删除"/>

                    </td>

                    <td colspan="5"
                        style="text-align:right"><%out.print(AjaxXml.getPage(pages, 10, pn, counts, "", "", "", request));%></td>
                </tr>
            </table>
        </form>
    </div>
</div><!--r_iframe END-->
</body>
</html>