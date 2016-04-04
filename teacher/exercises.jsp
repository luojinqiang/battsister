<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.baje.sz.ajax.AjaxXml"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
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
JSONArray course_array=new JSONArray();//老师拥有的课程
StringBuffer wenhao=new StringBuffer();
List valueList=new ArrayList();
int pages=ru.getInt("pages");//页码
pages=pages==0?1:pages;
if(teacherDoc.get("course_flag")!=null&&!"".equals(teacherDoc.get("course_flag"))){
	JSONArray hasArray=JSONArray.fromObject(teacherDoc.get("course_flag"));
	if(hasArray!=null){
		for(int i=0;i<hasArray.size();i++){
			JSONObject course_json=new JSONObject();
			JSONObject hasJson=hasArray.optJSONObject(i);
			if(hasJson!=null){
				Doc coursedDoc=selectic.Get_Doc("id,name,introduce,pic", "bs_course", " where id=? ","mysqlss",new Object[]{hasJson.optInt("course_id")});
				if(coursedDoc!=null&&!coursedDoc.isEmpty()){
					course_json.put("id",coursedDoc.getIn("id"));
					course_json.put("name",coursedDoc.get("name"));
					course_json.put("introduce",coursedDoc.get("introduce"));
					course_json.put("pic",coursedDoc.get("pic"));
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
			             	wenhao.append("?,");
			             	valueList.add(chapterDoc.getIn("id"));
						}
					}
					course_json.put("chapter_array", chapter_array);
					course_array.add(course_json);
				}
			}
		}
	}
}
//习题库
String table="bs_exercise_library a left join bs_course b on a.course_id=b.id left join bs_chapter c on a.chapter_id=c.id";
String file="a.id,b.name as 'course_name',c.name as 'chapter_name'";
String wheres="a.isdel=0 and a.chapter_id in ("+(wenhao.length()>0?wenhao.substring(0,wenhao.length()-1):"")+")";
int counts=selectic.Get_count("a.id",table,wheres, "mysqlss",valueList);
List<Doc> exeList=selectic.Get_List(pages,5, counts,table,wheres,file," order by a.course_id desc ","mysqlss",valueList);
int page_size=selectic.getPageSize(counts,5);
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>习题库</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/front_style/js/jquery.min.js"></script>
<script src="/front_style/js/showList.js" type="text/javascript"></script>
</head>
<body>
<!--=== Header ===-->
<!-- 引入头部 -->
<jsp:include page="head.jsp">
	<jsp:param value="1" name="type"/>
</jsp:include>
<!--=== End Header ===-->
<!-- 引入第二个头部 -->
<%@include file="head1.jsp" %>

<div class="container">
  <div class="left_nav">
      <div class="operate">
        <ul id="juheweb">
        <h3>课程体系</h3>
          <li>
            <h5><a href="teacher_home.jsp">课程标准</a></h5>
          </li>
          <li >
            <h5><a href="course_modules.jsp">课程模块</a></h5>
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
            <h5 class="selected"><a href="exercises.jsp">习题库</a></h5>
          </li>
        </ul>
        <script type="text/javascript" language="javascript">
			navList(12);
		</script>
      </div>
  </div>
  <div class="right_w">
  	 <div class="title_r">习题库</div>
  	 <div class="right_con">
  	 <%
  	 	if(exeList!=null&&exeList.size()>0){
  	 		for(Doc doc:exeList){
  	 			%>
  	 			 <div class="mod">
           			<div class="mod_word">
              			<h3><%=doc.get("course_name")%>-<%=doc.get("chapter_name")%>&nbsp;习题</h3>
               		</div>
               		<div class="mod_botton"><a href="exercises_details.jsp?exe_id=<%=doc.getIn("id")%>">查看详情</a></div>
                	<div class="clear"></div>
          		 </div>	
  	 			<%
  	 		}
  	 	}else{
  	 		out.print("暂无习题");
  	 	}
  	 %>
           <ul class="pre">
                <li><a href="#"><</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li class="active_pre"><a href="#">5</a></li>
                <li><a href="#">></a></li>
            </ul>
     </div>
  </div>
  <div class="clear"></div>
</div>
<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
