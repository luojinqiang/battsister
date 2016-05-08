<%@page import="com.battsister.teacher.TeacherApi"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.battsister.util.BasicType"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	String action=ru.getString("action");
	if("save".equals(action)){
		TeacherApi teacherApi=new TeacherApi();
		out.print(teacherApi.replyStudent(request));
		return;
	}
	if("del".equals(action)){//删除问题
		TeacherApi teacherApi=new TeacherApi();
		out.print(teacherApi.delQuestion(request));
		return;
	}
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
								Doc chapterDoc=selectic.Get_Doc("id,name,course_id,video_path,animation_path,pics,ppt_path,word_path", "bs_chapter", " where id=? ","mysqlss",new Object[]{hasChapterArray.optJSONObject(j).optInt("chapter_id")});
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
//回复内容
List valueList=new ArrayList();
valueList.add(teacher_id);
int pages=ru.getInt("pages");
pages=pages==0?1:pages;
String table="bs_question a left join bs_students b on a.student_id=b.id";
String file="a.id,a.student_id,a.content,a.add_time,a.isdel,a.is_read,b.name";
String wheres=" a.isdel=0 and a.teacher_id=? ";
int pn=5;
int counts=selectic.Get_count("a.id", table, wheres,"mysqlss",valueList);
int page_size=selectic.getPageSize(counts, pn);
List<Doc> questionList=selectic.Get_List(pages, pn, counts, table, wheres, file, "order by a.is_read asc,a.add_time desc ", "mysqlss",valueList);
if(questionList!=null){
	for(Doc doc:questionList){
		List<Doc> replyList=selectic.Get_List("id,question_id,content,add_time,is_read,reply_type", "bs_question_reply", " where isdel=0 and question_id=? order by add_time asc  ","mysqlss",new Object[]{doc.getIn("id")});
		JSONArray replyArray=new JSONArray();
		if(replyList!=null){
			for(Doc replyDoc:replyList){//更新是否有学生回复未读的
				if(replyDoc.getIn("is_read")==0&&replyDoc.getIn("reply_type")==0){
					doc.put("is_read",0);
				}
				JSONObject replyJson=new JSONObject();
				replyJson.put("id",replyDoc.getIn("id"));
				replyJson.put("question_id",replyDoc.getIn("question_id"));
				replyJson.put("content",replyDoc.get("content"));
				replyJson.put("add_time",replyDoc.getIn("add_time"));
				replyJson.put("reply_type",replyDoc.getIn("reply_type"));
				replyArray.add(replyJson);
			}
		}
		doc.put("replyArray", replyArray);
	}
}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>学生提问</title>
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
<!-- 引入头部 -->
<jsp:include page="head.jsp">
	<jsp:param value="2" name="type"/>
</jsp:include>
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
              						<p ><a href="teaching_details.jsp?chapter_id=<%=chapter_json.optInt("id")%>"><%=chapter_json.optString("name")%></a></p>
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
            <h5><a href="examination_system.jsp">考试记录</a></h5>
          </li>
          <li>
            <h5 class="selected"><a href="questions.jsp">学生提问</a></h5>
          </li>
        </ul>
        <script type="text/javascript" language="javascript">
			navList(12);
		</script>
      </div>
  </div>
  <div class="right_w">
  	  <div class="title_r">学生提问</div>
  	  <%
  	  	if(questionList!=null){
  	  		for(Doc doc:questionList){
  	  			%>
  	  	<div class="q_con">
            <div class="q_top">
                <div class="ex_user"><img src="/front_style/images/user01.png"><%=doc.getIn("is_read")==0?"<span>1</span>":""%></div>
                <div class="q_word">
                    <h4><%=doc.get("name")%></h4>
                    <div><em><%=AjaxXml.timeStamp2Date(doc.getIn("add_time"),"YY04-MM-DD HH:MI:SS")%></em></div>
                </div>
               <!--  <div class="rep_botton"><a onclick="open_zzjs_net(this,'zzjs_net1')">回复</a></div> -->
                <div class="clear"></div>
            </div>
            <div class="q_answer"><%=doc.get("content")%></div>
            <%
            	if(doc.get("replyArray")!=null&&!"".equals(doc.get("replyArray"))){
            		JSONArray replyArray=JSONArray.fromObject(doc.get("replyArray"));
            		if(replyArray!=null){
            			for(int i=0;i<replyArray.size();i++){
            				JSONObject replyJson=replyArray.getJSONObject(i);
            				if(replyJson!=null){
            					%>
            				<div class="q_reply">
                   				 <div class="q_reply_top">
                       			 <div class="q_reply_user"><img src="/front_style/images/user01.png"></div>	
                        		 <div class="q_reply_title"><%=replyJson.optInt("reply_type")==0?doc.get("name")+"追问":"我回复的"%></div>
                        		 <div class="clear"></div>
                    			</div>
                   				 <div <%=replyJson.optInt("reply_type")==0?"":"class=\"q_reply_word\"class=\"q_answer\""%>><%=replyJson.optString("content")%></div>
              				</div>
            					<%
            				}
            			}
            		}
            	}
            %>
            <div id="zzjs_net1" class="q_shuru"><textarea name="content" cols="" rows="" class="textarea_q"  placeholder="请直接输入您的回复内容"></textarea></div>
           <div class="rep_botton"><a onclick="reply(this,'<%=doc.getIn("id")%>');">回复</a></div>
           <div class="del_botton"><a href="javascript:void(0)" onclick="delQuestion('<%=doc.getIn("id")%>',this)">删除</a></div>
                <div class="clear"></div>
         </div>
  	  			<%
  	  		}
  	  	}
  	  %>
  	  <!-- 分页 -->
     <ul class="pre">
      <%=page_size>0?"<li><a href=\""+(pages!=1?"questions.jsp?pages="+(pages-1):"javascript:void(0);")+"\"><</a></li>":""%>
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
       		out.print("<li"+(i==pages?" class=\"active_pre\"":"")+"><a href=\"questions.jsp?pages="+i+"\">"+i+"</a></li>");
       	}
       %>
       <%=page_size>0?"<li><a href=\""+(pages!=page_size?"questions.jsp?pages="+(pages+1):"javascript:void(0);")+"\">></a></li>":""%>
    </ul>
  </div>
  <div class="clear"></div>
</div>
<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
    function reply(obj, id) {
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
                    window.location.href='questions.jsp';
                } else {
                    $(obj).attr('onclick', 'userSave(this);').html('回复');
                }
            }, 500);
        },'json');
    }
    
    function delQuestion(id,obj){
    	if(confirm("你确定要删除该问题吗？")){
    		$.ajax({ 
                dataType: "json",
                type: "post", 
                url: "questions.jsp",
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
