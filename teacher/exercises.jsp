<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.battsister.util.BasicType"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
//习题库
int pages=ru.getInt("pages");//页码
pages=pages==0?1:pages;
int chapter_id=ru.getInt("chapter_id");
List<Doc> exeList=null;
int page_size=0;
int course_id=0;
int counts=0;
int pn=5;//每页几个题目
if(chapter_id>0){
	Doc chapterDoc=selectic.Get_Doc("id,course_id", "bs_chapter", "where isdel=0 and id=?","mysqlss",new Object[]{chapter_id});
	if(chapterDoc==null||chapterDoc.isEmpty()){
		out.print("	<script>alert(\"该课程不存在\");window.location.href='/teacher/exercises.jsp';</script>");
		return;
	}
	course_id=chapterDoc.getIn("course_id");//该章节所属的课程id
	List valueList=new ArrayList();
	valueList.add(chapter_id);
	String table="bs_exercise_library";
	String file="id,name,name_pic,type,order_num,thoughts";
	String wheres="isdel=0 and chapter_id=? ";
	counts=selectic.Get_count("id",table,wheres, "mysqlss",valueList);
	exeList=selectic.Get_List(pages,pn, counts,table,wheres,file," order by type asc,order_num asc,id asc  ","mysqlss",valueList);
	page_size=selectic.getPageSize(counts,pn);
	if(exeList!=null){
		for(Doc doc:exeList){
			if(doc.getIn("type")!=2){
				List<Doc> opt_List=selectic.Get_List("name,pic,is_answer,order_num", "bs_exercise_option", " where isdel=0 and exercise_library_id=? ","mysqlss",new Object[]{doc.getIn("id")});
				opt_List=opt_List==null?new ArrayList():opt_List;
				doc.put("opt_list",opt_List);
			}else{
				doc.put("opt_list",new ArrayList());
			}
		}
	}
	exeList=exeList==null?new ArrayList():exeList;
}
//习题库介绍
String exercises_introduce="";
Doc infoDoc=selectic.Get_Doc("exercises_introduce", "bs_info", "","mysqlss");
if(infoDoc!=null){
	exercises_introduce=infoDoc.get("exercises_introduce");
}
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
         <h3 style="background-color:#2490eb;color: #fff;">习题库</h3>
       	 <%
         for(int i=0;i<course_array.size();i++){
         		JSONObject course_json=course_array.getJSONObject(i);
         		JSONArray chapter_array=course_json.optJSONArray("chapter_array");
         %>
         	<li>
            	<h4><%=course_json.optString("name")%></h4>
            		<div class="list-item<%=course_id==course_json.optInt("id")?"":" none"%>">
              			<%
              				if(chapter_array!=null){
              					for(int j=0;j<chapter_array.size();j++){
              						JSONObject chapter_json=chapter_array.getJSONObject(j);
              						%>
              						<p <%=chapter_id==chapter_json.optInt("id")?"class=\"on\"":""%>><a href="exercises.jsp?chapter_id=<%=chapter_json.optInt("id")%>"><%=chapter_json.optString("name")%></a></p>
              						<%
              					}
              				}
              			%>
            		</div>
          	</li>
         			<%
         		}
         	%>
        </ul>
        <script type="text/javascript" language="javascript">
			navList(12);
		</script>
      </div>
  </div>
 <div class="right_w">
    <%
    	if(chapter_id==0){
    		out.print("<div class=\"title_r\">习题库介绍</div> <div style=\"padding:8px;\"><p>"+exercises_introduce+"</p></div>");
    	}else{
    		int size=exeList.size();
    		%>
   <div class="title_r">习题库<em>共<%=counts%>题</em></div>
   <%
   	for(int i=0;i<size;i++){
   		Doc questionDoc=exeList.get(i);
   %>
   	 <div class="ex_one">
        <div class="ex_one_title"><em><%if(questionDoc.getIn("type")==0){out.print("单选");}else if(questionDoc.getIn("type")==1){out.print("多选");}else{out.print("判断题");}%></em><span><%=(i+1)+(pn*(pages-1))%>/<%=counts%></span><%=questionDoc.get("name")%></div>
        <ul>
           <%
           if(questionDoc.getIn("type")==0||questionDoc.getIn("type")==1){
	           List<Doc> opt_list=(List<Doc>)questionDoc.getO("opt_list");
	           if(opt_list!=null){
	        	   for(int j=0;j<opt_list.size();j++){
	        		   Doc optDoc=opt_list.get(j);
           %>
	            <li>
					<label>
						<div>
						<%=questionDoc.getIn("type")==0?"<input name=\""+i+"\" type=\"radio\" value=\"0\" class=\"input_radio\">":" <input name=\""+i+"\" type=\"checkbox\" value=\"1\" class=\"input_checkbox\">"%>

							<%
								String optString=BasicType.getOption(j)+"   ";
								if(optDoc.get("name")!=null&&!"".equals(optDoc.get("name"))){
									out.print("<p>"+optString+optDoc.get("name")+"</p>" );
									optString="";//当显示了abcd时第二个不显示
								}
							%>
							<%=optDoc.get("pic")!=null&&!"".equals(optDoc.get("pic"))?"<div class=\"da_an_img\">"+optString+"<img src=\""+optDoc.get("pic")+"\"></div>":""%>
						</div>
					</label>
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
    %>
	<!-- 分页 -->
     <ul class="pre">
      <%=page_size>0?"<li><a href=\""+(pages!=1?"exercises.jsp?pages="+(pages-1)+"&chapter_id="+chapter_id+"":"javascript:void(0);")+"\"><</a></li>":""%>
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
       		out.print("<li"+(i==pages?" class=\"active_pre\"":"")+"><a href=\"exercises.jsp?pages="+i+"&chapter_id="+chapter_id+"\">"+i+"</a></li>");
       	}
       %>
       <%=page_size>0?"<li><a href=\""+(pages!=page_size?"exercises.jsp?pages="+(pages+1)+"&chapter_id="+chapter_id+"":"javascript:void(0);")+"\">></a></li>":""%>
    </ul>
    		<%
    	}
    %>
  </div> 
  <div class="clear"></div> 
</div>
<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
