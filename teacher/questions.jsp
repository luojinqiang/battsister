<%@page import="com.battsister.util.BasicType"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
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
	<jsp:param value="1" name="type"/>
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
   	   <div class="q_con">
            <div class="q_top">
                <div class="ex_user"><img src="images/user.jpg"><span>1</span></div>
                <div class="q_word">
                    <h4>张帆</h4>
                    <div><em>2016-02-12 13:00</em></div>
                </div>
                <div class="rep_botton"><a onclick="open_zzjs_net(this,'zzjs_net1')">回复</a></div>
                <div class="clear"></div>
            </div>
            <div class="q_answer">1、离合器和油门：起步行车换2档时候，可以缓慢送离合器的时候缓慢踩油门吗？这样车子会有动力吗？2、车子处于3,4档快速行驶时候，急踩离合器到底，意味着车子处于“空挡”下，此时车子没有主动制动力吗？3、车子起步行车，从1档换到2档到3档到4档等，离合器缓慢松开，油门缓慢加深，能不能处于离合器半离合半松开状态进行油门加速？4、换挡起步要踩离合器，其余时候是不是不需要踩离合器，左脚可以完全松开？</div>
            <div id="zzjs_net1" class="q_shuru" style="display:none"><textarea name="" cols="" rows="" class="textarea_q"  placeholder="请直接输入您的答案"></textarea></div>
         </div>
           <div class="q_con">
                <div class="q_top">
                    <div class="ex_user"><img src="images/user.jpg"></div>
                    <div class="q_word">
                        <h4>张帆</h4>
                        <div><em>2016-02-12 13:00</em></div>
                    </div>
                    <div class="re_botton"><a href="#">已回复</a></div>
                    <div class="clear"></div>
                </div>
                <div class="q_answer">化油器有哪几种装置？作用是什么？</div>
               <div class="q_reply">
                    <div class="q_reply_top">
                        <div class="q_reply_user"><img src="images/user1.jpg"></div>	
                        <div class="q_reply_title">我回复的</div>
                        <div class="clear"></div>
                    </div>
                    <div class="q_reply_word">化油器的构造可分五种装置：答：起动装置；怠速装置；中等负荷装置；全负荷装置；加速装置。化油器的作用是：根据发动机在不同情况下的需要，将汽油气化，并与空气按一定比例混合成可燃混合气。及时适量进入气缸。</div>
               </div>
         </div>
          <div class="q_con">
                <div class="q_top">
                    <div class="ex_user"><img src="images/user.jpg"><span>3</span></div>
                    <div class="q_word">
                        <h4>张帆</h4>
                        <div><em>2016-02-12 13:00</em></div>
                    </div>
                    <div class="rep_botton"><a onclick="open_zzjs_net(this,'zzjs_net2')">回复</a></div>
                    <div class="clear"></div>
                </div>
                <div class="q_answer">3、车子起步行车，从1档换到2档到3档到4档等，离合器缓慢松开，油门缓慢加深，能不能处于离合器半离合半松开状态进行油门加速？</div>
                 <div id="zzjs_net2" class="q_shuru" style="display:none"><textarea name="" cols="" rows="" class="textarea_q"  placeholder="请直接输入您的答案"></textarea></div>
         </div> 
  </div>
  <div class="clear"></div>
</div>
<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
