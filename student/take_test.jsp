<%@ page import="com.baje.sz.util.Doc" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.baje.sz.util.Selectic" %>
<%@ page import="com.battsister.student.ExaminationApi" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="utils.UtilsTime" %>
<%@ page import="java.util.List" %>
<%@ page import="com.battsister.util.BasicType" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);

    Selectic selectic = new Selectic();
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    if ("saveTime".equals(action)) {
        out.print(new ExaminationApi().saveTime(request));
        return;
    }
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
        if (1 == answerDoc.getIn("is_commit")) {
            out.print("<script>alert('该试题已考试');window.history.back(-1);</script>");
            return;
        }
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
         <script type="text/javascript"
            src="/manage/js/artDialog4.1.6/artDialog.js?skin=blue"></script>
<script type="text/javascript" src="/manage/js//artDialog4.1.6/plugins/iframeTools.source.js"></script>
</head>

<body>
<!--=== Header ===-->
<jsp:include page="header.jsp">
    <jsp:param value="3" name="type"/>
</jsp:include>
<!--=== End Header ===-->

<div class="container">
    <div class="info">
        <a href="student_home.jsp">首页</a><em>></em><a href="test_history.jsp">考试记录</a><em>></em><a href="take_test.jsp?examinationId=<%=examinationId%>">参加考试</a>
    </div>
</div>


<div class="container" id="questionList">
    <div class="ex_wrap">
        <div class="title_test"><%=examDoc.get("name")%>
            <div class="time_s"><%--examDoc.getIn("limit_time")--%>
                <i>考试时长：<%=examDoc.getIn("limit_time") / 60%>分钟</i>
                剩余时间<span id="limit_time"><%=UtilsTime.secToTime(examDoc.getIn("limit_time") - timeUse)%></span>
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
            <div class="test_title">共<%=examList.size()%>题<em>已完成了<span id="questionNum"><%=questionNum%></span>题</em></div>
            <%

                int i = 0;
                int j = 0;
                int type = 0;
                String isWrong = "";
                String isRight = "";
                JSONArray examOptionArray;
                JSONObject optionObj;
                JSONArray optionArray;
                String completeExamStr = "";
                String uncompleteExamStr = "";
                for (Doc doc : examList) {
                    i++;
                    type = doc.getIn("type");
                    int id = doc.getIn("id");
                    String u_style = "";
                    String c_style = "style=\"display:block;\"";
                    if (answerObj.isEmpty()) {
                        u_style = "style=\"display:none;\"";
                    } else {
                        if (answerObj.get(String.valueOf(id)) == null) {
                            u_style = "style=\"display:none;\"";
                        } else {
                            c_style = "style=\"display:none;\"";
                        }
                    }

                    completeExamStr += "<dd id=\"complete_"+id+"\" "+u_style+"><a onclick=\"forwardToExam(this,"+id+");\">"+i+"</a></dd>";
                    uncompleteExamStr += "<dd id=\"uncomplete_"+id+"\" "+c_style+" uncomplete><a onclick=\"forwardToExam(this,"+id+");\">"+i+"</a></dd>";
            %>
            <div class="_examList" id="exam_<%=id%>" <%=1 != i ? "style=\"display:none;\"" : ""%> selecter>
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
                                    optionObj = JSONObject.fromObject(o);

                                    String seleced = "";
                                    if (!answerObj.isEmpty()) {
                                        if (answerObj.get(String.valueOf(id)) != null) {
                                            optionArray = JSONArray.fromObject(answerObj.get(String.valueOf(id)));
                                            if (optionArray.contains(optionObj.getString("id"))) {
                                                seleced = "checked";
                                            }
                                        }
                                    }
                                    out.print("<li><input name=\"question_" + id + "\" type=\"" + (1 == type ? "checkbox" : "radio") + "\" value=\"" + optionObj.get("id") + "\"  class=\"input_radio\" " + seleced + ">" + BasicType.getOption(j) + "、" + optionObj.get("name") + "</li>");
                                    j++;
                                }
                            }
                        } else {
                            isWrong = "";
                            isRight = "";
                            if (!answerObj.isEmpty()) {
                                if (answerObj.get(String.valueOf(id)) != null) {
                                    optionArray = JSONArray.fromObject(answerObj.get(String.valueOf(id)));
                                    if (optionArray.contains("0")) {
                                        isWrong = "checked";
                                    }
                                    if (optionArray.contains("1")) {
                                        isRight = "checked";
                                    }
                                }
                            }

                    %>
                    <li><input name="question_<%=id%>" type="radio" value="0" <%=isWrong%>
                               class="input_radio">A、错误
                    </li>
                    <li><input name="question_<%=id%>" type="radio" value="1" <%=isRight%>
                               class="input_radio">B、正确
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
                            onclick="nextExam('<%=id%>', '<%=examList.get(i - 2).getIn("id")%>', '<%=type%>', 'back')">上一题</a>
                    </div>
                    <div class="test_botton2"><a
                            onclick="examCommit('<%=id%>', '<%=type%>', 'next');">交卷</a></div>
                    <div class="clear"></div>
                    <%
                    } else if (0 == (i - 1)) {
                    %>
                    <%--<div class="test_botton1"><a>没有了</a></div>--%>
                    <div class="test_botton"><a
                            onclick="nextExam('<%=id%>', '<%=examList.get(i).getIn("id")%>', '<%=type%>', 'next')">下一题</a>
                    </div>
                    <div class="clear"></div>
                    <%
                    } else {
                    %>
                    <div class="test_botton"><a
                            onclick="nextExam('<%=id%>', '<%=examList.get(i-2).getIn("id")%>', '<%=type%>', 'back')">上一题</a>
                    </div>
                    <div class="test_botton"><a
                            onclick="nextExam('<%=id%>', '<%=examList.get(i).getIn("id")%>', '<%=type%>', 'next')">下一题</a>
                    </div>
                    <div class="clear"></div>
                    <%
                        }
                    %>
                </div>
            </div>
            <%
                    }
                    %>
            <div class="test_c">
                <dl>
                    <dt>还未完成的试题</dt>
                    <%=uncompleteExamStr%>
                    <div class="clear" id="uncompleteExamStr"></div>
                </dl>
            </div>
            <div class="test_c">
                <dl>
                    <dt>已经完成的试题</dt>
                    <%=completeExamStr%>
                    <div class="clear" id="completeExamStr"></div>
                </dl>
            </div>
            <%
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
    //倒计时
    var c = (parseInt($('#h').html()) * 60 * 60) + (parseInt($('#m').html()) * 60) + parseInt($('#s').html());
    var s = 0; //此次答题所用时长
    var timeUse = <%=timeUse%>; //已用时长
    var a = 0; //总用时长
    var sId = setInterval(function () {
        c --;
        s ++;
        $('#limit_time').html(secondToString(c));
        if (0 == c || -1 == c) {
            stopInterval(sId);
            //alert('time out');
            commitExam();
        }
        a = s + timeUse;
    }, 1000);
    //三秒更新一次考试时间
    var tId = setInterval(function () {
        saveTime(a);
        if (c == 0) {
            clearInterval(tId);
        }
    }, 3000);

    function secondToString(time) {
        var hour = 0;
        var minute = 0;
        var second = 0;
        if (time <= 0)
            return "<em id=\"h\">" + zero(hour) + "</em>:<em id=\"m\">" + zero(minute) + "</em>:<em id=\"s\">" + zero(second) + "</em>";
        else {
            minute = time / 60;
            if (minute < 60) {
                second = time % 60;
            } else {
                hour = minute / 60;
                if (hour > 99)
                    return "99:59:59";
                minute = minute % 60;
                second = time - hour * 3600 - minute * 60;
            }
        }
        return "<em id=\"h\">" + zero(hour) + "</em>:<em id=\"m\">" + zero(minute) + "</em>:<em id=\"s\">" + zero(second) + "</em>";
    }

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

    function saveTime(s) {
        $.post('?', 'action=saveTime&time_use=' + s + '&examinationId=<%=examinationId%>', function (data) {

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
            $.post('?', 'action=answerCommit&qid=' + obj + '&aid=' + aid + '&type=' + type + '&examinationId=<%=examinationId%>', function (data) {
                if (!data.type) {
                    if (data.errorCode == -1) {
                        window.location.href = '/login.jsp';
                    }
                    return false;
                } else {
                    $('#questionNum').html(data.questionNum);
                    $('#complete_' + obj).show();
                    $('#uncomplete_' + obj).hide();
                }
            }, 'json');
        }
        return true;
    }

    function examCommit(obj, type, opt) {
        if (answerCommit(obj, type, opt)) {
            var re = false;
            $('*[uncomplete]').each(function () {
                if ($(this).attr('style') == 'display:block;') {
                    re = true;
                }
            });

            if (re) {
            	art.dialog.alert('您还有未答题的');
                return false;
            }
            $('#questionList').hide();
            $('#tips').show();
        }
    }

    function commitExam() {
        $.post('?', 'action=commitExam&examinationId=<%=examinationId%>&time_use=' + a, function (data) {
            if (!data.type) {
            	art.dialog.alert(data.msg);
                if (data.errorCode == -1) {
                    window.location.href = '/login.jsp';
                }
            } else {
                window.location.href = 'test_history_details.jsp?examinationId=<%=examinationId%>';
            }
        }, 'json');
    }
    function forwardToExam(obj,id) {
        $('*[selecter]').each(function () {
            $(this).attr('style', 'display:none');
        });
        $('#exam_'+ id).show();
    }
</script>

</body>
</html>
