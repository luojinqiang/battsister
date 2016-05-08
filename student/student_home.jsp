<%@ page import="com.baje.sz.ajax.AjaxXml" %>
<%@ page import="com.baje.sz.util.Doc" %>
<%@ page import="com.baje.sz.util.Selectic" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>学生首页</title>
    <meta name="keywords" content="#"/>
    <meta name="description" content="#"/>
    <link href="../front_style/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
<!--=== Header ===-->
<jsp:include page="header.jsp">
    <jsp:param value="1" name="type"/>
</jsp:include>

<!--=== End Header ===-->

<div class="container">
    <div class="left_side">
        <div class="side_user">
            <div class="side_user_img"><img src="../front_style/images/user.jpg"></div>
            <div class="side_user_word">
                <h4>晚上好，<%=student_name%>
                </h4>
                <p>上次登录时间<br><%=last_login_time%>
                </p>
            </div>
            <div class="clear"></div>
        </div>
        <div class="side_tongdao">
            <div class="tongdao_t">快速通道</div>
            <div class="tongdao_ul">
                <div class="tongdao_li1"><a href="test_history.jsp">参加考试</a></div>
                <div class="tongdao_li2"><a href="ask_question.jsp">快速提问</a></div>
            </div>
        </div>
    </div>
    <div class="stu_w">
        <div class="stu_wrap">
            <div class="title_d">未参加的考试</div>
            <%
                Selectic selectic = new Selectic();
                List<Doc> list = selectic.Get_List("id,name,limit_time,question_num", " bs_examination ", "where isdel=0 and end_time > ? and teacher_id in(select teacher_id from bs_students where id=? and isdel=0) and class_id in(select class_id from bs_students where id=? and isdel=0) and id not in (select examination_id from bs_examination_answer where student_id=?)", "mysqlss", new Object[]{AjaxXml.getTimestamp("now"), student_id,student_id, student_id});
                if (list != null && !list.isEmpty()) {
                    Doc examDoc;
                    for (Doc doc : list) {
            %>
            <div class="kaoshi1">
                <div class="kaoshi_left">
                    <h3><%=doc.get("name")%>
                    </h3>
                    <div><em>考试时长：<%=doc.getIn("limit_time") / 60%>
                        分钟</em><em>参考人员：全体学员</em><em>题目数量：<%=doc.getIn("question_num")%>
                    </em></div>
                </div>
                <%

                    examDoc = selectic.Get_Doc("is_commit", "bs_examination_answer", "where examination_id=? and student_id=?", "mysqlss", new Object[]{doc.getIn("id"), student_id});
                    if (examDoc == null || examDoc.isEmpty()) {
                %>
                <div class="kaoshi_right"><a href="take_test.jsp?examinationId=<%=doc.getIn("id")%>">马上考试</a></div>
                <%
                    }
                %>
                <div class="clear"></div>
            </div>
            <%
                    }
                }
            %>

            <div class="stu_wrap">
                <div class="title_d">已参加的考试<a href="test_history2.jsp">更多>></a></div>
                <%
                    list = selectic.Get_List("be.id as be_id,be.name,be.limit_time,be.question_num,ba.is_commit,be.end_time,ba.time_use "," bs_examination be right join bs_examination_answer ba on be.id=ba.examination_id", "where be.isdel=0 and ba.student_id=?", "mysqlss", new Object[]{student_id});
                    if (list != null && !list.isEmpty()) {
                        for (Doc doc : list) {
                %>

                <a href="test_history_details.jsp?examinationId=<%=doc.getIn("be_id")%>">
                    <div class="kaoshi1">
                        <div class="kaoshi_left">
                            <h3><%=doc.get("name")%></h3>
                            <div><em>考试时长：<%=doc.getIn("limit_time")/60%>分钟</em><em>参考人员：全体学员</em></div>
                        </div>
                        <%--<div class="kaoshi_right"><a href="take_test.jsp?examinationId=<%=doc.getIn("be_id")%>">马上考试</a></div>--%>
                        <div class="clear"></div>
                    </div>
                </a>
                <%
                        }
                    }
                %>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
