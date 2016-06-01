<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@ page import="com.battsister.util.BasicType" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	Object teacher_id=session.getAttribute("teacher_id");
	Selectic selectic=new Selectic();
	if(teacher_id==null){
		out.print("	<script>alert(\"请先登录\");window.location.href='/login.jsp';</script>");
		return;
	}
	Doc teacherDoc=selectic.Get_Doc("id,course_flag", "bs_teachers", " where id=? ","mysqlss",new Object[]{teacher_id});
	if(teacherDoc==null||teacherDoc.isEmpty()){
		out.print("	<script>alert(\"请先登录\");window.location.href='/login.jsp';</script>");
		return;
	}
	JSONArray course_array=new JSONArray();
	if(teacherDoc.get("course_flag")!=null&&!"".equals(teacherDoc.get("course_flag"))){
		JSONArray hasArray=JSONArray.fromObject(teacherDoc.get("course_flag"));
		if(hasArray!=null){
			for(int i=0;i<hasArray.size();i++){
				JSONObject course_json=new JSONObject();
				JSONObject hasJson=hasArray.optJSONObject(i);
				if(hasJson!=null){
					Doc coursedDoc=selectic.Get_Doc("id,name,introduce,pic,teaching_guide,teaching_evalution,teaching_plan", "bs_course", " where id=? ","mysqlss",new Object[]{hasJson.optInt("course_id")});
					if(coursedDoc!=null&&!coursedDoc.isEmpty()){
						course_json.put("id",coursedDoc.getIn("id"));
						course_json.put("name",coursedDoc.get("name"));
						course_json.put("introduce",coursedDoc.get("introduce"));
						course_json.put("pic",coursedDoc.get("pic"));
						course_json.put("teaching_guide",coursedDoc.get("teaching_guide"));
						course_json.put("teaching_evalution",coursedDoc.get("teaching_evalution"));
						course_json.put("teaching_plan",coursedDoc.get("teaching_plan"));
						//该教师拥有的课程下面的章节
						JSONArray chapter_array=new JSONArray();
						JSONArray hasChapterArray=hasJson.optJSONArray("chapters");
						if(hasChapterArray!=null){
							for(int j=0;j<hasChapterArray.size();j++){
								Doc chapterDoc=selectic.Get_Doc("id,name", "bs_chapter", " where id=? ","mysqlss",new Object[]{hasChapterArray.optJSONObject(j).optInt("chapter_id")});
								if(chapterDoc!=null&&!chapterDoc.isEmpty()){
									JSONObject chapterJson=new JSONObject();
									chapterJson.put("id",chapterDoc.getIn("id"));
									chapterJson.put("name",chapterDoc.get("name"));
									chapter_array.add(chapterJson);
								}
							}
						}
						course_json.put("chapter_array", chapter_array);
						course_array.add(course_json);
					}
				}
			}
		}
	}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>课程模块</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/front_style/js/jquery.min.js"></script>
<script src="/front_style/js/showList.js" type="text/javascript"></script>
</head>
<body>
<!-- 引入头部 -->
<jsp:include page="head.jsp">
	<jsp:param value="1" name="type"/>
</jsp:include>
<!-- 引入第二个头部 -->
<%@include file="head1.jsp" %>


<div class="container">
  <div class="left_nav">
      <div class="operate">
        <ul id="juheweb">
        <h3>课程体系</h3>
          <li>
            <h5><a href="teacher_home.jsp">课程大纲</a></h5>
          </li>
          <li >
            <h5  class="selected"><a href="course_modules.jsp">课程模块</a></h5>
          </li>
         <h3>教学资源</h3>
         	<%
         		for(int i=0;i<course_array.size();i++){
         			JSONObject course_json=course_array.getJSONObject(i);
         			JSONArray chapter_array=course_json.optJSONArray("chapter_array");
         			%>
         	<li>
            	<h4><%=course_json.optString("name")%></h4>
            		<div class="list-item none">
              			<%
              				if(chapter_array!=null){
              					for(int j=0;j<chapter_array.size();j++){
              						JSONObject chapter_json=chapter_array.getJSONObject(j);
              						%>
              						<p><a href="teaching_resources.jsp?chapter_id=<%=chapter_json.optInt("id")%>" target="_blank"><%=chapter_json.optString("name")%></a></p>
              						<%
              					}
              				}
              			%>
            		</div>
          	</li>
         			<%
         		}
         	%>
         
          <h3>习题库</h3>
          <li>
            <h5><a href="exercises.jsp">习题库</a></h5>
          </li>
        </ul>
        <script type="text/javascript" language="javascript">
			navList(12);
		</script>
      </div>
  </div>
  <div class="right_w">
  	 <div class="title_r">课程模块</div>
  	 <div class="right_con">
           <%
           	for(int i=0;i<course_array.size();i++){
           		JSONObject course_json=course_array.optJSONObject(i);
           		%>
           	<div class="one">
                <div class="one_img"><img src="<%=course_json.optString("pic")%>"></div>
                	<div class="one_word">
                 	 <h3><%=course_json.optString("name")%></h3>
                  		<p><%=course_json.optString("introduce")%></p>
						<div class="botton1"><a href="course_modules_details.jsp?course_id=<%=course_json.optInt("id")%>">查看详情</a></div>
						<div class="botton1"><a href="../pdf/web/viewer2.jsp?file=<%=BasicType.getValueByKey(course_json.optString("teaching_guide"), "word_dir")%>" target="_blank" style="background-color:#fd7700;">教学指南</a></div>
						<div class="botton1"><a href="../pdf/web/viewer2.jsp?file=<%=BasicType.getValueByKey(course_json.optString("teaching_evalution"), "word_dir")%>" target="_blank" style="background-color:#fd7700;">教学评价</a></div>
						<div class="botton1"><a href="../pdf/web/viewer2.jsp?file=<%=BasicType.getValueByKey(course_json.optString("teaching_plan"), "word_dir")%>" target="_blank" style="background-color:#fd7700;">课程标准</a></div>
                </div>
                <div class="clear"></div>
           </div>	
           		<%
           		
           	}
           %>
     </div>
  </div>
  <div class="clear"></div>
</div>

<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
