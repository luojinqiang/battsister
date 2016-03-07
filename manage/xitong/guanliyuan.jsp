<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.baje.sz.util.*" %>
<%@ page import="com.battsister.admin.sys.*" %>
<%@ page import="com.battsister.util.*" %>
<%@page import="com.baje.sz.ajax.AjaxXml" %>
<%@ include file="../ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    if (current_flags.indexOf(",6006,") < 0) {
        response.sendRedirect("../error.jsp?left=xitong");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    if (action.equals("del")) {
        out.print(BasicType.delBasic(request, user_id, user_name,"bs_sys_user","API--删除后台管理员"));
        return;
    }

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
    <script type="text/javascript">

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
                                type: "post",
                                dataType:"json",
                                url: "guanliyuan.jsp",
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
            dialog.shake && dialog.shake();// 调用抖动接口
        }
        function addsysusert(id, title) {
            var action1 = 'editsave';
            if (id == 0) {
                action1 = 'addsave';
            }
            openurl('guanliyuan_edit.jsp?id=' + id + '&action1=' + action1 + '', 'shezhi', title, 700, 380, 0, 10, true);
        }
        function editPassword(id, title) {
            var action = 'editsave';
            openurl('password_edit.jsp?id=' + id + '&action=' + action + '', 'shezhi', title, 700, 380, 0, 10, true);
        }
    </script>
</head>

<body class="ifr">
<%@ include file="../left.jsp" %><!--End Sidebar-->
<div class="iframe_box">
    <div class="form_info"><strong>后台管理员</strong></div>
    <div class="btnitem mb10 clearfix">
        <ul class="s_btn">

            <li><a href="javascript:addsysusert(0,'新增后台管理员')">新增管理员</a></li>

        </ul>
    </div>
    <div class="form_table">
        <form id="form2" name="form2" method="post" action="">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <th width="15%">后台帐号</th>
                    <th width="8%">登陆错误</th>
                    <th width="15%">最近登陆IP</th>
                    <th width="15%">最近登陆时间</th>
                    <th width="10%">锁定状态</th>
                    <th width="10%">操作</th>
                </tr>

                <%
                    String wheres = " a.isdel=0 ";

                    int pages = ru.getInt("page");
                    int pn = 20;
                    String table = "bs_sys_user a  ";
                    String file = " a.id,a.username,a.flag,a.login_err,create_ip,a.create_time,a.last_login_ip,a.last_login_time,a.islock";
                    String order = " order by a.id desc";
                    String idd = "a.id";
                    String user_flag = "";
                    List listid = new ArrayList();
                    int counts = utildb.Get_count(idd, table, wheres, "", listid);
                    List list = utildb.Get_mssqlList(pages, pn, counts, table, wheres, file, order, idd, "", listid);
                    if (list != null) {
                        for (Iterator its = list.listIterator(); its.hasNext(); ) {
                            Doc doc = (Doc) its.next();
                            user_flag = doc.get("a.flag");
                            if (user_flag.length() > 30) {
                                user_flag = user_flag.substring(0, 30);
                            }


                %>
                <tr onmousemove="tableMove(this);" onmouseout="tableOut(this)">
                    <td><%=doc.get("username") %>
                    </td>
                    <td><%=doc.getIn("login_err") %>
                    </td>
                    <td><%=doc.get("last_login_ip") %>
                    </td>
                    <td><%=SetupUtil.timestamp2Date(doc.get("last_login_time"), "YY04-MM-DD HH:MI:SS") %>
                    </td>
                    <td><%=BasicType.getSysUserLock(doc.getIn("islock")) %>
                    </td>
                    <td>
                        <a href="javascript:addsysusert('<%=doc.get("id") %>','编辑后台管理员/修改权限')">修改权限/编辑</a>
                          <a href="javascript:del('<%=doc.get("id") %>')">删除</a>
                    </td>
                </tr>

                <%
                        }
                    }
                %>
                <tr>
                    <td colspan="6"
                        style="text-align:right"><%out.print(AjaxXml.getPage(pages, 10, pn, counts, "", "", "", request));%></td>
                </tr>
            </table>
        </form>
    </div>
</div><!--r_iframe END-->

</body>
</html>