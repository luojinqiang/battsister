<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.baje.sz.util.*" %>
<%@ page import="com.baje.sz.ajax.*" %>
<%@ page import="com.hanyou.admin.sys.Newsclass" %>
<%@ page import="com.hanyou.util.*" %>
<%@ include file="../ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    RequestUtil ru = new RequestUtil(request);
    int newsclass = ru.getInt("newsclass");
    int idtype = ru.getInt("idtype");
    if (idtype == 1) {
        if (current_flags.indexOf(",4001,") < 0) {
            response.sendRedirect("../error.jsp?left=xinxi");
            return;
        }

    }


    String action = ru.getString("action");
    if (action.equals("del")) {
        Newsclass news = new Newsclass();
        out.print(news.delNewsClass(request, user_id, user_name, gym_group_id, gym_id));
        return;
    }
    if (action.equals("batchDel")) {
        Newsclass news = new Newsclass();
        out.print(news.batchDelNewsClass(request, user_id, user_name, gym_group_id, gym_id));
        return;
    }
    if (action.equals("html")) {
        Newsclass news = new Newsclass();
        String backstr = news.htmlNews(request, user_id, user_name, gym_group_id, gym_id);
        out.print(backstr);
        return;
    }

    int parentid = ru.getInt("parentid");

    String lanmutitle = "栏目管理";
    if (idtype == 1) {
        lanmutitle = "产品栏目";
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

    <script type="text/javascript" src="../js/artDialog4.1.6/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="../js/artDialog4.1.6/plugins/iframeTools.source.js"></script>
    <script language="javascript" src='../js/sys.js'></script>
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
        function edit(parentid, id, idtype) {

            window.parent.jianyi2('xinxi/newsclass_edit.jsp?idtype=' + idtype + '&parentid=' + parentid + '&id=' + id + '', '编辑栏目');
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
                button: [{
                    name: '确定',
                    callback: function () {
                        if (id == "") {
                            art.dialog({
                                id: 'delID'
                            }).close();
                            art.dialog.alert('请选择操作项');
                            return false;
                        }
                        $.ajax({
                            beforeSend: function () {
                                art.dialog({
                                    id: 'delID'
                                }).close();
                                art.dialog({
                                    id: 'tisID',
                                    lock: true,
                                    title: '提交中，请稍候……'
                                });
                            },
                            dataType: "json",
                            type: "post",
                            url: "newsclass.jsp",
                            data: "action=del&id=" + id + "",
                            success: function (data) {
                                art.dialog({
                                    id: 'tisID'
                                }).close();
                                if (data.type) {
                                    art.dialog({
                                        id: 'tisID',
                                        content: data.msg,
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
                                    art.dialog.alert(data.msg);
                                }
                            }
                        });
                        return false;
                    },
                    focus: true
                }, {
                    name: '取消'
                }]
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
                                url: "newsclass.jsp",
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

        function html(id) {

            var dialog = art.dialog({
                id: 'delID',
                content: '是否确定生成该页面？',
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
                                url: "newsclass.jsp",
                                data: "action=html&id=" + id + "",
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
            //dialog.shake && dialog.shake();// 调用抖动接口
        }

    </script>
</head>
<%

    if (parentid > 0) {
        Doc doc = utildb
                .Get_Doc(
                        "classname,classename,ordernum,parentid,parentpath,depth,rootid,child,"
                                + "readme,keyword,previd,nextid,idtype,templet,savepath,picpath,htmlpage,"
                                + "otherhtml,content,classnavicontent,addtime",
                        "hy_news_class", "where id=?", "mysqlss",
                        new Object[]{new Integer(parentid)});
        if (doc != null) {
            if (idtype == 1) {
                lanmutitle = doc.get("classname") + "--产品栏目--<a href=?parentid=0&idtype=1>返回</a>";
            } else {
                lanmutitle = doc.get("classname") + "--栏目管理--<a href=?parentid=0>返回</a>";
            }

        }

    }
%>
<body class="ifr">
<%@ include file="../left.jsp" %><!--End Sidebar-->
<div class="iframe_box">
    <div class="form_info"><strong><%=lanmutitle%>
    </strong></div>
    <div class="btnitem mb10 clearfix">
        <ul class="s_btn">
            <li><a href="javascript:edit(<%=parentid%>,0,<%=idtype%>)">新增栏目</a></li>

        </ul>
    </div>

    <div class="form_table">
        <form id="form2" name="form2" method="post" action="">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <th width="5%"></th>
                    <th width="8%">id</th>
                    <th width="48%">栏目</th>
                    <th width="11%">排序</th>
                    <th width="12%">添加时间</th>
                    <th width="15%">操作</th>
                </tr>

                <%
                    List sqllist = new ArrayList();
                    String wheres = " isdel=0";

                    if (newsclass > 0) {
                        wheres = wheres + " and newsclass=?";
                        sqllist.add(new Integer(newsclass));
                    }

//if (parentid>0){
                    wheres = wheres + " and parentid=? and idtype=?";
                    sqllist.add(new Integer(parentid));
                    sqllist.add(new Integer(idtype));

//}

                    int pages = ru.getInt("page");
                    if (pages == 0) {
                        pages = 1;
                    }
                    int pn = 25;
                    int n = 1;


                    n = pn * pages;
                    String table = "hy_news_class";
                    String file = "id,classname,classename,child,addtime,parentid,classnavicontent,templet,savepath,htmlpage,ordernum";
                    String order = " order by id desc";
                    String idd = "id";
                    int counts = utildb.Get_count(idd, table, wheres, "", sqllist);
                    List list = utildb.Get_mssqlList(pages, pn, counts, table, wheres, file, order, idd, "", sqllist);
                    if (list != null) {
                        for (Iterator its = list.listIterator(); its.hasNext(); ) {
                            Doc doc = (Doc) its.next();

                %>
                <tr>
                    <td><input name="id" type="checkbox" id="id" value="<%=doc.get("id")%>"/></td>
                    <td><%=doc.get("id")%>
                    </td>
                    <td><%=doc.get("classname")%><%=doc.get("classename")%>
                    </td>
                    <td><%=doc.get("ordernum")%>

                    </td>

                    <td><%=SetupUtil.timestamp2Date(doc.get("addtime"), "YY04-MM-DD")%>
                    </td>

                    <td>
                        <%
                            if (parentid == 0) {
                        %><a href="javascript:edit(<%=doc.get("id")%>,0,<%=idtype%>)">添加分类</a>
                        <a href="newsclass.jsp?parentid=<%=doc.get("id")%>&idtype=<%=idtype %>">查看分类</a><%
                        }
                    %>

                        <a href="javascript:edit(0,<%=doc.get("id")%>)">编辑</a>
                        <a href="javascript:del(<%=doc.get("id")%>)">删除</a>
                    </td>

                </tr>

                <%
                        }
                    }
                %>
                <tr>
                    <td colspan="2" style="text-align:right">
                        <input type="checkbox" name="chkall" id="chkall" value="checkbox"
                               onclick="CheckAll(this.form);"/>选中/取消所有
                    </td>
                    <td colspan="6" style="text-align:right">
                        <input name="tjdel " type="button" onclick="batchDel()" value="批量删除"/>
                        <%out.print(AjaxXml.getPage(pages, 10, pn, counts, "", "", "", request));%>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div><!--r_iframe END-->

</body>
</html>