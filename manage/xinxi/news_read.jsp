<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.baje.sz.util.*" %>
<%@ include file="../ini_sys.jsp" %>
<%
    RequestUtil ru = new RequestUtil(request);
    String newsclass = "", newstitle = "", content = "", readuser = "";

    int id = ru.getInt("id");
    String action = ru.getString("action");
    if (action.equals("saveread")) {
        News news = new News();
        out.print(news.readNews(request, userid, user_name, gym_group_id, gym_id));
    }
    if (id > 0) {
        Doc sanke = utildb.Get_Doc("newsclass,newstitle,content,readuser", "xitong_news", "where id=?", "", new Object[]{id});
        if (sanke != null) {
            //newsclass=News.getClass(sanke.getIn("newsclass"));
            newstitle = sanke.get("newstitle");
            content = sanke.get("content");
            readuser = sanke.get("readuser");
        }
    }
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>table</title>
    <link href="../css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="../css/base.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="/xheditor-1.1.9/xheditor-1.1.9-zh-cn.min.js"></script>
    <script language=javascript src='../js/qmango.js'></script>
    <link rel="stylesheet" type="text/css" href="../css/jquery.contextmenu.css"/>
    <script type="text/javascript" src="../js/jquery.contextmenu.js"></script>
    <script type="text/javascript">
        var menu1 = [
            {
                '刷新页面': function (menuItem, menu) {
                    window.location.reload();
                }
            }
        ];
        $(function () {
            $(this).contextMenu(menu1, {theme: 'vista'});
        });
        <%
        if(readuser.indexOf(","+userid+",")<0){
            %>$(function () {
            $.ajax({
                type: "post",
                url: "news_read.jsp",
                data: "action=saveread&id=<%=id%>",
                success: function (msg) {

                },
                error: function () {

                }
            });
        });
        <%
    }
    %>

    </script>
</head>

<body class="ifr">
<div id="dd" style="padding:5px;">
    <div class="box_input">
        <form id="form1" name="form1" method="post" action="">
            <input name="id" id="id" type="hidden" value="<%=id%>"/>
            <ul class="row1 clearfix">
                <li>
                    <%=content%>
                </li>
            </ul>
        </form>
    </div>
</div><!--r_iframe END-->

<%@ include file="../end.jsp" %><!--End Sidebar-->
</body>
</html>