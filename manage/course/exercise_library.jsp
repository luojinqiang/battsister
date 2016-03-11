<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.baje.sz.util.Doc" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.battsister.model.ExerciseLibrary" %>
<%@ page import="com.battsister.model.ExerciseOption" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ include file="../ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    RequestUtil ru = new RequestUtil(request);

    String action = ru.getString("action");
    if (action.equals("del_question")) {
        return;
    }
    if (action.equals("del_answer")) {
        return;
    }
    if (action.equals("question")) {
        return;
    }
    if (action.equals("answer")) {
        return;
    }
    String subject_name = "";
    int id = ru.getInt("id");
    if (id > 0) {
        /*Doc doc = utildb.Get_Doc("id,subject_name", "wx_survey", "where id=?", "", new Object[]{new Integer(id)});
        if (doc != null) {
            id = doc.getIn("id");
            subject_name = doc.get("subject_name");
        }*/
    }

%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <title>table</title>
    <link href='/public/css/member/global.css?t=20140304' rel='stylesheet' type='text/css'/>
    <link href='/public/css/member/main.css?t=20140304' rel='stylesheet' type='text/css'/>
    <script type='text/javascript' src='/public/js/jquery.min.js'></script>
    <script type='text/javascript' src='/public/js/global.js?t=20140304'></script>
</head>
<body>
<!--[if lte IE 9]>
<script src="/public/js/member/jquery.watermark-1.3.js"></script><![endif]-->
<style type="text/css">
    body, html {
        background-color: #cee3f6;
    }
</style>
<div id="iframe_page">
    <div class="iframe_content">
        <link href='/public/css/member/survey.css' rel='stylesheet' type='text/css'/>
        <script type='text/javascript' src='/public/js/survey.js'></script>
        <link href='/public/js/lean-modal/style.css' rel='stylesheet' type='text/css'/>
        <link href='/public/js/operamasks/operamasks-ui.css' rel='stylesheet' type='text/css'/>
        <script type='text/javascript' src='/public/js/operamasks/operamasks-ui.min.js'></script>
        <script type='text/javascript' src='/public/js/lean-modal/lean-modal.min.js'></script>
        <script language="javascript">$(document).ready(survey_obj.survey_set_init);</script>
        <div id="survey_list" class="r_con_wrap">
            <div class="control_btn">
                <a href="#add_topic" class="btn_green btn_w_120">添加问题</a>
            </div>
            <div class="tips">
                <strong>问卷主题：</strong><%=subject_name %>
            </div>
            <div class="clear"></div>
            <%
                String question = "";
                String question_pic = "";
                String answer = "";
                String answer_pic = "";
                int qid = 0;
                int aid = 0;
                int pages = ru.getInt("page");
                int pn = 25;
                int i = 0;
                int j = 0;
                //int counts = utildb.Get_count(idd, table, wheres, "", sqllist);
                ExerciseLibrary el = new ExerciseLibrary();
                ExerciseOption eo = new ExerciseOption();
                Doc whereDoc = new Doc();
                whereDoc.put("isdel", 0);
                whereDoc.put("@order", "order_num asc");
                //counts = el.queryCountByWhere(whereDoc);

                List questionList = el.queryPageByWhere(pages, pn, whereDoc);
                if (questionList != null) {
                    Doc doc;
                    List answerList;
                    Doc answerWhereDoc;
                    Doc answerDoc;
                    for (Iterator its = questionList.listIterator(); its.hasNext(); ) {
                        doc = (Doc) its.next();
                        question = doc.get("name");
                        question_pic = doc.get("name_pic");
                        qid = doc.getIn("id");
                        i++;
            %>
            <div class="topic">
                <div class="title"
                     Data='{"qid":"<%=qid %>","Title":"<%=question %>","ImgPath":"<%=question_pic %>"}'>
                    <strong><%=i %>、</strong><%=question %>
                    <span class="fc_red">
                        <%
                            if (!question_pic.equals("")) {
                                out.print("【图】");
                            }
                        %>
                    </span>
                    <a href="#survey_add_answer" title="添加选项">
                        <img src="/public/images/add.gif" align="absmiddle"/>
                    </a>
                    <a href="#survey_mod_list" title="修改问题">
                        <img src="/public/images/mod.gif" align="absmiddle"/>
                    </a>
                    <a onclick="del_question(<%=qid %>);">
                        <img src="/public/images/del.gif" align="absmiddle"/>
                    </a>
                </div>
                <div class="answer">
                    <%

                        answerWhereDoc = new Doc();
                        answerWhereDoc.put("exercise_librarh_id", doc.get("id"));
                        answerWhereDoc.put("isdel", 0);
                        answerWhereDoc.put("@order", "order_num asc");
                        answerList = eo.queryArrayByWhere(answerWhereDoc);
                        j = 0;
                        if (answerList != null) {
                            for (Iterator itss = answerList.listIterator(); itss.hasNext(); ) {
                                answerDoc = (Doc) itss.next();
                                aid = answerDoc.getIn("id");
                                answer = answerDoc.get("name");
                                answer_pic = answerDoc.get("pic");
                                j++;
                    %>

                    <div class="list" DataAnswer='{"qid":"<%=qid %>","aid":"<%=aid %>","Title":"<%=question %>","AId":"26","Answer":"<%=answer %>","ImgPath":"<%=answer_pic %>"}'>
                        <div class="t">
                            <%=j %>、<%=answerDoc.get("answer") %>
                            <span class="fc_red">
                                <%
                                    if (!answerDoc.get("answer_pic").equals("")) {
                                        out.print("【图】");
                                    }
                                %>
                            </span>
                        </div>
                        <div class="opt">
                            <a href="#survey_mod_answer">
                                <img src="/public/images/mod.gif"/>
                            </a>
                            <a onclick="del_answer(<%=aid %>);">
                                <img src="/public/images/del.gif"/>
                            </a>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                    <div class="clear"></div>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>

        <div id="survey_list_add" class="lean-modal lean-modal-form">
            <div class="h">
                新增问题
                <a class="modal_close" id="modal_close" href="#"></a>
            </div>
            <form class="form" id="survey_add_form">
                <div class="rows">
                    <label>
                        问题：
                    </label>
                    <span class="input">
                        <input name="Title" value="" type="text" class="form_input" size="26" maxlength="100" notnull>
                        <font class="fc_red">*</font>
                    </span>
                    <div class="clear"></div>
                </div>
                <div class="rows">
                    <label>
                        图片：
                    </label>
							<span class="input">
                                <div class="file_upload">
                                    <input name="FileUpload" id="ImgPathFileUpload" type="file"/>
                                </div>
								<div class="img_detail" id="ImgPathDetail"></div>
								<div class="clear"></div>
								<div class="big_size_tips">
                                    大图尺寸建议：640*360px
                                </div>
							</span>
                    <div class="clear"></div>
                </div>
                <div class="rows">
                    <label></label>
                    <span class="submit"><input type="submit" value="确定提交" name="submit_btn"></span>
                    <div class="clear"></div>
                </div>
                <input type="hidden" name="ImgPath" value=""/>
                <input type="hidden" name="action" value="question">
                <input type="hidden" name="pid" value="<%=id %>"/>
            </form>
        </div>
        <div id="survey_list_mod" class="lean-modal lean-modal-form">
            <div class="h">
                修改问题
                <a class="modal_close" href="#"></a>
            </div>
            <form class="form" id="survey_mod_form">
                <div class="rows">
                    <label>
                        问题：
                    </label>
							<span class="input">
                                <input name="Title" value="" type="text" class="form_input" size="26" maxlength="100" notnull>
                                <font class="fc_red">*</font>
							</span>
                    <div class="clear"></div>
                </div>
                <div class="rows">
                    <label>
                        图片：
                    </label>
							<span class="input">
                                <div class="file_upload">
                                    <input name="FileUpload" id="ImgPathFileUploadMod" type="file"/>
                                </div>
								<div class="img_detail" id="ImgPathDetailMod">
                                    <%
                                        if (!question_pic.equals("")) {
                                            out.print("<a href=" + question_pic + " target=_blank><img src=" + question_pic + " /></a>");
                                        }
                                    %>
                                </div>
								<div class="clear"></div>
								<div class="big_size_tips">
                                    大图尺寸建议：640*360px
                                </div>
							</span>
                    <div class="clear"></div>
                </div>
                <div class="rows">
                    <label></label>
                    <span class="submit">
                        <input type="submit" value="确定提交" name="submit_btn">
                    </span>
                    <div class="clear"></div>
                </div>
                <input type="hidden" name="ImgPath" value="<%=question_pic %>"/>
                <input type="hidden" name="action" value="question">
                <input type="hidden" name="ajax" value="1">
                <input type="hidden" name="qid" value=""/>
                <input type="hidden" name="LId" value=""/>
            </form>
        </div>
        <div id="survey_answer_add" class="lean-modal lean-modal-form">
            <div class="h">
                新增问题选项
                <a class="modal_close" href="#"></a>
            </div>
            <form class="form" id="survey_answer_add_form">
                <div class="rows">
                    <label>
                        问题：
                    </label>
                    <span class="input" id="SurveyListTitle"></span>
                    <div class="clear"></div>
                </div>
                <div class="rows">
                    <label>
                        选项：
                    </label>
                    <span class="input">
                        <input name="Answer" value="" type="text" class="form_input" size="26" maxlength="100" notnull>
                        <font class="fc_red">*</font>
                    </span>
                    <div class="clear"></div>
                </div>
                <div class="rows">
                    <label>
                        图片：
                    </label>
							<span class="input">
                                <div class="file_upload">
                                    <input name="AnswerFileUpload" id="AnswerImgPathFileUpload" type="file"/>
                                </div>
								<div class="img_detail" id="AnswerImgPathDetail"></div>
								<div class="clear"></div>
								<div class="big_size_tips">
                                    大图尺寸建议：640*360px
                                </div>
							</span>
                    <div class="clear"></div>
                </div>
                <div class="rows">
                    <label></label>
                    <span class="submit">
                        <input type="submit" value="确定提交" name="submit_btn">
                    </span>
                    <div class="clear"></div>
                </div>
                <input type="hidden" name="ImgPath" value=""/>
                <input type="hidden" name="action" value="answer">
                <input type="hidden" name="qid" value=""/>
            </form>
        </div>
        <div id="survey_answer_mod" class="lean-modal lean-modal-form">
            <div class="h">
                修改问题选项
                <a class="modal_close" href="#"></a>
            </div>
            <form class="form" id="survey_answer_mod_form">
                <div class="rows">
                    <label>
                        问题：
                    </label>
                    <span class="input" id="SurveyListTitleMod"></span>
                    <div class="clear"></div>
                </div>
                <div class="rows">
                    <label>
                        选项：
                    </label>
                    <span class="input">
                        <input name="Answer" value="" type="text" class="form_input" size="26" maxlength="100" notnull>
                        <font class="fc_red">*</font>
                    </span>
                    <div class="clear"></div>
                </div>
                <div class="rows">
                    <label>
                        图片：
                    </label>
							<span class="input">
                                <div class="file_upload">
                                    <input name="AnswerFileUpload" id="AnswerModImgPathFileUpload" type="file"/>
                                </div>
								<div class="img_detail" id="AnswerModImgPathDetail">
                                    <%
                                        if (!answer_pic.equals("")) {
                                            out.print("<a href=" + answer_pic + " target=_blank><img src=" + answer_pic + " /></a>");
                                        }
                                    %>
                                </div>
								<div class="clear"></div>
								<div class="big_size_tips">
                                    大图尺寸建议：640*360px
                                </div>
							</span>
                    <div class="clear"></div>
                </div>
                <div class="rows">
                    <label></label>
                    <span class="submit"><input type="submit" value="确定提交" name="submit_btn"></span>
                    <div class="clear"></div>
                </div>
                <input type="hidden" name="ImgPath" value="<%=answer_pic %>"/>
                <input type="hidden" name="action" value="answer">
                <input type="hidden" name="aid" value=""/>
            </form>
        </div>
    </div>
    <!--end id="iframe_page"-->
</div>
</body>

<script>
    function del_question(id) {
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
                            url: "exercise_library.jsp",
                            data: "action=del_question&id=" + id + "",
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
    //detlet answer
    function del_answer(id) {
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
                            url: "exercise_library.jsp",
                            data: "action=del_answer&id=" + id + "",
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
</html>