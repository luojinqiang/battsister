<%@page import="com.battsister.util.BasicType"%>
<%@page import="com.g.Tojpg.Pdf2Jpg"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	int course_id=ru.getInt("course_id");
	Selectic selectic=new Selectic();
	Doc coursedDoc=selectic.Get_Doc("id,name,introduce,pic,teaching_guide,teaching_evalution,teaching_plan", "bs_course", " where id=? ","mysqlss",new Object[]{course_id});
	if(coursedDoc==null||coursedDoc.isEmpty()){
		out.print("	<script>alert(\"该课程不存在\");window.location.href='/teacher/teacher_home.jsp';</script>");
		return;
	}
	StringBuffer teachingGuideBuffer=new StringBuffer("[");
	StringBuffer teachingEvalutionBuffer=new StringBuffer("[");
	/* StringBuffer teachingPlanBuffer=new StringBuffer("["); */
	if(coursedDoc.get("teaching_guide")!=null&&!"".equals(coursedDoc.get("teaching_guide"))){
		JSONObject json=JSONObject.fromObject(coursedDoc.get("teaching_guide"));
		if(json!=null){
			int num=json.optInt("num");
			String word_dir=json.optString("word_dir");
			for(int i=0;i<num;i++){
				if(i==(num-1)){
					teachingGuideBuffer.append("'"+BasicType.getWordPptPath(word_dir, i)+"'");
				}else{
					teachingGuideBuffer.append("'"+BasicType.getWordPptPath(word_dir, i)+"',");
				}
			}
		}
	}
	if(coursedDoc.get("teaching_evalution")!=null&&!"".equals(coursedDoc.get("teaching_evalution"))){
		JSONObject json=JSONObject.fromObject(coursedDoc.get("teaching_evalution"));
		if(json!=null){
			int num=json.optInt("num");
			String word_dir=json.optString("word_dir");
			for(int i=0;i<num;i++){
				if(i==(num-1)){
					teachingEvalutionBuffer.append("'"+BasicType.getWordPptPath(word_dir, i)+"'");
				}else{
					teachingEvalutionBuffer.append("'"+BasicType.getWordPptPath(word_dir, i)+"',");
				}
			}
		}
	}//教案不要了2016-04-07
	/* if(coursedDoc.get("teaching_plan")!=null&&!"".equals(coursedDoc.get("teaching_plan"))){
		JSONObject json=JSONObject.fromObject(coursedDoc.get("teaching_plan"));
		if(json!=null){
			int num=json.optInt("num");
			String word_dir=json.optString("word_dir");
			for(int i=0;i<num;i++){
				if(i==(num-1)){
					teachingPlanBuffer.append("'"+BasicType.getWordPptPath(word_dir, i)+"'");
				}else{
					teachingPlanBuffer.append("'"+BasicType.getWordPptPath(word_dir, i)+"',");
				}
			}
		}
	} */
	teachingGuideBuffer.append("]");
	teachingEvalutionBuffer.append("]");
	/* teachingPlanBuffer.append("]"); */
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>课程模块详情</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/front_style/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/front_style/js/organictabs.jquery.js"></script>
<link rel="stylesheet" href="/front_style/ppt_word/css/base.css">
<link rel="stylesheet" href="/front_style/ppt_word/css/MPreview.css">
 <script type="text/javascript" src="/front_style/ppt_word/js/MPreview.js"></script>
<script type="text/javascript">
$(function() {
	// 调用插件
	$("#example-two").organicTabs({
		"speed": 100,
	});
});
</script>
</head>

<body>
<!-- 引入头部 -->
<jsp:include page="head.jsp">
	<jsp:param value="1" name="type"/>
</jsp:include>

<div class="container">
    <div class="info">
    	<a href="teacher_home.jsp">首页</a><em>></em><a href="teacher_home.jsp">我要备课</a><em>></em><a href="course_modules.jsp">课程模块</a><em>></em><a href="course_modules_details.jsp?course_id=<%=coursedDoc.getIn("id")%>"><%=coursedDoc.get("name")%></a>
    </div>
</div>

<div class="container">
    <div class="one_top">
        <div class="one_img"><img src="<%=coursedDoc.get("pic")%>"></div>	
        <div class="one_word1">
          <h3><%=coursedDoc.get("name")%></h3>
          <p><%=coursedDoc.get("introduce")%></p>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="container">
	<div id="example-two">
		<ul class="nav">
			<li class="nav-one"><a href="#ab" class="current">教学指南</a></li>
			<!-- <li class="nav-two"><a href="#bb">教案</a></li> -->
			<li class="nav-three"><a href="#cb">教学评价</a></li>
		</ul>
		<div class="list-wrap">
			<ul id="ab">
			<%
				if(teachingGuideBuffer.length()>2){
			%>
				 <div class="wrapper">
        			<div class="doc" id="doc0" style="margin-top: -30px;"></div>
				 </div>
					 <script type="text/javascript">
						var data0=<%=teachingGuideBuffer.toString()%>;
					</script>
  			 		<script type="text/javascript">$('#doc0').MPreview({ data: data0 });</script>
  			<%
				}else{
					out.print("<li class=\"one_mod\">暂无文档</li>");
				}
  			%>
  			 		
           </ul>
			<%-- <ul id="bb" class="hide">
			<%
				if(teachingPlanBuffer.length()>2){
			%>
				 <div class="wrapper">
        			<div class="doc" id="doc1" style="margin-top: -30px;"></div>
				 </div>
					 <script type="text/javascript">
						var data1=<%=teachingPlanBuffer.toString()%>;
					</script>
  			 		<script type="text/javascript">$('#doc1').MPreview({ data: data1 });</script>
  			 <%
				}else{
					out.print("<li class=\"one_mod\">暂无文档</li>");
				}
  			%>
			</ul>
			--%>
			<ul id="cb" class="hide">
			<%
				if(teachingEvalutionBuffer.length()>2){
			%>
				 <div class="wrapper">
        			<div class="doc" id="doc2" style="margin-top: -30px;"></div>
				 </div>
					 <script type="text/javascript">
						var data2=<%=teachingEvalutionBuffer.toString()%>;
					</script>
  			 		<script type="text/javascript">$('#doc2').MPreview({ data: data2 });</script>
  			 <%
				}else{
					out.print("<li class=\"one_mod\">暂无文档</li>");
				}
  			%>
			</ul> 
		</div>
	</div>
</div>

<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
