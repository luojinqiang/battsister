<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.battsister.util.BasicType"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	int examination_id=ru.getInt("examination_id");
	Selectic selectic=new Selectic();
	Doc examDoc=selectic.Get_Doc("id,name,type,question_num,limit_time,end_time","bs_examination", " where isdel=0 and id=?","mysqlss",new Object[]{examination_id});
	if(examDoc==null||examDoc.isEmpty()){
		out.print("	<script>alert(\"该试题不存在\");window.history.back(-1);</script>");
		return;
	}
	List valueList=new ArrayList();
	valueList.add(examination_id);
	String table="bs_exercise_exam";
	String file="name,name_pic,option_array,type,thoughts";
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
<title>试题详情</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
//=点击展开关闭效果=
function open_zzjs_net(oSourceObj,oTargetObj,shutAble,oOpenTip,oShutTip){
var sourceObj = typeof oSourceObj == "string" ? document.getElementById(oSourceObj) : oSourceObj;
var targetObj = typeof oTargetObj == "string" ? document.getElementById(oTargetObj) : oTargetObj;
var openTip = oOpenTip || "";
var shutTip = oShutTip || "";
if(targetObj.style.display!="none"){
   if(shutAble) return;
   targetObj.style.display="none";
   if(openTip  &&  shutTip){
    sourceObj.innerHTML = shutTip;
   }
} else {
   targetObj.style.display="block";
   if(openTip  &&  shutTip){
    sourceObj.innerHTML = openTip;
   }
}
}
</script>

</head>

<body>
<!-- 引入头部 -->
<jsp:include page="head.jsp">
	<jsp:param value="2" name="type"/>
</jsp:include>

<div class="container">
    <div class="info">
    	<a href="teacher_home.jsp">首页</a><em>></em><a href="teaching.jsp">我要授课</a><em>></em><a href="examination_system.jsp">考试系统</a><em>></em><a href="examination_record.jsp">考试记录</a>
    </div>
</div>
<div class="container">
	<div class="ex_wrap">
		<div class="title_r">考试名称<i>参考人员：全体学员</i><i>考试时长：<%=examDoc.getIn("limit_time")%>分钟</i><i>试题数量：<%=examDoc.getIn("question_num")%></i></div>
    <%
    if(examList!=null){
   		for(int i=0;i<examList.size();i++){
   			Doc questionDoc=examList.get(i);
	   %>
	   	 <div class="ex_one">
	        <div class="ex_one_title"><em><%if(questionDoc.getIn("type")==0){out.print("单选");}else if(questionDoc.getIn("type")==1){out.print("多选");}else{out.print("判断题");}%></em><span><%=(i+1)+(pn*(pages-1))%>/<%=counts%></span><%=questionDoc.get("name")%></div>
	        <ul>
	           <%
	           if(questionDoc.getIn("type")==0||questionDoc.getIn("type")==1){
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
	           }else{
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
	        <div class="ex_botton"><a onclick="open_zzjs_net(this,'zzjs_net<%=i%>')">本题答案以及解释</a></div>
	        <div id="zzjs_net<%=i%>" class="zzjs_net" style="display:none"><%=questionDoc.get("thoughts")%></div>
	    </div>
	    <%
	   	}
    }
    %>
      <!-- 分页 -->
     <ul class="pre">
      <%=page_size>0?"<li><a href=\""+(pages!=1?"examination_details.jsp?pages="+(pages-1)+"&examination_id="+examination_id:"javascript:void(0);")+"\"><</a></li>":""%>
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
       		out.print("<li"+(i==pages?" class=\"active_pre\"":"")+"><a href=\"examination_details.jsp?pages="+i+"&examination_id="+examination_id+"\">"+i+"</a></li>");
       	}
       %>
       <%=page_size>0?"<li><a href=\""+(pages!=page_size?"examination_details.jsp?pages="+(pages+1)+"&examination_id="+examination_id:"javascript:void(0);")+"\">></a></li>":""%>
    </ul>
<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>

