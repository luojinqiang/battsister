<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.baje.sz.util.*" %>
<%@ page import="com.baje.sz.ajax.*" %>
<%@ page import="com.hanyou.admin.sys.Newsclass" %>
<%@ include file="../ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    if (current_flags.indexOf(",4001,") < 0) {
        response.sendRedirect("../error.jsp?left=xinxi");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    Newsclass ste = new Newsclass();
    String action = ru.getString("action");
    if (action.equals("save")) {
        JSONObject result = ste.editNews(request, user_id, user_name);
        out.print(result);
        return;
    }

    String classname = "", classename = "";
    String depth = "";
    String picpath = "",parentpath="", keyword = "";
    int idtype = ru.getInt("idtype"), ordernum = 0;
    int id = ru.getInt("id");
    int parentid = ru.getInt("parentid");
    if (id > 0) {
        Doc doc = utildb
                .Get_Doc(
                        "classname,classename,ordernum,parentid,parentpath,depth,rootid,child,"
                                + "keyword,previd,nextid,idtype,addtime",
                        "bs_news_class", "where id=?", "mysqlss",
                        new Object[]{new Integer(id)});
        if (doc != null) {
            classname = doc.get("classname");
            classename = doc.get("classename");
            picpath = doc.get("picpath");
            parentid = doc.getIn("parentid");
            idtype = doc.getIn("idtype");
            depth = doc.get("depth");
            picpath = doc.get("picpath");
            keyword = doc.get("keyword");
            ordernum = doc.getIn("ordernum");

        }
    }
    action = "save";
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>table</title>
    <link href="../css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="../css/base.css" rel="stylesheet" type="text/css"/>
    <script type='text/javascript' src='/public/js/global.js'></script>
    <script type="text/javascript" src="/public/js/jquery-1.11.0.min.js"></script>
    <link href='/public/js/operamasks/operamasks-ui.css' rel='stylesheet' type='text/css'/>
    <script type='text/javascript' src='/public/js/operamasks/operamasks-ui.min.js'></script>
    <script type="text/javascript">
        var menu1 = [
            {
                '刷新页面': function (menuItem, menu) {
                    window.location.reload();
                }
            }
        ];
        function selectPicBack(inputname, inputvalue) {
            $("#windownbg").remove();
            $("#windown-box").fadeOut("slow", function () {
                $(this).remove();
            });
            $("#" + inputname).attr("value", inputvalue);
        }
        function uppic(inputname) {
            openurl('../uppic.jsp?backinput=' + inputname + '', 'pic', '上传图片', 400, 180, 0, 50, true);
        }
        function selectPicBack(inputname, urlpath) {
            if (urlpath != "") {
                $("#" + inputname).val(urlpath);
            }
            art.dialog({id: "pic"}).close();
        }
        function usersave() {
            var parentid = $("#parentid").val();
            $("#tjbutton").attr("disabled", true);
            $("#tisspan").html("<img src='../images/loading.gif' />提交中，请稍候……");
            $.ajax({
                type: "post",
                dataType:"json",
                url: "newsclass_edit.jsp",
                data: $("#column_form").serialize(),
                success: function (msg) {
                    if (msg.type) {
                        window.parent.art.dialog({
                            id: 'tisID',
                            content:msg.msg,
                            lock: true,
                            icon: "succeed",
                            cancelVal: '确定',
                            cancel: function () {
                                $("#tjbutton").attr("disabled", false);
                                $("#tisspan").html("");
                                window.parent.art.dialog({id: "tisID"}).close();
                            	window.parent.jianyi2('/manage/xinxi/newsclass.jsp?parentid=' + parentid + '&idtype=<%=idtype%>', '信息栏目');
                                window.parent.tabclose("编辑栏目");
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
    </script>

</head>
<body class="ifr">
<%@ include file="../left.jsp"%><!--End Sidebar-->
<div class="iframe_box">
    <div id="iframe_page">

        <div class="iframe_content">

            <div class="box_input">
                <form id="column_form" name="column_form" method="post" action="" autocomplete="off">
                    <input name="action" id="action" type="hidden" value="<%=action%>"/>
                    <input name="id" type="hidden" id="id" value="<%=id%>"/>
                    <input name="parentid" type="hidden" id="parentid" value="<%=parentid%>"/>
                    <input name="idtype" id="idtype" type="hidden" value="<%=idtype%>"/>
                    <ul class="row3 clearfix">
                        <li>
                            所属分类：
                            <%
                                if (parentid == 0) {
                                    out.print("顶级栏目");
                                } else {
                                   Doc parentDoc=utildb.Get_Doc("id,classname"," bs_news_class"," where id=? ","mysqlss",new Object[]{parentid});
                              		if(parentDoc!=null){
                              			out.print(parentDoc.get("classname")+"("+parentid+")");
                              		}
                                }
                            %>
                        </li>
                    </ul>
                    <ul class="row3 clearfix">
                        <li>
                            <label>
                                栏目名称：
                            </label>
                            <input name="classname" id="classname" value="<%=classname%>" type="text" class="form_input"
                                   size="20" />
                        </li>
                          <li>
                            <label>
                                英文栏目名称：
                            </label>
                            <input name="classename" id="classename" value="<%=classename%>" type="text" class="form_input"
                                   size="20" />
                        </li>
                        <li>
                            <label>
                                排序：
                            </label>
                            <input name="ordernum" id="ordernum" value="<%=ordernum%>" type="text" class="form_input"
                                   size="20" />
                        </li>
                    </ul>
                     <ul class="row1 clearfix">
                        <li>
                            <label>
                                关键字说明：
                            </label>
                            <input name="keyword" id="keyword" value="<%=keyword%>" type="text" class="form_input"
                                   size="50" />
                        </li>
                    </ul>
                    <div class="row_btn">

                        <button type="button" id="tjbutton" name="tjbutton"
                                class="btn_formA" onclick="usersave()">
                            确定保存
                        </button>
                        <span id="tisspan"></span>
                    </div>
                </form>
            </div>
        </div>
        <!--r_iframe END-->
    </div>
</div>
<%@ include file="../end.jsp"%><!--End Sidebar-->
</body>
</html>