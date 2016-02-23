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
        String result = ste.editNews(request, userid, user_name, gym_group_id, gym_id);
        out.print(result);
        return;
    }

    String classname = "", classename = "", readme = "";
    String depth = "", savepath = "", htmlpage = "", templet = "";
    String picpath = "", keyword = "", otherhtml = "", classnavicontent = "";
    String content = "";
    int idtype = ru.getInt("idtype"), ordernum = 0;
    int id = ru.getInt("id");
    int parentid = ru.getInt("parentid");
    if (id > 0) {

        Doc doc = utildb
                .Get_Doc(
                        "classname,classename,ordernum,parentid,parentpath,depth,rootid,child,"
                                + "readme,keyword,previd,nextid,idtype,templet,savepath,picpath,htmlpage,"
                                + "otherhtml,content,classnavicontent,addtime",
                        "hy_news_class", "where id=?", "mysqlss",
                        new Object[]{new Integer(id)});
        if (doc != null) {
            classname = doc.get("classname");
            classename = doc.get("classename");
            templet = doc.get("templet");
            savepath = doc.get("savepath");
            picpath = doc.get("picpath");
            htmlpage = doc.get("htmlpage");
            otherhtml = doc.get("otherhtml");
            content = doc.get("content");
            parentid = doc.getIn("parentid");
            idtype = doc.getIn("idtype");

            readme = doc.get("readme");
            depth = doc.get("depth");
            savepath = doc.get("savepath");
            htmlpage = doc.get("htmlpage");
            templet = doc.get("templet");
            picpath = doc.get("picpath");
            keyword = doc.get("keyword");
            classnavicontent = doc.get("classnavicontent");
            ordernum = doc.getIn("ordernum");

        }
    }
    action = "save";
    String logstarttime = AjaxXml
            .Get_Date("now", "YY04-MM-DD HH:MI:SS");
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>table</title>
    <link href="../css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="../css/base.css" rel="stylesheet" type="text/css"/>


    <script type='text/javascript' src='/public/js/global.js'></script>
    <script type="text/javascript" src="/public/js/jquery-1.11.0.min.js"></script>

    <script type="text/javascript" src="/public/js/ueditor1_2_3_0/editor_config.js"></script>
    <script type="text/javascript" src="/public/js/ueditor1_2_3_0/editor_all.js"></script>
    <link rel="stylesheet" href="/public/js/ueditor1_2_3_0/themes/default/ueditor.css">

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
        $(function () {
            //$(this).contextMenu(menu1,{theme:'vista'});
        });

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
            var id = $("#id").val();
            var classname = $("#classname").val();
            var parentid = $("#parentid").val();
            //var bossname=$("#bossname").val();
            //var paixu=$("#paixu").val();
            //var content=KE.util.getData('content');
            //var content=escape(escape(editor.html()));
///	if (newsclass=="" || newsclass=="0"){
            //	$("#newsclass").alert('请选择栏目');
            //	return ;
            //}
            if (classname == "") {
                //	$("#classname").alert('请输入栏目名称');
                //	return ;
            }
            if (global_obj.check_form($('*[notnull]'))) {
                return false
            }
            ;
            var productDesc = editor.getContent();
            String.prototype.replaceAll = function (s1, s2) {
                return this.replace(new RegExp(s1, "gm"), s2);
            }
            //alert(productDesc);
            //content=content.replaceAll("&", "^…");
            $("#tjbutton").attr("disabled", true);
            $("#tisspan").html("<img src='../images/loading.gif' />提交中，请稍候……");
            $.ajax({
                type: "post",
                url: "newsclass_edit.jsp",
                data: $("#column_form").serialize() + "&contents=" + productDesc,
                //data:"id="+id+"&action=save&newsclass="+newsclass+"&title="+title+"&bossname="+bossname+"&markpic="+markpic+"&content="+content+"&paixu="+paixu+"&logstarttime=<%=logstarttime%>",
                success: function (msg) {
                    var backarr = $.trim(msg).split("$$");
                    if (backarr[1] == "ok") {
                        window.parent.art.dialog({
                            id: 'tisID',
                            content: backarr[0],
                            lock: true,
                            icon: "succeed",
                            cancelVal: '确定',
                            cancel: function () {
                                $("#tjbutton").attr("disabled", false);
                                $("#tisspan").html("");
                                //window.parent.location.reload();
                                window.parent.art.dialog({id: "tisID"}).close();
                                //window.parent.art.dialog({id:"xitong"}).close();
                                <%
                                if(idtype==4){
                                    %>window.parent.jianyi2('/manage/xinxi/skclass.jsp?parentid=' + parentid + '&idtype=<%=idtype%>', '食库栏目');
                                <%
                                                        }else if(idtype==1){
                                                            %>window.parent.jianyi2('/manage/xinxi/newsclass.jsp?parentid=' + parentid + '&idtype=<%=idtype%>', '产品栏目');
                                <%
                                                        }else{
                                                            %>window.parent.jianyi2('/manage/xinxi/newsclass.jsp?parentid=' + parentid + '&idtype=<%=idtype%>', '信息栏目');
                                <%
                                                        }
                                                        %>

                                window.parent.tabclose("编辑栏目");
                            }
                        });
                    } else {
                        window.parent.art.dialog.alert(backarr[0]);
                        $("#tjbutton").attr("disabled", false);
                        $("#tisspan").html("");
                    }

                }
            });
        }
    </script>

</head>

<script language="javascript">
    var web_obj = {
        column_edit_init: function () {
            if ($('#ColumnFileUpload').size()) {
                global_obj.file_upload($('#ColumnFileUpload'), $('#column_form input[name=pic_url_column]'), $('#ColumnImgDetail'), 'web_column');
                $('#ColumnImgDetail').html(global_obj.img_link($('#column_form input[name=pic_url_column]').val()));
            }
        }
    }
    $(document).ready(web_obj.column_edit_init);</script>


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
                            <label>
                                栏目名称
                            </label>
                            <input name="classname" id="classname" value="<%=classname%>" type="text" class="form_input"
                                   size="20" notnull><font class="fc_red">*</font>
                        </li>
                        <li>
                            <label>
                                排序
                            </label>
                            <input name="ordernum" id="ordernum" value="<%=ordernum%>" type="text" class="form_input"
                                   size="20">从大到小
                        </li>
                    </ul>


                    <ul class="row3 clearfix">


                        <li>
                            所属分类：
                            <%
                                if (parentid == 0) {
                                    out.print("顶级栏目");
                                } else {
                                    out.print(parentid);
                                }
                            %>
                        </li>
                    </ul>

                    <ul class="row3 clearfix">
                        <li>
                            关键页面：
                            <input name="classename" type="text" style="width: 80px"
                                   value="<%=classename%>">
                        </li>
                        <!--
								<li>
									分类说明：
									<input name="readme" type="text" id="readme"
										style="width: 80px" value="<%=readme%>" />
								</li>
								<li>
									使用模板：
									<select name=templet id="templet">
										<option value="">
											选择模板
										</option>
										<%
											List list = utildb.Get_List("classname,vm_path,title",
													"hy_news_templet", "where temtype='1' ", "mysqlss");
											if (list != null) {
												for (Iterator its = list.listIterator(); its.hasNext();) {
													Doc docx = (Doc) its.next();
													if (templet.equals(docx.get("vm_path"))) {
														out.println("<option value=\"" + docx.get("vm_path")
																+ "\" selected>" + docx.get("title")
																+ "</option>");
													} else {
														out.println("<option value=\"" + docx.get("vm_path")
																+ "\">" + docx.get("title") + "</option>");
													}
												}
											}
										%>

									</select>
								</li>
							</ul>
							<ul class="row3 clearfix">
								<li>
									保存路径：
									<input name="savepath" type="text" id="savepath"
										style="width: 80px" value="<%=savepath%>" />
								</li>
								<li>
									文件名称：
									<input name="htmlpage" type="text" id="htmlpage"
										style="width: 80px" value="<%=htmlpage%>" />
								</li>
								<li>
								</li>


							 -->
                    </ul>
                    <ul class="row1 clearfix">
                        <li>
                            板块图片：
									<span class="input"><span class="upload_file"><div>
                                        <div class="up_input">
                                            <input name="FileUpload" id="ColumnFileUpload" type="file"/>
                                        </div>
                                        <div class="tips">
                                            大图尺寸建议：100*100px，透明png效果更佳
                                        </div>
                                        <div class="clear"></div>
                                        <input type="hidden" name="pic_url_column" value=""/>
                                    </div>
											<div class="img" id="ColumnImgDetail">
                                                <%=(picpath.equals("") ? "" : "<a href=\"" + picpath
                                                        + "\"><img src=\"" + picpath + "\"></a>")%>
                                            </div> </span> </span>

                        </li>

                        <li>
                            描述：
                            <textarea name="otherhtml" cols="100" rows="4" id="otherhtml"><%=otherhtml%></textarea>
                            <!-- 关键字：
									<textarea name="keyword" cols="37" rows="4" id="keyword"><%=keyword%></textarea>
									 -->
                        </li>

                    </ul>
                    <ul class="row1 clearfix">
                        <!-- li>
									模版代码：
									<textarea cols="110" rows="6" id="classnavicontent"
										name="classnavicontent"><%=classnavicontent%></textarea>
								</li -->
                        <li>
                            内容介绍：
                            <script type="text/plain" id="contents" name="contents" class="ckeditor">
                                <%=content%>
                            </script>
                            <script type="text/javascript">var editor = new baidu.editor.ui.Editor(edit_options);
                            editor.render("contents");
                            </script>

                        </li>
                    </ul>

                    <div class="row_btn">

                        <button type="button" id="tjbutton" name="tjbutton"
                                class="btn_formA" onclick="usersave()">
                            确定保存
                        </button>
                        <span id="tisspan"></span>

                        <!--
                    <input type="submit"  class="btn_formA"
                    value="提交保存" name="submit_btn">
<button type="button" id="tjbutton" name="tjbutton" class="btn_formA" onclick="usersave()">确定保存</button>
-->
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