<%@page import="com.hanyou.util.BasicType"%>
<%@page import="java.net.URLDecoder" %>
<%@page import="java.net.URLEncoder" %>
<%@page import="net.sf.json.JSONObject" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.baje.sz.util.*" %>
<%@ page import="com.hanyou.admin.sys.*" %>
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
        out.print(BasicType.delBasic(request,user_id, user_name, gym_group_id, gym_id, "hy_sys_feedback","API--删除用户反馈"));
        return;
    }
    if (action.equals("batchDel")) {
        out.print(BasicType.batchDelBasic(request, user_id, user_name, gym_group_id, gym_id, "hy_sys_feedback", "API--批量删除用户反馈"));
        return;
    }
    String mem_userid = ru.getString("mem_userid");
    String mem_name = ru.getString("mem_name");
    String feedBackTimeStart = ru.getString("startTime");
    String feedBackTimeEnd = ru.getString("endTime");
    int mobile_type = ru.getInt("mobile_type");
    int feedback_type = ru.getInt("feedback_type", -1);
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
                                url: "userFeedback.jsp",
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
                                url: "userFeedback.jsp",
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


        function validation() {
            var reg = new RegExp("^[0-9]*$");
            if ($("#mem_userid").attr("value") != "") {
                if (!reg.test($("#mem_userid").attr("value"))) {
                    alert("请输入合法账号");
                    return false;
                }
            }
            reg = /^(\d{4})-(\d{2})-(\d{2})$/

            if ($("#start").attr("value") != "" || $("#end").attr("value") != "") {
                if (!reg.test($("#start").attr("value")) || !reg.test($("#end").attr("value"))) {
                    alert("请输入合法日期");
                    return false;
                }
            }
            $('#form1').submit();
            return true;
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
                <li>用户id：<input name="mem_userid" type="text" id="mem_userid" value="<%=mem_userid%>"
                                style="width:100px;"/>
                </li>
                <li>
                    用户名：<input name="mem_name" type="text" id="mem_name" value="<%=mem_name%>" style="width:100px;"/>
                </li>

                <li>反馈类型：
                    <select name="feedback_type">
                        <option value="-1">--请选择反馈类型--</option>
                        <option value="0" <%= (feedback_type == 0 ? "selected" : "") %>>用户APP端</option>
                        <option value="1" <%=(feedback_type == 1 ? "selected" : "") %>>教练端</option>
                    </select>
                </li>
            </ul>
            <ul class="row3">
                <li>反馈时间：<input name="startTime" type="text"
                                id="start" value="<%=feedBackTimeStart%>"
                                style="width:100px;" onclick="SelectDate(this,'yyyy-MM-dd',0,0)"/>
                    - <input name="endTime" type="text" id="end"
                             value="<%=feedBackTimeEnd%>" style="width:100px;"
                             onclick="SelectDate(this,'yyyy-MM-dd',0,0)"/>
                </li>

                <li>手机类型：<select name="mobile_type">
                    <option value="0">--请选择手机类型--</option>
                    <option value="1" <%= (mobile_type == 1 ? "selected" : "") %>>安卓</option>
                    <option value="2" <%=(mobile_type == 2 ? "selected" : "") %>>IOS</option>
                </select>
                </li>
                <li class="btn_line">
                    <button type="button" class="btn_formA" onclick="return validation()">确定搜索</button>
                </li>
            </ul>
        </form>
    </div>

    <div class="form_table">
        <form id="form2" name="form2" method="post" action="">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <th width="8%"></th>
                    <th width="10%">用户ID</th>
                    <th width="7%">用户名</th>
                    <th width="7%">手机类型</th>
                    <th width="7%">反馈类型</th>
                    <th width="7%">版本号</th>
                    <th width="20%">反馈内容</th>
                    <th width="15%">反馈时间</th>
                    <th width="">操作</th>
                </tr>
                <%
                    int pages = ru.getInt("page");
                    if (pages == 0) {
                        pages = 1;
                    }
                    int pn = 20;

                    StringBuffer wheres = new StringBuffer(" a.isdel=0 ");

                    if (mem_userid != null && mem_userid != "") {
                        wheres.append(" and a.mem_userid like '%" + mem_userid + "%'");
                    }

                    if (mem_name != null && mem_name != "") {
                        wheres.append(" and b.mem_name like '%" + URLEncoder.encode(mem_name, "utf-8") + "%'");
                    }

                    if (feedBackTimeStart != null && feedBackTimeStart != "" && feedBackTimeEnd != null && feedBackTimeEnd != "") {
                        //wheres.append(" and a.create_time>='"+feedBackTimeStart+"' and a.create_time<="+feedBackTimeEnd+"");
                        wheres.append(" and a.create_time>=" + AjaxXml.getTimestamp(AjaxXml.Get_Date(feedBackTimeStart, "YY04-MM-DD 00:00:00")) +
                                "  and a.create_time<=" + AjaxXml.getTimestamp(AjaxXml.Get_Date(feedBackTimeEnd, "YY04-MM-DD 00:00:00")));
                    }

                    if (mobile_type == 1) {
                        wheres.append(" and a.mobile_type=1 ");
                    }
                    if (mobile_type == 2) {
                        wheres.append(" and a.mobile_type=2 ");
                    }
                    if (feedback_type == 0) {
                        wheres.append(" and a.feedback_type=0 ");
                    }
                    if (feedback_type == 1) {
                        wheres.append(" and a.feedback_type=1 ");
                    }
                    String table = "hy_sys_feedback a left join hy_member b on a.mem_userid=b.id";
                    String file = "a.id,a.mem_userid,b.mem_name,a.mobile_type,a.version,a.content,a.create_time,a.feedback_type";

                    int counts = utildb.Get_count("a.id", table, wheres.toString(), "mysqlss");
                    List list = utildb.Get_mssqlList(pages, pn, counts, table, wheres.toString(), file, "order by a.create_time", "a.id", "mysqlss", new ArrayList());
                    if (list != null) {
                        for (Iterator its = list.listIterator(); its.hasNext(); ) {
                            Doc doc = (Doc) its.next();
                            if (doc != null) {

                %>
                <tr onmousemove="tableMove(this);" onmouseout="tableOut(this)">
                    <td><input name="id" type="checkbox" id="id" value="<%=doc.get("id")%>"/></td>
                    <td><%=doc.get("mem_userid") %>
                    </td>
                    <td><%=URLDecoder.decode(doc.get("mem_name"), "utf-8") %>
                    </td>
                    <td>
                        <%
                            if (doc.getIn("mobile_type") == 1) {
                                out.print("安卓");
                            } else if (doc.getI("mobile_type") == 2) {
                                out.print("IOS");
                            }
                        %>
                    </td>
                    <td>
                        <%
                            if (doc.getIn("feedback_type") == 0) {
                                out.print("用户APP端");
                            } else if (doc.getI("feedback_type") == 1) {
                                out.print("教练端");
                            }
                        %>
                    </td>
                    <td><%=doc.get("version") %>
                    </td>
                    <td><%=doc.get("content") %>
                    </td>
                    <td><%=AjaxXml.timeStamp2Date(doc.getIn("create_time"), "YY04-MM-DD ")%>
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

                    <td colspan="7"
                        style="text-align:right"><%out.print(AjaxXml.getPage(pages, 10, pn, counts, "", "", "", request));%></td>
                </tr>
            </table>
        </form>
    </div>
</div><!--r_iframe END-->

</body>
</html>