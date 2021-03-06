<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.baje.sz.ajax.AjaxXml" %>
<%@ page import="com.baje.sz.util.Doc" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.battsister.admin.sys.News" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ include file="../ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    if (current_flags.indexOf(",3002,") < 0) {
        response.sendRedirect("../error.jsp?left=xinxi");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    if (action.equals("save")) {
    	News ste = new News();
        JSONObject result = ste.editNews(request, user_id, user_name);
        out.print(result);
        return;
    }

    int newsclass = 0;
    String newstitle = "", bossname = "", smallfile = "", bigfile = "";
    int ordernum = 0, isdel = 0;
    String addtime = "", adduser = "";
    int adduserid = 0,is_top=0;
    String  content = "";
    String keywords = "",note="";
    int id = ru.getInt("id");
    action = "save";
    if (id > 0) {
        Doc doc = utildb.Get_Doc("id,newstitle,is_top,note,newsclass,bossname,smallfile,bigfile,ordernum,isdel,addtime,adduser,adduserid," +
                "content,hits,keywords" +
                "", "bs_news", "where id=?", "", new Object[]{new Integer(id)});
        if (doc != null) {
            newstitle = doc.get("newstitle");
            content = doc.get("content");
            newsclass = doc.getIn("newsclass");
            keywords = doc.get("keywords");
            bossname = doc.get("bossname");
            smallfile = doc.get("smallfile");
            bigfile = doc.get("bigfile");

            ordernum = doc.getIn("ordernum");
            isdel = doc.getIn("isdel");
            addtime = doc.get("addtime");
            adduser = doc.get("adduser");
            note=doc.get("note");
            is_top=doc.getIn("is_top");
        }
    }
    String logstarttime = AjaxXml.Get_Date("now", "YY04-MM-DD HH:MI:SS");
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>table</title>
    <link href="../css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="../css/base.css" rel="stylesheet" type="text/css"/>


    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script language="javascript" src='../js/sys.js'></script>
    <script type="text/javascript" src="/public/js/ueditor1_2_3_0/editor_config.js"></script>
    <script type="text/javascript" src="/public/js/ueditor1_2_3_0/editor_all.js"></script>
    <link rel="stylesheet" href="/public/js/ueditor1_2_3_0/themes/default/ueditor.css"/>
    <script type='text/javascript' src='/public/js/global.js'></script>
    <link type="text/css" rel="stylesheet" href="/public/js/jquery.alerts.css"/>
    <script type="text/javascript" src="/public/js/jquery.alerts.js"></script>
    <link href='/public/js/operamasks/operamasks-ui.css' rel='stylesheet' type='text/css'/>
    <script type='text/javascript' src='/public/js/operamasks/operamasks-ui.min.js'></script>
    <style type="text/css">
        .del {
            bottom: 0;
            height: 22px;
            width: 100px;
            line-height: 22px;
            text-align: center;
            background: #000;
            color: #fff;
            filter: alpha(opacity=70);
            -moz-opacity: 0.7;
            -khtml-opacity: 0.7;
            opacity: 0.7;
            cursor: pointer;
        }
    </style>
    <script type="text/javascript">
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
            var newsclass = $("#newsclass").val();
            var newstitle = $("#newstitle").val();
            var content = escape(escape(editor.getContent()));
            if (newsclass == "" || newsclass == "0") {
                window.parent.art.dialog.alert('请选择栏目');
                return;
            }
            if (newstitle == "") {
                window.parent.art.dialog.alert('请输入标题');
                return;
            }
            if (content == "") {
                content = "<p></p>";
            }
            String.prototype.replaceAll = function (s1, s2) {
                return this.replace(new RegExp(s1, "gm"), s2);
            }
            content = content.replaceAll("&", "^…");
            $("#tjbutton").attr("disabled", true);
            $("#tisspan").html("<img src='../images/loading.gif' />提交中，请稍候……");
            $.ajax({
                type: "post",
                dataType: "json",
                url: "news_edit.jsp",
                data: $("#form1").serialize() + "&logstarttime=<%=logstarttime%>&contentx=" + content + "",
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
                                window.parent.jianyi2('/manage/xinxi/news.jsp', '信息内容');
                                window.parent.tabclose("编辑新闻");
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
<%@ include file="../left.jsp" %><!--End Sidebar-->
<div class="iframe_box">
    <div class="box_input">
        <form id="form1" name="form1" method="post" action="news_edit.jsp">
            <input name="id" id="id" type="hidden" value="<%=id%>"/>
            <input name="action" id="action" type="hidden" value="<%=action%>"/>
            <input name="newstype" id="newstype" type="hidden" value="1"/>
            <ul class="row3 clearfix">
                <li>
                    <label for="textfield">栏&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目：</label>
                    <select name="newsclass" id="newsclass">
                        <option value="0">选择栏目</option>

                        <%
                            List clist = utildb.Get_List("id,classname,parentid", "bs_news_class", "where idtype=0 and isdel=0 and parentid=0", "");
                            if (clist != null) {
                                for (Iterator its = clist.listIterator(); its.hasNext(); ) {
                                    Doc docx = (Doc) its.next();
                                    if (newsclass == docx.getIn("id")) {
                                        out.println("<option value=\"" + docx.get("id") + "\" selected>&nbsp;|└" + docx.get("classname") + "</option>");
                                    } else {
                                        out.println("<option value=\"" + docx.get("id") + "\">├" + docx.get("classname") + "</option>");
                                    }
                                    List plist = utildb.Get_List("id,classname", "bs_news_class", "where isdel=0 and parentid=" + docx.getIn("id") + "", "");
                                    if (clist != null) {
                                        for (Iterator pits = plist.listIterator(); pits.hasNext(); ) {
                                            Doc docp = (Doc) pits.next();
                                            if (newsclass == docp.getIn("id")) {
                                                out.println("<option value=\"" + docp.get("id") + "\" selected>&nbsp;|└" + docp.get("classname") + "</option>");
                                            } else {
                                                out.println("<option value=\"" + docp.get("id") + "\">&nbsp;|└" + docp.get("classname") + "</option>");
                                            }

                                        }
                                    }
                                }
                            }
                        %>
                    </select>

                </li>
                <li>是否置顶：<input type="checkbox" name="is_top"  value="1"  <%=is_top==1?"checked=\"checked\"":""%>/>&nbsp;
                </li>
                <li>排序：<input type="text" name="ordernum" id="ordernum" value="<%=ordernum %>" style="width:50px;"/>&nbsp;从小到大
                </li>
            </ul>
            <ul class="row1 clearfix">
                <li>
                    <label for="textfield">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：</label>
                    <input type="text" name="newstitle" id="newstitle" value="<%=newstitle %>" style="width:300px;"/>
                </li>
                 <li>
                    <label for="textfield">简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介：</label>
                    <textarea rows="5" cols="50" name="note"><%=note%></textarea>
                   &nbsp;(50字以内)
                </li>
                <li>
                    <label for="textfield">关键字：</label>
                    <input type="text" name="keywords" id="keywords" value="<%=keywords %>" style="width:300px;"/>
                </li>
            </ul>
            <ul class="row1 clearfix">
                <li>标识图片：
                    标识小图片：
    <span class="input"><span class="upload_file"><div>
        <div class="up_input">
            <input name="FileUpload" id="smallfileUpload" type="file"/>
        </div>
        <div class="tips" style="color: red;">
			<!-- 专业资源类--推荐像素：（250x156px）
			其他类--推荐像素：（250x156px） -->
			推荐像素：（250x156px）
        </div>
        <div class="clear"></div>
        <input type="hidden" name="smallfile" value="<%=smallfile%>"/>
    </div>
									<div class="img" id="smallfileDetail">
                                    </div>
							</span>
							</span>
                </li>
            </ul>
           <%--  <ul class="row1 clearfix">
                <li>
                    标识大图片：
    <span class="input"><span class="upload_file"><div>
        <div class="up_input">
            <input name="FileUpload" id="bigfileUpload" type="file"/>
        </div>
        <div class="tips">

        </div>
        <div class="clear"></div>
        <input type="hidden" name="bigfile" value="<%=bigfile%>"/>
    </div>
									<div class="img" id="bigfileDetail">
                                    </div>
							</span>
							</span>

                </li>
            </ul> --%>
            <script>
                if ($('#smallfileUpload').size()) {
                    global_obj.file_upload($('#smallfileUpload'), $('#form1 input[name=smallfile]'), $('#smallfileDetail'), 'web_column');
                    $('#smallfileDetail').html(global_obj.img_link($('#form1 input[name=smallfile]').val()));
                    if ($('#form1 input[name=smallfile]').val() != '') {
                        $('#smallfileDetail').append('<div class="del">删除</div>');
                    }
                    $('#smallfileDetail div').click(function () {
                        $('#form1 input[name=smallfile]').val('');
                        $(this).parent().html('');
                    });
                }
                if ($('#bigfileUpload').size()) {
                    global_obj.file_upload($('#bigfileUpload'), $('#form1 input[name=bigfile]'), $('#bigfileDetail'), 'web_column', '', '', '', '', '', 200);
                    $('#bigfileDetail').html(global_obj.img_linkheight($('#form1 input[name=bigfile]').val()), '200');
                    if ($('#form1 input[name=bigfile]').val() != '') {
                        $('#bigfileDetail').append('<div class="del">删除</div>');
                    }
                    $('#bigfileDetail div').click(function () {
                        $('#form1 input[name=bigfile]').val('');
                        $(this).parent().html('');
                    });
                }
            </script>
            <ul class="row1 clearfix">
                <li>
                    <script type="text/plain" id="contents" name="contents" class="ckeditor">
                        <%=content %>
                    </script>
                    <script type="text/javascript">var editor = new baidu.editor.ui.Editor(edit_options);
                    editor.render("contents");
                    </script>
                </li>
            </ul>
            <div class="row_btn">
                <button type="button" class="btn_formA" onclick="usersave()" name="tjbutton" id="tjbutton">确定保存</button>
                <span id="tisspan"></span>
            </div>
        </form>
    </div>
</div><!--r_iframe END-->

<%@ include file="../end.jsp" %><!--End Sidebar-->
</body>
</html>