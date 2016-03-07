<%@page import="com.baje.sz.ajax.AjaxXml" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.baje.sz.util.*" %>
<%@ page import="com.battsister.admin.sys.*" %>
<%@ page import="com.battsister.util.*" %>
<%@ include file="../ini_sys.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    RequestUtil ru = new RequestUtil(request);
    if (current_flags.indexOf(",6002,") < 0) {
        response.sendRedirect("../error.jsp?left=xitong");
        return;
    }
    Keyword kw = new Keyword();
    String action = ru.getString("action");
    if (action.equals("del")) {
    	   out.print(BasicType.delBasic(request, user_id, user_name,"bs_sys_keyword","API--删除关键字"));
           return;  
        }
    if (action.equals("batchDel")) {
      	 out.print(BasicType.batchDelBasic(request, user_id, user_name,"bs_sys_keyword","API--批量删除后台日志"));
           return;
      }
    String keyword = ru.getString("keyword");
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
    <script type="text/javascript" src='../js/sys.js'></script>
    <script type="text/javascript" src="../js/artDialog4.1.6/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="../js/artDialog4.1.6/plugins/iframeTools.source.js"></script>
    <script type="text/javascript" src='../js/webcalendar.js'></script>
    <script type="text/javascript">
        function edit(id, str) {
            openurl('keyword_edit.jsp?id=' + id + '', 'xitong', str, 700, 380, 0, 10, true);
        }
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
                                url: "keyword.jsp",
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
        function batchDel() {
            var id = getcheckbox("id");
            if (id == "") {
                alert("请选择删除项？");
                return;
            }
            var dialog = art.dialog({
                id: 'delID',
                content: '是否确定删除选中项？',
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
                                url: "keyword.jsp",
                                data: "action=batchDel&id=" + id + "",
                                success: function (msg) {
                                    art.dialog({id: 'tisID'}).close();
                                    if (msg.type) {
                                        art.dialog({
                                            id: 'tisID',
                                            content:msg.msg,
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
    </script>
</head>

<body class="ifr">
<%@ include file="../left.jsp" %><!--End Sidebar-->
<div class="iframe_box">
    <div class="form_info"><strong>关键字管理</strong></div>
    <div class="form_cont mb10">
        <form id="form1" name="form1" method="post" action="">
            <ul class="row3">

                <li>关键字：<input name="keyword" type="text" id="keyword" value="<%=keyword%>" style="width:100px;"/></li>
                <li class="btn_line">
                    <button type="button" class="btn_formA" onclick="$('#form1').submit()">查&nbsp;&nbsp;询</button>
                </li>
            </ul>

        </form>
    </div>
    <div class="btnitem mb10 clearfix">
        <ul class="s_btn">
            <li><a href="javascript:edit(0,'新增关键字')">新增关键字</a></li>
        </ul>
    </div>
    <div class="form_table">
        <form id="form2" name="form2" method="get" action="">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <th width="5%"></th>
                    <th width="45%">关键字</th>
                    <th width="10%">类型</th>
                    <th width="20%">创建时间</th>
                    <th width="20%">操作</th>
                </tr>
                <%
                    String wheres = " isdel=0";
                    List sqllist = new ArrayList();
                    if (!keyword.equals("")) {
                        wheres = wheres + " and keyword like ?";
                        sqllist.add("%" + keyword + "%");
                    }
                    int pages = ru.getInt("page");
                    int pn = 20;
                    String table = "bs_sys_keyword";
                    String file = "id,keyword,replace_word,key_type,add_time";
                    String order = " order by id desc";
                    String idd = "id";
                    String beizhu = "";
                    int counts = utildb.Get_count(idd, table, wheres, "", sqllist);
                    List list = utildb.Get_mssqlList(pages, pn, counts, table, wheres, file, order, idd, "", sqllist);
                    if (list != null) {
                        for (Iterator its = list.listIterator(); its.hasNext(); ) {
                            Doc doc = (Doc) its.next();

                %>
                <tr onmousemove="tableMove(this);" onmouseout="tableOut(this)">
                    <td><input type="checkbox" name="id" id="id" value="<%=doc.get("id")%>"/></td>
                    <td><%=doc.get("keyword")%>
                    </td>
                    <td><%=BasicType.getKeywordType(doc.getIn("key_type"))%>
                    </td>
                    <td><%=SetupUtil.timestamp2Date(doc.get("add_time"), "YY04-MM-DD HH:MI:SS") %>
                    </td>
                    <td>
                        <a href="javascript:edit(<%=doc.get("id")%>,'<%=doc.get("keyword") %>')">编辑</a>
                        <a href="javascript:del(<%=doc.get("id")%>)">删除</a>
                    </td>
                </tr>

                <%
                        }
                    }
                %>

                <tr>
                    <td colspan="5"
                        style="text-align:right"><%out.print(AjaxXml.getPage(pages, 10, pn, counts, "", "", "", request));%></td>
                </tr>
            </table>
        </form>
    </div>
</div><!--r_iframe END-->

</body>
</html>