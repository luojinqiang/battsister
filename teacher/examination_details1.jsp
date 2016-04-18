<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.battsister.util.BasicType"%>
<%@page import="com.baje.sz.ajax.AjaxXml"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	int answer_id=ru.getInt("answer_id");
	Selectic selectic=new Selectic();
	Doc answerDoc=selectic.Get_Doc("a.id,a.answer,a.examination_id,a.time_use,a.commit_time,b.name,c.question_num", "bs_examination_answer a left join bs_students b on a.student_id=b.id left join bs_examination c on a.examination_id=c.id", " where a.isdel=0 and a.id=? and a.is_commit=1","mysqlss",new Object[]{answer_id});
	if(answerDoc==null||answerDoc.isEmpty()){
		out.print("	<script>alert(\"信息不存在\");window.location.href='/teacher/teacher_home.jsp';</script>");
		return;
	}
	JSONObject studentAnserJson=null;
	if(answerDoc.get("answer")!=null&&!"".equals(answerDoc.get("answer"))){
		studentAnserJson=JSONObject.fromObject(answerDoc.get("answer"));
	}
	studentAnserJson=studentAnserJson==null?new JSONObject():studentAnserJson;//不能为空
	List valueList=new ArrayList();
	valueList.add(answerDoc.getIn("examination_id"));
	String table="bs_exercise_exam";
	String file="id,name,name_pic,option_array,answer,type,thoughts";
	String wheres="isdel=0 and examination_id =? ";
	int counts=selectic.Get_count("id", table, wheres, "mysqlss",valueList);
	int pages=ru.getInt("pages");
	pages=pages==0?1:pages;
	int pn=5;
	int page_size=selectic.getPageSize(counts, pn);
	List<Doc> examList=selectic.Get_List(pages, pn, counts, table, wheres, file, "", "mysqlss",valueList);
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
<!--=== Header ===-->
<!-- 引入头部 -->
<jsp:include page="head.jsp">
	<jsp:param value="2" name="type"/>
</jsp:include>
<!--=== End Header ===-->
<div class="container">
    <div class="info">
    	<a href="teacher_home.jsp">首页</a><em>></em><a href="teaching.jsp">我要授课</a><em>></em><a href="examination_system.jsp">考试系统</a><em>></em><a href="examination_record.jsp">考试记录</a><em>></em><a href="javascript:void(0)">张帆考试记录</a>
    </div>
</div>
<div class="container">
	<div class="ex_wrap">
    	<div class="title_r">考试题目</div>
		<div class="ex_two bg_grey">
           <!--  <div class="ex_user"><img src="images/user.jpg"></div> -->
            <div class="ex_word1">
                <h4><%=answerDoc.get("name")%></h4>
                <div><em><%=AjaxXml.timeStamp2Date(answerDoc.getIn("commit_time"), "YY04-MM-DD HH:MI:SS")%></em><em>答题时间：<%=BasicType.getAnswerTime(answerDoc.getIn("time_use"))%></em></div>
            </div>
            <div class="ex_score"><%=answerDoc.getIn("is_right")+"/"+answerDoc.getIn("question_num")%></div>
            <div class="clear"></div>
        </div>
        <%
    if(examList!=null){
   		for(int i=0;i<examList.size();i++){
   			Doc questionDoc=examList.get(i);
   			String answer="";//0123表示ABCD,0为错误，1为正确
   			int answeroptId=0;//用户的答案id
   			JSONArray studentArrayAnswer=studentAnserJson.optJSONArray(questionDoc.get("id"));
   			String studentAnswerString="";
   			if(studentArrayAnswer!=null){
   				studentAnswerString=studentArrayAnswer.toString();
   			}
   			StringBuffer StudentAnswerBuffer=new StringBuffer("");//学生的答案
   			StringBuffer answerBuffer=new StringBuffer("");//答案字符串A,B
	   %>
	   	 <div class="ex_one">
	        <div class="ex_one_title"><em><%if(questionDoc.getIn("type")==0){out.print("单选");}else if(questionDoc.getIn("type")==1){out.print("多选");}else{out.print("判断题");}%></em><span><%=(i+1)+(pn*(pages-1))%>/<%=counts%></span><%=questionDoc.get("name")%></div>
	        <ul>
	           <%
	           if(questionDoc.getIn("type")==0||questionDoc.getIn("type")==1){//单选、多选
	        	   JSONArray optArray=null;
	        	   if(questionDoc.get("option_array")!=null&&!"".equals(questionDoc.get("option_array"))){
	        		   optArray=JSONArray.fromObject(questionDoc.get("option_array"));
	        	   }
		           if(optArray!=null){
		        	   for(int j=0;j<optArray.size();j++){
		        		   JSONObject  optJson=optArray.optJSONObject(j);
	           %>
		            <li>
		               <%=questionDoc.getIn("type")==0?"<input name=\""+i+"\" type=\"radio\" value=\"0\" class=\"input_radio\">":" <input name=\""+i+"\" type=\"checkbox\" value=\"1\" class=\"input_checkbox\">"%>
		                <div class="da_an">
		                    <%
		                    String optString=BasicType.getOption(j)+"   ";
		                    //答案字符串
		                  	if(optJson.optInt("is_answer")==1){
		                  	  answerBuffer.append(optString);
		                  	}
		                    //判断用户是否选中该答案
		                    if(studentAnswerString.contains(optJson.optString("id"))){
		                    	//用户选中该答案
		                    	StudentAnswerBuffer.append(optString);
		                    }
		                    if(optJson.optString("name")!=null&&!"".equals(optJson.optString("name"))){
		                    	out.print("<p>"+optString+optJson.optString("name")+"</p>" );
		                    	optString="";//当显示了abcd时第二个不显示
		                    }
		                    %>
		                    <%=optJson.optString("pic")!=null&&!"".equals(optJson.optString("pic"))?"<div class=\"da_an_img\">"+optString+"<img src=\""+optJson.optString("pic")+"\"></div>":""%>
		                </div>
		                <div class="clear"></div>
		            </li>
	           <%
	           			}
	          		}
	           }else{//判断题
	        	   if(questionDoc.getIn("answer")==0){
	        		   //答案为错误
	        		   if(studentAnswerString.contains("0")){
	        			   StudentAnswerBuffer.append("错");
	        		   }
	        		   answerBuffer.append("错");
	        	   }else{
	        		   //答案为正确
	        		   if(studentAnswerString.contains("1")){
	        			   StudentAnswerBuffer.append("对");
	        		   }
	        		   answerBuffer.append("对");
	        	   }
	        	 %>
	        	  <li>
	                <input name="<%=i%>" type="radio" value="1" class="input_radio">
	                <div class="da_an">
	                    <p>正确</p>
	                </div>
	                <div class="clear"></div>
	            </li>
	            <li>
	                <input name="<%=i%>" type="radio" value="0" class="input_radio">
	                <div class="da_an">
	                    <p>错误</p>
	                </div>
	                <div class="clear"></div>
	            </li>
	        	<%
	           }
	           %>
	        </ul>
	         <div class="ex_info"><%=answerDoc.get("name")%>的答案：<%=studentAnswerString%>，<%=StudentAnswerBuffer.toString().equals(answerBuffer.toString())?"<span style=\"color:green;\">回答正确</span>":"<span style=\"color:red;\">回答错误</span>"%>，正确答案：<%=answerBuffer.toString()%></div>
	    </div>
	    <%
	   	}
    }
    %>
          <ul class="pre">
      <%=page_size>0?"<li><a href=\""+(pages!=1?"examination_details1.jsp?pages="+(pages-1)+"&answer_id="+answer_id:"javascript:void(0);")+"\"><</a></li>":""%>
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
       		out.print("<li"+(i==pages?" class=\"active_pre\"":"")+"><a href=\"examination_details1.jsp?pages="+i+"&answer_id="+answer_id+"\">"+i+"</a></li>");
       	}
       %>
       <%=page_size>0?"<li><a href=\""+(pages!=page_size?"examination_details1.jsp?pages="+(pages+1)+"&answer_id="+answer_id:"javascript:void(0);")+"\">></a></li>":""%>
    </ul>
    </div>	
</div>
<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
