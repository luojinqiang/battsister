<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.baje.sz.util.*" %>
<%@ page import="com.baje.sz.ajax.*" %>
<%@ page import="com.hanyou.admin.sys.News" %>
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
    News news = new News();
    int logid = ru.getInt("id");
    String action = ru.getString("action");
    if (action.equals("del")) {

        String backstr = news.delNewspic(request, user_id, user_name, gym_group_id, gym_id);
        out.print(backstr);
        return;
    }


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>文件管理器</title>
    <link href="../css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="../css/base.css" rel="stylesheet" type="text/css"/>
    <link href="../css/page.css" rel="stylesheet" type="text/css"/>
    <script type='text/javascript' src='/Public/js/jquery-1.11.0.min.js'></script>
    <script type="text/javascript" src="../js/artDialog4.1.6/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="../js/artDialog4.1.6/plugins/iframeTools.source.js"></script>

    <script type='text/javascript' src='/public/js/global.js?t=20140228'></script>

    <link href='/public/js/operamasks/operamasks-ui.css' rel='stylesheet' type='text/css'/>
    <script type='text/javascript' src='/public/js/operamasks/operamasks-ui.min.js'></script>
    <style>
        #albums .item {
            border: 1px solid #ddd;
            background: #f7f7f7;
            overflow: hidden;
            margin: 0 15px 15px 0;
            width: 159px;
            float: left;
        }

        #albums .item .t {
            height: 18px;
            line-height: 18px;
            overflow: hidden;
            border-bottom: 1px solid #ccc;
            padding: 10px;
            cursor: move;
        }

        #albums .item .t .dot {
            width: 8px;
            height: 8px;
            background: #2D6C9F;
            float: left;
            margin-top: 6px;
        }

        #albums .item .t .i {
            height: 18px;
            line-height: 18px;
            overflow: hidden;
            text-indent: 8px;
            font-weight: bold;
            color: #666;
        }

        #albums .item .t .i a {
            padding: 0 1px;
        }

        #albums .item .e {
            padding: 10px;
            background: #fff;
            cursor: move;
        }

        #albums .item .e div {
            overflow: hidden;
            width: 100%;
            height: 100px;
            text-align: center;
        }

        #albums .item .e div img {
            width: 100%;
        }

        .linerow {
            border-bottom: 1px solid #CBD8AC;
            height: 24px
        }

        #albums .photo_list dd {
            border: 1px solid #ccc;
            background: #f7f7f7;
            overflow: hidden;
            margin: 0 15px 15px 0;
            width: 159px;
            height: 135px;
            float: left;
        }

        #albums .photo_list dd.placeHolder {
            border: dashed 1px #1584D5;
            background: #fff;
        }

        #albums .photo_list ul li.name {
            height: 25px;
            line-height: 25px;
            overflow: hidden;
            background: #ddd;
            text-indent: 3px;
        }

        #albums .photo_list ul li.img {
            height: 100px;
            padding: 1px;
            overflow: hidden;
            background: #ccc;
        }

        #albums .photo_list ul li.img img {
            width: 100%;
            min-height: 100px;
        }
    </style>
</head>
<base target="_self"/>
<body leftmargin='8' topmargin='8'>
<form id="column_form" name="column_form" method="post" action="shop_edit.jsp">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                上传图片：
    <span class="input"><span class="upload_file"><div>
        <div class="up_input">
            <input name="FileUpload" id="smallfileUpload" type="file"/>
        </div>

        <div class="clear"></div>
        <input type="hidden" name="smallfile" value=""/>
    </div>
									<div class="img" id="smallfileDetail">
                                    </div>
							</span>
							</span>
            </td>

        </tr>
    </table>

</form>
<script>
    if ($('#smallfileUpload').size()) {
        global_obj.userfile_upload($('#smallfileUpload'), $('#column_form input[name=smallfile]'), $('#smallfileDetail'),
                1000, <%=logid%>, '<%=user_name%>', '<%=user_id%>', 0, 500, 100, "", function (pic) {
                    addpiclist(pic);
                });

    }
    function addpiclist(pic) {
        var str = "";
        location.href = 'newpic.jsp?id=<%=logid%>';

    }

    function del(picid) {

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
                            url: "newpic.jsp",
                            data: "action=del&id=<%=logid%>&picid=" + picid + "",
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
                                            location.href = 'newpic.jsp?id=<%=logid%>';

                                            //window.location.reload();
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
<div id="iframe_page">
    <div class="iframe_content">
        <div id="albums" class="r_con_wrap">

            <div>
                <dl class="photo_list">
                        <%
List list=utildb.Get_List("id,file_name,file_readme,photofile,file_showname,username,file_size,issave,addtime","hy_news_upfile","where logid="+logid+" and isdel=0","mysqlss");
 if (list!=null){
 for (Iterator its = list.listIterator();its.hasNext();){
 Doc doc = (Doc)its.next();	
%>
                    <dd class="item" SId=<%=doc.get("id")%>>
                        <ul>
                            <li class="name">
                                &nbsp;&nbsp;
                                <a onclick="del(<%=doc.get("id")%>);"><img src="/Public/Images/del.gif"
                                                                           align="absmiddle"/>删除</a>
                                <%if (doc.getIn("issave") == 1) {%>
                                <a onclick="fanhui('<%=doc.get("file_showname")%>');"><img src="/Public/Images/add.gif"
                                                                                           align="absmiddle"/>小图</a>
                                <a onclick="fanhui('<%=doc.get("photofile")%>');"><img src="/Public/Images/add.gif"
                                                                                       align="absmiddle"/>中图</a>
                                <%}%>
                                <a onclick="fanhui('<%=doc.get("file_readme")%>');" style="font-size:9px;float:right;">大图</a>
                            </li>
                            <li class="img">
                                <a href="<%=doc.get("file_readme")%>" target="_blank"><img
                                        src="<%=doc.get("file_readme")%>"/>
                                </a>
                            </li>
                        </ul>
                    </dd>
                        <%
 }}
 %>
            </div>
        </div>
    </div>
</div>


</body>
</html>