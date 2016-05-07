<%@page import="com.baje.sz.util.StringUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="com.battsister.util.BasicType"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
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
						}
					}
					course_json.put("chapter_array", chapter_array);
					course_array.add(course_json);
				}
			}
		}
	}
}
//考试列表
List valueList=new ArrayList();
valueList.add(teacher_id);
String table="bs_examination a left join bs_class b on a.class_id=b.id";
String file="a.id,a.name,a.type,a.question_num,a.class_id,a.limit_time,a.end_time,b.class_name";
String wheres="a.isdel=0 and a.teacher_id=?";
int counts=selectic.Get_count("a.id", table, wheres, "mysqlss",valueList);
int pages=ru.getInt("pages");
pages=pages==0?1:pages;
int pn=5;
int page_size=selectic.getPageSize(counts, pn);
List<Doc> examinationList=selectic.Get_List(pages, pn, counts, table, wheres, file, "order by a.add_time desc", "mysqlss",valueList);
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>考试系统</title>
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
	<jsp:param value="2" name="type"/>
</jsp:include>
<!--=== End Header ===-->
<!-- 引入第二个头部 -->
<%@include file="head1.jsp" %>

<div class="container">
  <div class="left_nav">
      <div class="operate">
        <ul id="juheweb">
        <h3>课程目录 </h3>
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
              						<p><a href="teaching_details.jsp?chapter_id=<%=chapter_json.optInt("id")%>" target="_blank"><%=chapter_json.optString("name")%></a></p>
              						<%
              					}
              				}
              			%>
            		</div>
          	</li>
         			<%
         		}
         	%>
          <h3>其它目录</h3>
          <li>
            <h5 class="selected"><a href="examination_system.jsp">考试记录</a></h5>
          </li>
          <li>
            <h5><a href="questions.jsp">学生提问</a></h5>
          </li>
        </ul>
        <script type="text/javascript" language="javascript">
			navList(12);
		</script>
      </div>
  </div>
  <div class="right_w">
  	 <div class="title_r">考试记录<a href="examination.jsp">发起考试</a></div>
     <div class="right_con">
        <%
        	if(examinationList!=null){
        		for(Doc doc:examinationList){
        			%>
		        <div class="kaoshi">
			        	<table width="100%" border="0" cellspacing="1" cellpadding="0">
			              <tr>
			                <td colspan="6" class="table_title"><%=doc.get("name")%><span>参考人员：全体学员</span></td>
			              </tr>
			              <tr>
			                <th>考试模式</th>
			                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;考试班级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
			                <th>试题数量</th>
			                <th>考试时长</th>
			                <th>考试截止时间</th>
			                <th>&nbsp;</th>
			              </tr>
			              <tr>
			                <td><%=doc.getIn("type")==0?"按模块":"按任务"%></td>
			                <td><%=doc.get("class_name")%></td>
			                <td><%=doc.getIn("question_num")%></td>
			                <td><%=doc.getIn("limit_time")/60+"分钟"%></td>
			                <td><%=AjaxXml.timeStamp2Date(doc.getIn("end_time"),"YY04-MM-DD")%></td>
			                <td><div class="kaoshi_botton"><a href="examination_record.jsp?examination_id=<%=doc.getIn("id")%>">查看详情</a></div></td>
			              </tr>
			            </table>
		        </div>
        			<%
        		}
        	}
        %>
       <!-- 分页 -->
     <ul class="pre">
      <%=page_size>0?"<li><a href=\""+(pages!=1?"examination_system.jsp?pages="+(pages-1):"javascript:void(0);")+"\"><</a></li>":""%>
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
       		out.print("<li"+(i==pages?" class=\"active_pre\"":"")+"><a href=\"examination_system.jsp?pages="+i+"\">"+i+"</a></li>");
       	}
       %>
       <%=page_size>0?"<li><a href=\""+(pages!=page_size?"examination_system.jsp?pages="+(pages+1):"javascript:void(0);")+"\">></a></li>":""%>
    </ul>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
