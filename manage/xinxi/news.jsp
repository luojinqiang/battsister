<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.baje.sz.util.*" %>
<%@ page import="com.baje.sz.ajax.*" %>
<%@ page import="com.hanyou.admin.sys.News" %>
<%@ page import="com.hanyou.util.*" %>
<%@ include file="../ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    if (current_flags.indexOf(",4002,") < 0) {
        response.sendRedirect("../error.jsp?left=xinxi");
        return;
    }
    RequestUtil ru = new RequestUtil(request);

    int newsclass = ru.getInt("newsclass");
    String action = ru.getString("action");
    if (action.equals("del")) {
        News news = new News();
        out.print(news.delNews(request, userid, user_name, gym_group_id, gym_id).toString());
        return;
    }
    if (action.equals("batchDel")) {
        News news = new News();
        out.print(news.batchDelNews(request, userid, user_name, gym_group_id, gym_id).toString());
        return;
    }
    Doc newsdoc = new Doc();
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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


    <script language=javascript src='../js/sys.js'></script>
    <script language=javascript src='../js/webcalendar.js'></script>
    <script type="text/javascript">
        var menu1 = [
            {
                '刷新页面': function (menuItem, menu) {
                    window.location.reload();
                }
            }
        ];
        $(function () {
            //$(this).contextMenu(menu1,{theme:'vista'});
        });
        function edit(id) {
            //openurl('news_edit.jsp?id='+id+'','xitong','编辑新闻',700,380,0,50,true);
            window.parent.jianyi2('xinxi/news_edit.jsp?id=' + id + '', '编辑新闻');
        }
        artDialog.fn.shake = function () {
            var style = this.DOM.wrap[0].style,
                    p = [4, 8, 4, 0, -4, -8, -4, 0],
                    fx = function () {
                        style.marginLeft = p.shift() + 'px';
                        if (p.length <= 0) {
                            style.marginLeft = 0;
                            clearInterval(timerId);
                        }
                        ;
                    };
            p = p.concat(p.concat(p));
            timerId = setInterval(fx, 13);
            return this;
        };

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
                                url: "news.jsp",
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
                                type: "post",
                                url: "news.jsp",
                                data: "action=batchDel&id=" + id + "",
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
    <div class="form_info"><strong>新闻管理</strong></div>
    <div class="form_cont mb10">
        <form id="form1" name="form1" method="get" action="">

            <ul class="row2">
                <li>信息分类：<select name="newsclass" id="newsclass">
                    <option value="0" <%=(newsclass == 0) ? "selected=\"selected\"" : ""%>>选择栏目</option>
                    <%
                        List clist = utildb.Get_List("id,classname,parentid",
                                "hy_news_class",
                                "where idtype=0 and isdel=0 and parentid=0", "");
                        if (clist != null) {
                            for (Iterator its = clist.listIterator(); its.hasNext(); ) {
                                Doc docx = (Doc) its.next();
                                if (newsclass == docx.getIn("id")) {
                                    out.println("<option value=\"" + docx.get("id")
                                            + "\" selected>&nbsp;|└"
                                            + docx.get("classname") + "</option>");
                                } else {
                                    out.println("<option value=\"" + docx.get("id")
                                            + "\">├" + docx.get("classname") + "</option>");
                                }
                                newsdoc.put(docx.get("id"), docx.get("classname"));
                                List plist = utildb.Get_List("id,classname",
                                        "hy_news_class", "where isdel=0 and parentid="
                                                + docx.getIn("id") + "", "");
                                if (clist != null) {
                                    for (Iterator pits = plist.listIterator(); pits
                                            .hasNext(); ) {
                                        Doc docp = (Doc) pits.next();
                                        newsdoc.put(docp.get("id"), docp.get("classname"));
                                        if (newsclass == docp.getIn("id")) {
                                            out.println("<option value=\"" + docp.get("id")
                                                    + " selected=\"selected\"\">&nbsp;|└"
                                                    + docp.get("classname") + "</option>");
                                        } else {
                                            out.println("<option value=\"" + docp.get("id")
                                                    + "\">&nbsp;|└" + docp.get("classname")
                                                    + "</option>");
                                        }

                                    }
                                }
                            }
                        }
                    %>
                </select>
                </li>

                <li class="btn_line">
                    <button type="button" class="btn_formA" onclick="$('#form1').submit()">确定搜索</button>
                </li>

            </ul>
        </form>
    </div>
    <div class="btnitem mb10 clearfix">
        <ul class="s_btn">
            <li><a href="javascript:edit(0)">新增新闻</a></li>

        </ul>
    </div>
    <div class="form_table">
        <form id="form2" name="form2" method="post" action="">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <th width="5%"></th>
                    <th width="30%">标题</th>
                    <th width="11%">栏目</th>
                    <th width="8%">排序</th>
                    <th width="12%">添加时间</th>
                    <th width="15%">操作</th>
                </tr>

                <%
                    List sqllist = new ArrayList();
                    String wheres = " isdel=0 and newstype=1";
                    if (newsclass > 0) {
                        wheres = wheres + " and newsclass=?";
                        sqllist.add(new Integer(newsclass));
                    }
                    int pages = ru.getInt("page");
                    int pn = 25;
                    String table = "hy_news";
                    String file = "id,newstitle,bossname,newsclass,ordernum,classnavicontent,templet,savepath,htmlpage,addtime";
                    String order = " order by id desc";
                    String idd = "id";
                    int counts = utildb.Get_count(idd, table, wheres, "", sqllist);
                    List list = utildb.Get_mssqlList(pages, pn, counts, table, wheres,
                            file, order, idd, "", sqllist);
                    if (list != null) {
                        for (Iterator its = list.listIterator(); its.hasNext(); ) {
                            Doc doc = (Doc) its.next();
                %>
                <tr>
                    <td><input name="id" type="checkbox" id="id" value="<%=doc.get("id")%>"/></td>
                    <td><%=doc.get("newstitle")%>
                    </td>
                    <td><%=newsdoc.get(doc.get("newsclass"))%>
                    </td>
                    <td><%=doc.getIn("paixu")%>
                    </td>
                    <td><%=SetupUtil.timestamp2Date(doc.get("addtime"),
                            "YY04-MM-DD HH:MI:SS")%>
                    </td>
                    <td><a href="javascript:edit(<%=doc.get("id")%>)">编辑</a>
                        <a href="javascript:del(<%=doc.get("id")%>)">删除</a></td>
                </tr>

                <%
                        }
                    }
                %>
                <tr>
                    <td colspan="1" style="text-align:right">
                        <input type="checkbox" name="chkall" id="chkall" value="checkbox"
                               onclick="CheckAll(this.form);"/>选中/取消所有
                    </td>
                    <td colspan="6" style="text-align:right">
                        <input name="tjdel " type="button" onclick=" batchDel()" value="批量删除新闻"/>
                        <%out.print(AjaxXml.getPage(pages, 10, pn, counts, "", "", "", request));%>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div><!--r_iframe END-->

</body>
</html>