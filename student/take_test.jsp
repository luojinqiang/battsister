<%@ page import="com.baje.sz.util.Doc" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.baje.sz.util.Selectic" %>
<%@ page import="com.battsister.student.ExaminationApi" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="utils.UtilsTime" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);

    Selectic selectic = new Selectic();
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    if ("answerCommit".equals(action)) {
        out.print(new ExaminationApi().answerExam(request));
        return;
    }
    if ("commitExam".equals(action)) {
        out.print(new ExaminationApi().commitExam(request));
        return;
    }
    String examinationId = ru.getString("examinationId");
    if ("getExamList".equals(action)) {
        out.print(selectic.getJsonArray("select examination_id,name,name_pic,type,option_array,answer,order_num,thoughts from bs_exercise_exam where examination_id=? and isdel=0", "mysqlss", new Object[]{examinationId}));
        return;
    }
    Doc examDoc = selectic.Get_Doc("name,limit_time,question_num,end_time", "bs_examination", "where id=?", "mysqlss", new Object[]{examinationId});
    if (examDoc == null || examDoc.isEmpty()) {
        out.print("<script>alert('试题不存在');window.history.back(-1);</script>");
        return;
    }
    int questionNum = 0;
    int timeUse = 0;
    JSONObject answerObj = new JSONObject();
    Doc answerDoc = selectic.Get_Doc("answer,time_use,is_commit", "bs_examination_answer", "where student_id=? and examination_id=? and isdel=0", "mysqlss", new Object[]{student_id, examinationId});
    if (answerDoc != null && !answerDoc.isEmpty()) {
        timeUse = answerDoc.getIn("time_use");
        if (!"".equals(answerDoc.get("answer"))) {
            answerObj = JSONObject.fromObject(answerDoc.get("answer"));
        }
        questionNum = answerObj.size();
    }
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>参加考试</title>
    <meta name="keywords" content="#"/>
    <meta name="description" content="#"/>
    <link href="../front_style/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../front_style/js/jquery.min.js"></script>
</head>

<body>
<!--=== Header ===-->
<jsp:include page="header.jsp">
    <jsp:param value="3" name="type"/>
</jsp:include>
<!--=== End Header ===-->

<div class="container">
    <div class="info">
        <a href="student_home.jsp">首页</a><em>></em><a href="test_history.jsp">考试记录</a><em>></em><a href="take_test.jsp">参加考试</a>
    </div>
</div>


<div class="container" id="questionList">
    <div class="ex_wrap">
        <div class="title_test"><%=examDoc.get("name")%>
            <div class="time_s">
                <i>考试时长：<%=examDoc.getIn("limit_time") / 60%>分钟</i>
                剩余时间<%=UtilsTime.secToTime(examDoc.getIn("limit_time") - timeUse)%>
            </div>
        </div>
        <%--<div class="ex_one bg_grey">
            <p>考试内容：ui设计基础——APP质感图标绘制技巧。驾驶机动车辆在道路上违反道路交通规则安全法的行为，属于什么行为？驾驶机动车辆在道路上违反道路交通规则安全法的行为，属于什么行为？</p>
			<p>题型：单选题、多选题（单选题多少，多选题多少）</p>
			<p>总分数：100分</p>
        </div>--%>
        <div class="ex_one bb_none">
            <%
                List<Doc> examList = selectic.Get_List("id,examination_id,name,name_pic,type,option_array,answer,order_num,thoughts ", " bs_exercise_exam", " where examination_id=? and isdel=0 order by type asc", "mysqlss", new Object[]{examinationId});
                if (examList != null && !examList.isEmpty()) {
            %>
            <div class="test_title">共<%=examList.size()%>题<em>已完成了<span id="questionNum"><%=questionNum%></span>题</em>
            </div>
            <%

                int i = 0;
                int j = 0;
                int type = 0;
                String isWrong = "";
                String isRight = "";
                JSONArray examOptionArray;
                JSONObject optionObj;
                JSONArray optionArray;
                for (Doc doc : examList) {
                    i++;
                    type = doc.getIn("type");
            %>
            <div id="exam_<%=doc.getIn("id")%>" <%=1 != i ? "style=\"display:none;\"" : ""%>>
                <div class="ex_one_title">
                    <em><%=type == 1 ? "多选" : type == 2 ? "判断题" : "单选"%>
                    </em>
                    <span><%=i + "/" + examList.size()%></span>
                    <span><%=doc.get("name")%></span>
                </div>
                <ul>
                    <%
                        if (type != 2) {
                            examOptionArray = JSONArray.fromObject(doc.get("option_array"));
                            if (!examOptionArray.isEmpty()) {
                                j = 0;
                                for (Object o : examOptionArray) {
                                    j++;
                                    optionObj = JSONObject.fromObject(o);

                                    String seleced = "";
                                    if (!answerObj.isEmpty()) {
                                        if (answerObj.get(String.valueOf(doc.getIn("id"))) != null) {
                                            optionArray = JSONArray.fromObject(answerObj.get(String.valueOf(doc.getIn("id"))));
                                            if (optionArray.contains(optionObj.getString("id"))) {
                                                seleced = "checked";
                                            }
                                        }
                                    }
                                    out.print("<li><input name=\"question_" + doc.getIn("id") + "\" type=\"" + (1 == type ? "checkbox" : "radio") + "\" value=\"" + optionObj.get("id") + "\"  class=\"input_radio\" " + seleced + ">" + j + "、" + optionObj.get("name") + "</li>");
                                }
                            }
                        } else {
                            isWrong = "";
                            isRight = "";
                            if (!answerObj.isEmpty()) {
                                if (answerObj.get(String.valueOf(doc.getIn("id"))) != null) {
                                    optionArray = JSONArray.fromObject(answerObj.get(String.valueOf(doc.getIn("id"))));
                                    if (optionArray.contains("0")) {
                                        isWrong = "checked";
                                    }
                                    if (optionArray.contains("1")) {
                                        isRight = "checked";
                                    }
                                }
                            }

                    %>
                    <li><input name="question_<%=doc.getIn("id")%>" type="radio" value="0" <%=isWrong%>
                               class="input_radio">1、错误
                    </li>
                    <li><input name="question_<%=doc.getIn("id")%>" type="radio" value="1" <%=isRight%>
                               class="input_radio">2、正确
                    </li>
                    <%
                        }
                    %>
                </ul>
                <div class="test_b">
                    <%
                        if (i == examList.size()) {
                    %>
                    <div class="test_botton"><a
                            onclick="nextExam('<%=doc.getIn("id")%>', '<%=examList.get(i - 2).getIn("id")%>', '<%=type%>', 'back')">上一题</a>
                    </div>
                    <div class="test_botton2"><a
                            onclick="examCommit('<%=doc.getIn("id")%>', '<%=type%>', 'next');">交卷</a></div>
                    <div class="clear"></div>
                    <%
                    } else if (0 == (i - 1)) {
                    %>
                    <%--<div class="test_botton1"><a>没有了</a></div>--%>
                    <div class="test_botton"><a
                            onclick="nextExam('<%=doc.getIn("id")%>', '<%=examList.get(i).getIn("id")%>', '<%=type%>', 'next')">下一题</a>
                    </div>
                    <div class="clear"></div>
                    <%
                    } else {
                    %>
                    <div class="test_botton"><a
                            onclick="nextExam('<%=doc.getIn("id")%>', '<%=examList.get(i-2).getIn("id")%>', '<%=type%>', 'back')">上一题</a>
                    </div>
                    <div class="test_botton"><a
                            onclick="nextExam('<%=doc.getIn("id")%>', '<%=examList.get(i).getIn("id")%>', '<%=type%>', 'next')">下一题</a>
                    </div>
                    <div class="clear"></div>
                    <%
                        }
                    %>
                </div>
            </div>
            <%
                    }
                }
            %>

        </div>
    </div>
</div>
<div class="container" id="tips" style="display: none;">
    <div class="ex_wrap">
        <div class="default_test">
            <div class="default_test_img"><img src="../front_style/images/iconfont02.png"></div>
            <p>试题已经全部回答完毕，如果您已确定，是否提前交卷?</p>
            <div class="default_botton"><a href="javascript:commitExam();">提前交卷</a></div>
        </div>
    </div>
</div>

<script src="../manage/js/sys.js"></script>
<script type="text/javascript">
    /*window.onbeforeunload = function(event) {
        event = event || window.event;
        event.returnValue = '';
    }*/
    var time = parseInt($('#m').html());
    var s = 60;
    var c = 0;
    var sId = setInterval(function () {
        if (c == time * 60) {
            commitExam();
        } else {
            s--;
            if (-1 == s) {
                s = 59;
            }
            $('#s').html(zero(s));
            if (c % 60 == 0 || c == 0) {
                $('#m').html(zero(parseInt($('#m').html(), 10) - 1));
            }
            c++;
        }
    }, 1000);
    function stopInterval() {
        clearInterval(sId);
    }
    function zero(n) {
        var p = parseInt(n, 10);
        if (p > 0) {
            if (p <= 9) {
                p = "0" + p;
            }
            return String(p);
        } else {
            return "00";
        }
    }
    var examArray = [];
    function getExamList() {
        $.post('?', 'action=getExamList', function (data) {
            examArray = data;
            if (examArray.length > 0) {
                for (var i = 0; i < examArray.length; i++) {

                }
            }
        }, 'json');
    }
    function nextExam(obj, qid, type, opt) {
        if (answerCommit(obj, type, opt)) {
            $('#exam_' + obj).hide();
            $('#exam_' + qid).show();
        }
    }

    function answerCommit(obj, type, opt) {
        if (opt == 'next') {
            var aid = '';
            if (type == 1) {
                aid = getcheckbox('question_' + obj + '');
            } else {
                aid = $('input[name=question_' + obj + '][type=radio]:checked').val();
            }
            if (aid == undefined) {
                aid = '';
            }
            $.post('?', 'action=answerCommit&qid=' + obj + '&aid=' + aid + '&type=' + type + '&examinationId=<%=examinationId%>&time_use=' + c, function (data) {
                if (!data.type) {
                    alert(data.msg);
                    if (data.errorCode == -1) {
                        window.location.href = '/login.jsp';
                    }
                    return false;
                } else {
                    $('#questionNum').html(data.questionNum);
                }
            }, 'json');
        }
        return true;
    }
    function examCommit(obj, type, opt) {
        if (answerCommit(obj, type, opt)) {
            $('#questionList').hide();
            $('#tips').show();
        }
    }
    function commitExam() {
        $.post('?', 'action=commitExam&examinationId=<%=examinationId%>&time_use=' + c, function (data) {
            if (!data.type) {
                alert(data.msg);
                if (data.errorCode == -1) {
                    window.location.href = '/login.jsp';
                }
            } else {
                window.location.href = 'test_history_details.jsp?examinationId=<%=examinationId%>';
            }
        }, 'json');
    }
</script>

</body>
</html>
