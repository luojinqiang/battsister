<%@page import="com.baje.sz.ajax.AjaxXml" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.baje.sz.util.Doc" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.hanyou.admin.sys.Logdb" %>
<%@ page import="com.hanyou.util.SetupUtil" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ include file="../ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    if (current_flags.indexOf(",6001,") < 0) {
        response.sendRedirect("../error.jsp?left=xitong");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    if (action.equals("del")) {
        Logdb ldb = new Logdb();
        out.print(ldb.Dellog(request, user_name, user_id, gym_group_id, gym_id));
        return;
    }
    if (action.equals("export")) {
        Logdb ldb = new Logdb();
        out.print(ldb.export2xls(request, response, user_id, user_name));
        return;
    }

    int log_type = ru.getInt("log_type");
//String log_title=ru.getString("log_title");
    String mobile_version = ru.getString("mobile_version");
    String mobile_market = ru.getString("mobile_market");
    String get_user_name = ru.getString("get_user_name");
    String start_time = ru.getString("start_time");
    String end_time = ru.getString("end_time");
    int user_distinct = ru.getInt("user_distinct");
    String log_title = ru.getString("log_title");
//String log_title = new String(ru.getString("log_title").getBytes("ISO-8859-1"), "UTF-8");
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>table</title>
    <link href="../css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="../css/base.css" rel="stylesheet" type="text/css"/>
    <link href="../css/page.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script language=javascript src='../js/qmango.js'></script>
    <script type="text/javascript" src="../js/artDialog4.1.6/artDialog.js?skin=blue"></script>
    <script type="text/javascript" src="../js/artDialog4.1.6/plugins/iframeTools.source.js"></script>
    <script language=javascript src='/manage/js/webcalendar.js'></script>
    <script type="text/javascript">

        function export2xls(log_title, mobile_market, mobile_version, get_user_name, start_time, end_time, user_distinct) {
            document.execCommand('SaveAs');
            var dialog = art.dialog({
                id: 'exportID',
                content: '是否确定要将信息导出为Excel表？',
                lock: true,
                button: [
                    {
                        name: '确定',
                        callback: function () {
                            var url = "rizhi.jsp?action=export&log_title=" + log_title + "&mobile_market=" + mobile_market + "&mobile_version=" + mobile_version + "&get_user_name=" + get_user_name + "&start_time=" + start_time + "&end_time=" + end_time + "&user_distinct=" + user_distinct;

                            location.href = url;

                            art.dialog({id: 'exportID'}).close();

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
                                type: "post",
                                url: "rizhi.jsp",
                                data: "action=del&ids=" + id + "",
                                success: function (msg) {
                                    art.dialog({id: 'tisID'}).close();
                                    var backarr = $.trim(msg).split("$$");
                                    if (backarr[1] == "ok") {
                                        art.dialog({
                                            id: 'tisID',
                                            content: backarr[0],
                                            lock: true,
                                            icon: "succeed",
                                            cancelVal: '确定',
                                            cancel: function () {
                                                window.location.reload();
                                                art.dialog({id: "tisID"}).close();
                                            }
                                        });
                                    } else {
                                        art.dialog.alert(backarr[0]);
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
    <div class="form_info"><strong>日志管理</strong></div>
    <div class="form_cont mb10">
        <form id="form1" name="form1" method="get" action="">
            <input type="hidden" id="log_type" name="log_type" value="<%=log_type %>" style="width: 120px;"/>
            <ul class="row2">
                <li>说明：<input type="text" id="log_title" name="log_title" value="<%=log_title %>"
                              style="width: 120px;"/></li>
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
                    <th width="3%"></th>
                    <th width="10%">用户ID</th>
                    <th width="10%">用户名</th>
                    <th width="15%">说明</th>
                    <th width="25%">时间</th>
                    <th width="18%">登陆IP</th>
                    <th>备注</th>
                </tr>

                <%
                    String wheres = " isdel=0 and log_type=?";
                    List sqllist = new ArrayList();
                    sqllist.add(log_type);
                    if (!log_title.equals("")) {
                        wheres = wheres + " and log_title like ?";
                        sqllist.add("%" + log_title + "%");
                    }
                    if (!mobile_market.equals("")) {
                        wheres = wheres + " and log_remark like ?";
                        sqllist.add(mobile_market + "---%");
                    }
                    if (!mobile_version.equals("")) {
                        wheres = wheres + " and log_remark like ?";
                        sqllist.add("%---" + mobile_version);
                    }
                    if (!get_user_name.equals("")) {
                        wheres = wheres + " and user_name like ?";
                        sqllist.add("%" + get_user_name + "%");
                    }
                    if (!start_time.equals("")) {
                        wheres = wheres + " and create_time>=?";
                        sqllist.add(SetupUtil.getTimestamp(start_time));
                    }
                    if (!end_time.equals("")) {
                        wheres = wheres + " and create_time<=?";
                        sqllist.add(SetupUtil.getTimestamp(end_time));
                    }
                    if (user_distinct == 1) {
                        wheres = wheres + " and id in ( select max(id) from hy_sys_log group by user_id )";
                    }
                    int pages = ru.getInt("page");
                    int pn = 20;
                    String table = "hy_sys_log";
                    String file = "*";
                    String order = " order by id desc";
                    String idd = "id";
                    String beizhu = "";
                    int counts = utildb.Get_count(idd, table, wheres, "", sqllist);
                    List list = utildb.Get_mssqlList(pages, pn, counts, table, wheres, file, order, idd, "", sqllist);
                    if (list != null) {
                        for (Iterator its = list.listIterator(); its.hasNext(); ) {
                            Doc doc = (Doc) its.next();
                            beizhu = doc.get("log_remark");
                            if (beizhu.length() > 100) {
                                beizhu = beizhu.substring(0, 100);
                            }

                %>
                <tr onmousemove="tableMove(this);" onmouseout="tableOut(this)">
                    <td><input name="id" type="checkbox" id="id" value="<%=doc.get("id")%>"/></td>
                    <td><%=doc.get("user_id") %>
                    </td>
                    <td><%=doc.get("user_name") %>
                    </td>
                    <td><%=doc.get("log_title") %>
                    </td>
                    <td><%=SetupUtil.timestamp2Date(doc.get("create_time"), "YY04-MM-DD HH:MI:SS") %>
                    </td>
                    <td><%=doc.get("create_ip") %>
                    </td>
                    <td><%=beizhu %>
                    </td>
                </tr>

                <%
                        }
                    }
                %>
                <tr>
                    <td colspan="7" style="text-align: right">
                        <input type="checkbox" name="chkall" id="chkall" value="checkbox"
                               onclick="CheckAll(this.form);"/>
                        选中/取消所有
                        <input name="tjczft " type="button" onclick="del()" value="删除"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="7"
                        style="text-align:right"><%out.print(AjaxXml.getPage(pages, 10, pn, counts, "", "", "", request));%></td>
                </tr>
            </table>
        </form>
    </div>
</div><!--r_iframe END-->

</body>
</html>