<%@page import="com.battsister.util.BasicType"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	int chapter_id=ru.getInt("chapter_id");//章节id
	Doc getDoc=null;//该章节的资料
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
									if(chapter_id==chapterDoc.getIn("id")){
										getDoc=new Doc();//说明该章节存在老师拥有的课程中
										getDoc.put("id",chapterDoc.getIn("id"));
										getDoc.put("name",chapterDoc.get("name"));
										getDoc.put("course_id",chapterDoc.getIn("course_id"));
										getDoc.put("video_path",chapterDoc.get("video_path"));
										getDoc.put("animation_path",chapterDoc.get("animation_path"));
										getDoc.put("pics",chapterDoc.get("pics"));
										getDoc.put("ppt_path",chapterDoc.get("ppt_path"));
										getDoc.put("word_path",chapterDoc.get("word_path"));
									}
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
	if(getDoc==null){//老师未购买该章节
		out.print("	<script>alert(\"您尚未购买该章节\");window.location.href='/login.jsp';</script>");
		return;
	}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>教学资源</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/front_style/js/jquery.min.js"></script>
<script src="/front_style/js/showList.js" type="text/javascript"></script>
<SCRIPT src="/front_style/js/ScrollPic.js" type=text/javascript></SCRIPT>
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
            	<h4 <%=getDoc.getIn("course_id")==course_json.optInt("id")?"class=\"selected\"":""%>><%=course_json.optString("name")%></h4>
            		<div class="list-item<%=getDoc.getIn("course_id")==course_json.optInt("id")?"":" none"%>">
              			<%
              				if(chapter_array!=null){
              					for(int j=0;j<chapter_array.size();j++){
              						JSONObject chapter_json=chapter_array.getJSONObject(j);
              						%>
              						<p <%=chapter_id==chapter_json.optInt("id")?"class=\"on\"":""%>><a href="teaching_resources.jsp?chapter_id=<%=chapter_json.optInt("id")%>"><%=chapter_json.optString("name")%></a></p>
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
  	 <div class="title_r"><%=getDoc.get("name")%></div>
  	 <div class="right_teach">
     	<div class="default">ppt课件</div>  
     </div>
     <div class="right_teach">
     	<div class="blk_29">
            <div class="LeftBotton" id="LeftArr"></div>
            <div class="Cont" id="ISL_Cont_1"><!-- 图片列表 begin -->
            	<%
            		if(getDoc.get("ppt_path")!=null&&!"".equals(getDoc.get("ppt_path"))){
            			JSONArray ppt_array=JSONArray.fromObject(getDoc.get("ppt_path"));
            			if(ppt_array!=null){
            				for(int i=0;i<ppt_array.size();i++){
            					JSONObject ppt_json=ppt_array.getJSONObject(i);
            					%>
            					<div class="box">
                  			 		 <a class="imgBorder" href="#" target=_blank >
                  			 		 <img height=84  src="<%=BasicType.getWordPptPath(ppt_json.optString("pic_dir"),0)%>" width=124 border=0></a> 
                    				 <p><a href="#" target=_blank>ppt</a></p>
               					</div>
            					<%
            				}
            			}
            		}else if(getDoc.get("word_path")!=null&&!"".equals(getDoc.get("word_path"))){
            			
            		}
            	%>
                <!-- 
                <div class="box">
                    <A class="imgBorder" href="#" target=_blank><img height=84  src="images/tu.jpg" width=124 border=0></A> 
                    <P><A href="#" target=_blank>2</A></P>
                </div>
                <div class="box">
                    <A class="imgBorder" href="#" target=_blank><img height=84   src="images/tu.jpg" width=124 border=0></A> 
                    <P><A href="#" target=_blank>3</A></P>
                </div>
                <div class="box">
                    <A class="imgBorder" href="#" target=_blank><img height=84   src="images/tu.jpg" width=124 border=0></A> 
                    <P><A href="#" target=_blank>4</A></P>
                </div>
                <div class="box">
                    <A class="imgBorder" href="#" target=_blank><img height=84   src="images/tu.jpg" width=124 border=0></A> 
                    <P><A href="#" target=_blank>5</A></P>
                </div> -->
            	<div class="clear"></div>
            <!-- 图片列表 end --></div>
            <div class=RightBotton id=RightArr></div>
            </div>
            <SCRIPT language="javascript" type=text/javascript>
                    <!--//--><![CDATA[//><!--
                    var scrollPic_02 = new ScrollPic();
                    scrollPic_02.scrollContId   = "ISL_Cont_1"; //内容容器ID
                    scrollPic_02.arrLeftId      = "LeftArr";//左箭头ID
                    scrollPic_02.arrRightId     = "RightArr"; //右箭头ID
            
                    scrollPic_02.frameWidth     = 908;//显示框宽度
                    scrollPic_02.pageWidth      = 152; //翻页宽度
            
                    scrollPic_02.speed          = 10; //移动速度(单位毫秒，越小越快)
                    scrollPic_02.space          = 10; //每次移动像素(单位px，越大越快)
                    scrollPic_02.autoPlay       = false; //自动播放
                    scrollPic_02.autoPlayTime   = 3; //自动播放间隔时间(秒)
            
                    scrollPic_02.initialize(); //初始化
                                        
                    //--><!]]>
            </SCRIPT>
     </div>
     <div class="right_con">
     	<h5>更多相关资料</h5>
        <ul class="ziliao">
        	<li class="mr_15">
            	<div class="ziliao_img"><img src="images/tu.jpg"></div>
           	  	<p>图片</p>
            </li>
            <li class="mr_15">
            	<div class="ziliao_img"><img src="images/tu.jpg"></div>
            	<p>视频</p>
            </li>
            <li>
            	<div class="ziliao_img"><img src="images/tu.jpg"></div>
            	<p>动画</p>
            </li>
        	<div class="clear"></div>
        </ul>
     </div>
  </div>
  <div class="clear"></div>
</div>

<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>

