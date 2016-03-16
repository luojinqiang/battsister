<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.baje.sz.util.Doc" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.battsister.model.ExerciseLibrary" %>
<%@ page import="com.battsister.model.ExerciseOption" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="com.battsister.util.BasicType" %>
<%@ include file="../ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    RequestUtil ru = new RequestUtil(request);
    if (current_flags.indexOf(",2001,") < 0) {
        response.sendRedirect("../error.jsp?left=yonghu");
        return;
    }
    ExerciseLibrary el = new ExerciseLibrary();
    ExerciseOption eo = new ExerciseOption();
    String action = ru.getString("action");
    if (action.equals("del_question")) {
        out.print(BasicType.delBasic(request, user_id, user_name, el.getTableName(), "删除习题"));
        return;
    }
    if (action.equals("del_answer")) {
        out.print(BasicType.delBasic(request, user_id, user_name, eo.getTableName(), "删除习题选项"));
        return;
    }
    if (action.equals("question_edit")) {
        out.print(el.edit(request, user_id, user_name));
        return;
    }
    if (action.equals("answer")) {
        return;
    }
    String chapter_name = "";
    String course_name = "";
    int course_id = ru.getInt("course_id");
    int chapter_id = ru.getInt("chapter_id");
    if (course_id > 0) {
        Doc doc = utildb.Get_Doc("c.name as chapter_name,s.name as course_name", "bs_chapter c left join bs_course s on c.course_id=s.id", "where c.id=? and c.isdel=0 and s.isdel=0 limit 1", "", new Object[]{new Integer(chapter_id)});
        if (doc != null) {
            course_name = doc.get("course_name");
            chapter_name = doc.get("chapter_name");
        }
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

<div id="iframe_page">
    <div class="iframe_content">
        <link href='/public/css/member/survey.css' rel='stylesheet' type='text/css'/>
        <script type='text/javascript' src='/public/js/survey.js'></script>
        <link href='/public/js/lean-modal/style.css' rel='stylesheet' type='text/css'/>
        <link href='/public/js/operamasks/operamasks-ui.css' rel='stylesheet' type='text/css'/>
        <script type='text/javascript' src='/public/js/operamasks/operamasks-ui.min.js'></script>
        <script type='text/javascript' src='/public/js/lean-modal/lean-modal.min.js'></script>
        <script type="text/javascript" src="../js/artDialog4.1.6/artDialog.js?skin=green"></script>
        <script type="text/javascript" src="../js/artDialog4.1.6/plugins/iframeTools.source.js"></script>
        <script language="javascript" src='../js/sys.js'></script>
        <div id="survey_list" class="r_con_wrap">
            <div class="control_btn">
                <a href="#add_topic" class="btn_green btn_w_120" onclick="exercise_add('0', '添加习题');">添加习题</a>
            </div>
            <div class="tips">
                <strong>所属课程：</strong><%=course_name %>-><%=chapter_name%>
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
                Doc whereDoc = new Doc();
                whereDoc.put("course_id", course_id);
                whereDoc.put("chapter_id", chapter_id);
                whereDoc.put("isdel", 0);
                whereDoc.put("@order", "order_num asc");
                //counts = el.queryCountByWhere(whereDoc);

                JSONArray questionList = el.queryPageByWhere(pages, pn, whereDoc);
                if (questionList != null) {
                    JSONObject doc;
                    JSONArray answerList;
                    Doc answerWhereDoc;
                    JSONObject answerDoc;
                    for (Object o : questionList) {
                        doc = JSONObject.fromObject(o);
                        question = doc.getString("name");
                        question_pic = doc.getString("name_pic");
                        qid = doc.getInt("id");
                        i++;
            %>
            <div class="topic">
                <div class="title">
                    <strong><%=i %>、</strong><%=question %>
                    <span class="fc_red">
                        <%
                            if (!question_pic.equals("")) {
                                out.print("【图】");
                            }
                            if (doc.getInt("type") == 1) {
                                out.print("多选题");
                            } else {

                                out.print("单选题");
                            }
                        %>
                    </span>
                    <a href="javascript:exercise_option_add('0', '添加选项', '<%=qid%>', '<%=question%>', '<%=doc.getInt("type")%>')" title="添加选项">
                        <img src="/public/images/add.gif" align="absmiddle"/>
                    </a>
                    <a href="javascript:exercise_add('<%=qid%>', '修改习题');" title="修改习题">
                        <img src="/public/images/mod.gif" align="absmiddle"/>
                    </a>
                    <a onclick="del_question(<%=qid %>);">
                        <img src="/public/images/del.gif" align="absmiddle"/>
                    </a>
                </div>
                <div class="answer">
                    <%

                        answerWhereDoc = new Doc();
                        answerWhereDoc.put("exercise_library_id", doc.get("id"));
                        answerWhereDoc.put("isdel", 0);
                        answerWhereDoc.put("@order", "order_num asc");
                        answerList = eo.queryArrayByWhere(answerWhereDoc);
                        j = 0;
                        if (!answerList.isEmpty()) {
                            for (Object aObj : answerList ) {
                                answerDoc = JSONObject.fromObject(aObj);
                                aid = answerDoc.getInt("id");
                                answer = answerDoc.getString("name");
                                answer_pic = answerDoc.getString("pic");
                                j++;
                    %>

                    <div class="list" >
                        <div class="t">
                            <%=j %>、<%=answer %>
                            <span class="fc_red">
                                <%
                                    if (!answer_pic.equals("")) {
                                        out.print("【图】");
                                    }
                                    if (answerDoc.getInt("is_answer") == 1) {
                                        out.print("【√】");
                                    }
                                %>
                            </span>
                        </div>
                        <div class="opt">
                            <a href="javascript:exercise_option_add('<%=aid%>', '修改问题选项', '<%=qid%>', '<%=question%>', '<%=doc.getInt("type")%>')">
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
    </div>
    <!--end id="iframe_page"-->
</div>
</body>

<script>$(document).ready(survey_obj.survey_set_init());</script>
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
                            dataType: "json",
                            type: "post",
                            url: "exercise_library.jsp",
                            data: "action=del_question&id=" + id + "",
                            success: function (msg) {
                                art.dialog({id: 'tisID'}).close();
                                if (msg.type) {
                                    window.location.reload();
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
                            dataType: "json",
                            type: "post",
                            url: "exercise_library.jsp",
                            data: "action=del_answer&id=" + id + "",
                            success: function (msg) {
                                art.dialog({id: 'tisID'}).close();
                                if (msg.type) {
                                    window.location.reload();
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
    function exercise_add(id, title) {
        openurl('exercise_add.jsp?id=' + id + '&course_id=<%=course_id%>&chapter_id=<%=chapter_id%>' , 'user', title, 700, 380, 0, 10, true);
    }
    function exercise_option_add(id, title, qid, qName, type) {
        openurl('exercise_option_add.jsp?id=' + id + '&course_id=<%=course_id%>&chapter_id=<%=chapter_id%>&elId=' + qid + '&qName=' + qName + '&type=' + type, 'user', title, 700, 380, 0, 10, true);
    }
</script>
</html>