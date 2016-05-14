<%@ page import="com.baje.sz.ajax.AjaxXml" %>
<%@ page import="com.baje.sz.util.Doc" %>
<%@ page import="com.baje.sz.util.Selectic" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="sys.jsp"%>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>考试记录</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="../front_style/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../front_style/js/jquery.min.js"></script>
<script src="../front_style/js/showList.js" type="text/javascript"></script>
</head>

<body>
<!--=== Header ===-->
<jsp:include page="header.jsp">
    <jsp:param value="3" name="type"/>
</jsp:include>
<!--=== End Header ===-->

<div class="container">
  <div class="left_nav">
      <div class="operate">
        <ul id="juheweb">
        <h3>考试记录</h3>
          <li>
            <h5><a href="test_history.jsp">未参加的考试</a></h5>
          </li>
          <li >
            <h5 class="selected"><a href="test_history2.jsp">已参加的考试</a></h5>
          </li>
        </ul>
      </div>
  </div>
  <div class="stu_w">
  	 <div class="stu_wrap">
     	<div class="title_d">已参加的考试</div>
         <%
             Selectic selectic = new Selectic();
             List<Doc> list = selectic.Get_List("be.id as be_id,be.name,be.limit_time,be.question_num,ba.is_commit,be.end_time,ba.time_use "," bs_examination be right join bs_examination_answer ba on be.id=ba.examination_id", "where be.isdel=0 and ba.student_id=? order by be.id desc", "mysqlss", new Object[]{student_id});
             if (list != null && !list.isEmpty()) {
                 for (Doc doc : list) {
                     String s = "";
                     String h;
                     if (0 == doc.getIn("is_commit") && (doc.getIn("end_time") > AjaxXml.getTimestamp("now")) && (doc.getIn("time_use") <= doc.getIn("limit_time"))) {
                         s = "<div class=\"kaoshi_right\"><a href=\"take_test.jsp?examinationId="+doc.getIn("be_id")+"\">继续考试</a></div>";
                         h = doc.get("name");
                     } else {
                         h = "<a href=\"test_history_details.jsp?examinationId="+doc.getIn("be_id")+"\">"+doc.get("name")+"</a>";
                     }

         %>
         <div class="kaoshi1">
             <div class="kaoshi_left">
                 <h3><%=h%></h3>
                 <div><em>考试时长：<%=doc.getIn("limit_time")/60%>分钟</em><em>参考人员：全体学员</em><em>题目数量：<%=doc.get("question_num")%></em></div>
             </div>
             <%
                 out.print(s);
             %>
             <div class="clear"></div>
         </div>
         <%
                 }
             }
         %>
     </div>
  </div>
  <div class="clear"></div>
</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
