<%@page import="com.baje.sz.util.StringUtil"%>
<%@page import="com.battsister.util.BasicType"%>
<%@page import="com.baje.sz.ajax.AjaxXml"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	Object teacher_id=session.getAttribute("teacher_id");
	if(teacher_id==null){
		out.print("	<script>alert(\"请先登录\");window.location.href='/login.jsp';</script>");
		return;
	}
	int examination_id=ru.getInt("examination_id");
	Selectic selectic=new Selectic();
	Doc examDoc=selectic.Get_Doc("id,name,type,question_num,class_id,limit_time,end_time","bs_examination", " where isdel=0 and id=?","mysqlss",new Object[]{examination_id});
	if(examDoc==null||examDoc.isEmpty()){
		out.print("	<script>alert(\"该试题不存在\");window.history.back(-1);</script>");
		return;
	}
	//考试答案
	int pages=ru.getInt("pages");
	pages=pages==0?1:pages;
	int pn=4;
	String table="bs_students a  left join bs_examination c on a.class_id=c.class_id left join  bs_examination_answer b on c.id=b.examination_id";
	String file="a.id,a.name,b.id,b.examination_id,b.time_use,is_right,is_commit,b.id as 'answer_id',b.commit_time";
	StringBuffer whereBuffer=new StringBuffer(" a.isdel=0 and a.teacher_id=? and a.class_id=? and c.id=? ");
	String order=" order by b.is_commit asc,a.id desc ";
	List valueList=new ArrayList();
	valueList.add(teacher_id);
	valueList.add(examDoc.getIn("class_id"));
	valueList.add(examination_id);
	int counts=selectic.Get_count("a.id", table, whereBuffer.toString(), "mysqlss",valueList);
	List<Doc> answerList=selectic.Get_List(pages, pn, counts, table, whereBuffer.toString(), file, order,"mysqlss",valueList);
	int page_size=selectic.getPageSize(counts, pn);
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>考试详情</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
<!-- 引入头部 -->
<jsp:include page="head.jsp">
	<jsp:param value="2" name="type"/>
</jsp:include>
<div class="container">
    <div class="info">
    	<a href="teacher_home.jsp">首页</a><em>></em><a href="teaching.jsp">我要授课</a><em>></em><a href="examination_system.jsp">考试系统</a><em>></em><a href="javascript:void(0)">考试记录</a>
    </div>
</div>
<div class="container">
	<div class="ex_wrap">
		<div class="title_r"><%=examDoc.get("name")%><!-- <i>参考人员：全体学员</i> --><i>考试时长：<%=examDoc.getIn("limit_time")/60%>分钟</i><i>试题数量：<%=examDoc.getIn("question_num")%></i><a href="examination_details.jsp?examination_id=<%=examination_id%>">试题详情</a></div> 
        <%
        	if(answerList!=null){
        		for(Doc doc:answerList){
        			%>
        				 <div class="ex_two">
				           <!--  <div class="ex_user"><img src="images/user.jpg"></div> -->
				            <div class="ex_word">
				                <h4><%=doc.get("name")%></h4>
				                <div><em><%=doc.getIn("is_commit")==1?AjaxXml.timeStamp2Date(doc.getIn("commit_time"), "YY04-MM-DD HH:MI:SS"):"未交卷"%></em><em><%=doc.getIn("is_commit")==1?"答题时间："+BasicType.getAnswerTime(doc.getIn("time_use"))+"":""%></em></div>
				            </div>
				            <div class="ex_score"><%=doc.getIn("is_commit")==1?doc.getIn("is_right")+"/"+examDoc.getIn("question_num"):"未交卷"%></div>
				            <div class="mod_botton"><a href="<%=doc.getIn("is_commit")==1?"examination_details1.jsp?answer_id="+doc.getIn("answer_id")+"":"javascript:void(0)"%>" <%=doc.getIn("is_commit")==1?"":"style=\"background-color: #999;\""%>>查看详情</a></div>
				            <div class="clear"></div>
       					</div>
        			<%
        		}
        	}
        %>
       
        <ul class="pre">
      <%=page_size>0?"<li><a href=\""+(pages!=1?"examination_record.jsp?pages="+(pages-1)+"&examination_id="+examination_id+"":"javascript:void(0);")+"\"><</a></li>":""%>
       <%
       	int index=1;
       	int index2=page_size;
       	if(page_size>=5){
	       	if(pages+5<=page_size){
	       		index=pages;
	       		index2=pages+4;
	       	}
	       	if(pages+5>page_size){
	       		index=page_size-4;
	       	}
       	}
       	for(int i=index;i<=index2;i++){
       		out.print("<li"+(i==pages?" class=\"active_pre\"":"")+"><a href=\"examination_record.jsp?pages="+i+"&examination_id="+examination_id+"\">"+i+"</a></li>");
       	}
       %>
       <%=page_size>0?"<li><a href=\""+(pages!=page_size?"examination_record.jsp?pages="+(pages+1)+"&examination_id="+examination_id+"":"javascript:void(0);")+"\">></a></li>":""%>
    </ul>
    </div>	
</div>
<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
