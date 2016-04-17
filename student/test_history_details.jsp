<%@ page import="com.baje.sz.util.Doc" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.baje.sz.util.Selectic" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);

    Selectic selectic = new Selectic();
    RequestUtil ru = new RequestUtil(request);
    String examinationId = ru.getString("examinationId");
    Doc examDoc = selectic.Get_Doc("name,limit_time,question_num,end_time", "bs_examination", "where id=?", "mysqlss", new Object[]{examinationId});
    if (examDoc == null || examDoc.isEmpty()) {
        out.print("<script>alert('试题不存在');window.history.back(-1);</script>");
        return;
    }
    JSONObject answerObj = new JSONObject();
    int is_right = 0;
    int is_wrong = 0;
    Doc answerDoc = selectic.Get_Doc("answer,time_use,is_commit,is_wrong,is_right", "bs_examination_answer", "where student_id=? and examination_id=? and isdel=0", "mysqlss", new Object[]{student_id, examinationId});
    if (answerDoc != null && !answerDoc.isEmpty()) {
        is_wrong = answerDoc.getIn("is_wrong");
        is_right = answerDoc.getIn("is_right");
        if (!"".equals(answerDoc.get("answer"))) {
            answerObj = JSONObject.fromObject(answerDoc.get("answer"));
        }
        if (1 != answerDoc.getIn("is_commit")) {
            out.print("<script>alert('该试题还未考试');window.history.back(-1);</script>");
            return;
        }
    } else {
        out.print("<script>alert('该试题还未考试');window.history.back(-1);</script>");
        return;
    }
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>考试记录</title>
    <meta name="keywords" content="#"/>
    <meta name="description" content="#"/>
    <link href="../front_style/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        //=点击展开关闭效果=
        function open_zzjs_net(oSourceObj, oTargetObj, shutAble, oOpenTip, oShutTip) {
            var sourceObj = typeof oSourceObj == "string" ? document.getElementById(oSourceObj) : oSourceObj;
            var targetObj = typeof oTargetObj == "string" ? document.getElementById(oTargetObj) : oTargetObj;
            var openTip = oOpenTip || "";
            var shutTip = oShutTip || "";
            if (targetObj.style.display != "none") {
                if (shutAble) return;
                targetObj.style.display = "none";
                if (openTip && shutTip) {
                    sourceObj.innerHTML = shutTip;
                }
            } else {
                targetObj.style.display = "block";
                if (openTip && shutTip) {
                    sourceObj.innerHTML = openTip;
                }
            }
        }
    </script>

</head>

<body>
<!--=== Header ===-->
<jsp:include page="header.jsp">
    <jsp:param value="3" name="type"/>
</jsp:include>
<!--=== End Header ===-->

<div class="container">
    <div class="info">
        <a href="student_home.html">首页</a><em>></em><a href="test_history.jsp">考试记录</a><em>></em><a
            href="test_history_details.jsp?examinationId=<%=examinationId%>">考试详情</a>
    </div>
</div>

<div class="container">
    <div class="ex_wrap">
        <div class="title_r"><%=examDoc.get("name")%><i>考试时长：<%=examDoc.getIn("limit_time") / 60%>分钟</i><i></i>
            <div class="stu_score">正确数<%=is_right%>/<%=is_right+is_wrong%></div>
        </div>
        <%
            List<Doc> examList = selectic.Get_List("id,examination_id,name,name_pic,type,option_array,answer,order_num,thoughts ", " bs_exercise_exam", " where examination_id=? and isdel=0 order by type asc", "mysqlss", new Object[]{examinationId});

            if (examList != null && !examList.isEmpty()) {
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
                String answerString = "";
        %>
        <div class="ex_one">
            <div class="ex_one_title">
                <em><%=type == 1 ? "多选" : type == 2 ? "判断题" : "单选"%>
                </em>
                <span><%=i + "/" + examList.size()%></span>
                <%=doc.get("name")%>
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
                                if ("1".equals(optionObj.getString("is_answer"))) {
                                    if ("".equals(answerString)) {
                                        answerString = "" + j;
                                    } else {
                                        answerString += "," + j;
                                    }
                                }
                                String seleced = "";
                                if (!answerObj.isEmpty()) {
                                    if (answerObj.get(String.valueOf(doc.getIn("id"))) != null) {
                                        optionArray = JSONArray.fromObject(answerObj.get(String.valueOf(doc.getIn("id"))));
                                        if (optionArray.contains(optionObj.getString("id"))) {
                                            seleced = "checked";
                                        }
                                    }
                                }
                                out.print("<li><input name=\"question_" + doc.getIn("id") + "\" type=\"" + (1 == type ? "checkbox" : "radio") + "\" value=\"" + optionObj.get("id") + "\"  class=\"input_radio\" " + seleced + "><div class=\"da_an\"><p>" + j + "、" + optionObj.get("name") + "</p></div><div class=\"clear\"></div></li>");
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
                        if (1 == doc.getIn("answer")) {
                            answerString = "2";
                        } else {
                            answerString = "1";
                        }
                %>
                <li><input name="question_<%=doc.getIn("id")%>" type="radio" value="0" <%=isWrong%>
                           class="input_radio">
                    <div class="da_an"><p>1、错误</p></div>
                    <div class="clear"></div>
                </li>
                <li><input name="question_<%=doc.getIn("id")%>" type="radio" value="1" <%=isRight%>
                           class="input_radio">
                    <div class="da_an"><p>2、正确</p></div>
                    <div class="clear"></div>
                </li>
                <%
                    }
                %>
            </ul>
            <div class="ex_botton"><a onclick="open_zzjs_net(this,'zzjs_net<%=i%>')">本题答案以及解释</a></div>
            <div id="zzjs_net<%=i%>" class="zzjs_net" style="display:none">
                本题正确答案<%=answerString%>。<%=doc.getString("thoughts")%>
            </div>
        </div>

        <%
                }
            }

        %>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
