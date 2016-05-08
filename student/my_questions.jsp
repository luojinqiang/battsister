<%@ page import="com.baje.sz.ajax.AjaxXml" %>
<%@ page import="com.baje.sz.util.Doc" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.baje.sz.util.Selectic" %>
<%@ page import="com.battsister.student.QuestionApi" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    RequestUtil ru = new RequestUtil(request);
    Selectic selectic = new Selectic();
    String action = ru.getString("action");
    if ("save".equals(action)) {
        out.print(new QuestionApi().replyQuestion(request));
        return;
    }
    if("del".equals(action)){//删除提问
   	  	out.print(new QuestionApi().delQuestion(request));
        return;
    }
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>我的提问</title>
    <meta name="keywords" content="#"/>
    <meta name="description" content="#"/>
    <link href="../front_style/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../front_style/js/jquery.min.js"></script>

</head>

<body>
<!--=== Header ===-->
<jsp:include page="header.jsp">
    <jsp:param value="4" name="type"/>
</jsp:include>
<!--=== End Header ===-->

<div class="container">
    <div class="info">
        <a href="student_home.jsp">首页</a><em>></em><a href="my_questions.jsp">我的提问</a><em>></em><a
            href="ask_question.jsp">快速提问</a>
    </div>
</div>

<div class="container">
    <div class="ex_wrap">
        <div class="title_r">学生提问<a href="ask_question.jsp">快速提问</a></div>
        <%
            Doc sDoc;
            String name = "";
            String headpic = "";
            List<Doc> qList = selectic.Get_List("q.id,q.content,q.add_time,s.name,s.headpic", "bs_question q left join bs_students s on q.student_id=s.id", "where q.student_id=? and q.isdel=0 and s.isdel=0 order by q.id desc", "mysqlss", new Object[]{student_id});
            if (qList != null && !qList.isEmpty()) {
                for (Doc doc : qList) {
                    %>
        <div class="q_con">
            <div class="q_top">
                <div class="ex_user"><img src="<%="".equals(doc.get("headpic"))?"../front_style/images/user01.png":doc.get("headpic")%>"><%--<span>3</span>--%></div>
                <div class="q_word">
                    <h4><%=doc.get("name")%></h4>
                    <div><em><%=AjaxXml.timeStamp2Date(doc.getIn("add_time"), "YY04-MM-DD HH:MI:SS")%></em></div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="q_answer"><%=doc.get("content")%></div>
            <%
                List<Doc> rList = selectic.Get_List("id,content,add_time,teacher_id,student_id,reply_type", "bs_question_reply ", "where question_id=? and isdel=0 order by id asc", "mysqlss", new Object[]{doc.get("id")});
                if (rList != null && !rList.isEmpty()) {
                    for (Doc rdoc : rList) {
                        name = "";
                        headpic = "";
                        if (rdoc.getIn("reply_type") == 1) {
                            sDoc = selectic.Get_Doc("name,headpic", "bs_teachers", "where isdel=0 and id=?", "mysqlss", new Object[]{rdoc.getIn("teacher_id")});
                        } else {
                            sDoc = selectic.Get_Doc("name,headpic", "bs_students", "where isdel=0 and id=?", "mysqlss", new Object[]{rdoc.getIn("student_id")});
                        }
                        if (sDoc != null && !sDoc.isEmpty()) {
                            name = sDoc.get("name");
                           // headpic = sDoc.get("headpic");
                        }
                %>
            <div class="q_reply">
                <div class="q_reply_top">
                    <div class="q_reply_user"><img src="<%="".equals(headpic)?"../front_style/images/user01.png":headpic%>"></div>
                    <div class="q_reply_title"><%=rdoc.getIn("reply_type")==1?name+"老师回复":name%></div>
                    <div class="clear"></div>
                </div>
                <div class="<%=rdoc.getIn("reply_type")==1?"q_reply_word":"q_answer"%>">
                    <%=rdoc.get("content")%>
                </div>
            </div>
            <%
                    }
                }

            %>
            <div id="zzjs_net1" class="q_shuru1">
                <textarea name="" cols="" rows="" class="textarea_q" placeholder="请直接输入内容"></textarea>
                <div class="rep_botton"><a onclick="userSave(this, '<%=doc.getIn("id")%>')">回复</a></div>
                 <div class="del_botton"><a href="javascript:void(0)" onclick="delQuestion('<%=doc.getIn("id")%>',this)">删除</a></div>
            </div>
            <div class="clear"></div>
        </div>
        <%
                }
            }
        %>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>
    function userSave(obj, id) {
        var content = $(obj).parent().parent().find('textarea').val();
        if (content == '') {
            alert('请输入要回复的内容');
            return false;
        }
        $(obj).html('提交中...').attr('onclick', 'void(0);');
        $.post('?', 'action=save&question_id=' + id + '&content=' + content,function (data) {
            $(obj).html(data.msg);
            setTimeout(function () {
                if (data.type) {
                    window.location.href='my_questions.jsp';
                } else {
                    $(obj).attr('onclick', 'userSave(this);').html('回复');
                }
            }, 500);
        },'json');
    }
    function delQuestion(id,obj){
    	alert(id);
    	if(confirm("你确定要删除该问题吗？")){
    		$.ajax({ 
                dataType: "json",
                type: "post", 
                url: "my_questions.jsp",
                data: "action=del&id="+id,
                success: function (msg) {
                    if (msg.type) {
                    	window.location.reload();
                    } else {
                        alert(msg.msg);
                    }
                }
            });
    	}
    }
</script>
</body>
</html>
