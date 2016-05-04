<%@page import="com.battsister.util.SetupUtil"%>
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
								Doc chapterDoc=selectic.Get_Doc("id,name,course_id,video_path,animation_path,pics,ppt_path,word_path", "bs_chapter", " where id=?","mysqlss",new Object[]{hasChapterArray.optJSONObject(j).optInt("chapter_id")});
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
<title>我要授课</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/front_style/js/jquery.min.js"></script>
<script src="/front_style/js/showList.js" type="text/javascript"></script>
<script src="/front_style/js/ScrollPic.js" type=text/javascript></script>
<script src="/front_style/src/galleria.js"></script>

<!-- video5 -->
<link href="/front_style/video5/css/video-js.min.css" rel="stylesheet">
<script src="/front_style/video5/js/video.min.js"></script>
<script>
    videojs.options.flash.swf = "/front_style/video5/js/video-js.swf";
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
         <h3>课程目录</h3>
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
              						<p <%=chapter_id==chapter_json.optInt("id")?"class=\"on\"":""%>><a href="teaching_details.jsp?chapter_id=<%=chapter_json.optInt("id")%>"><%=chapter_json.optString("name")%></a></p>
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
            <h5><a href="examination_system.jsp">考试系统</a></h5>
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
        <div class="title_r"><%=getDoc.get("name")%>
        </div>
        <div class="right_teach">
            <div class="right_con">
                <div class="one_t"><h5>PPT资料</h5></div>
                <ul class="ziliao">
                    <%
                        if (getDoc.get("ppt_path") != null && !"".equals(getDoc.get("ppt_path"))) {
                            JSONArray ppt_array = JSONArray.fromObject(getDoc.get("ppt_path"));
                            if (ppt_array != null) {
                                for (int i = 0; i < ppt_array.size(); i++) {
                                    JSONObject ppt_json = ppt_array.getJSONObject(i);
                    %>
                    <li class="mr_15">
                        <div class="ziliao_img" style="width: 268px;"><a href="../pdf/web/viewer.html?file=<%=ppt_json.optString("pic_dir")%>"
                                                   target="_blank"><img src="../public/images/ppt.png" style="width: 154px;height: 154px;margin-left: 57px;"/></a></div>
                        <p><%=ppt_json.optString("title")%>
                        </p>
                    </li>
                    <%
                                }
                            }
                        }
                        out.print(" <div class=\"clear\"></div>");
                    %>
                </ul>
            </div>
            <div class="right_con">
                <div class="two_t"><h5>word资料</h5></div>
                <ul class="ziliao">
                    <%
                        if (getDoc.get("word_path") != null && !"".equals(getDoc.get("word_path"))) {
                            JSONArray word_array = JSONArray.fromObject(getDoc.get("word_path"));
                            if (word_array != null) {
                                for (int i = 0; i < word_array.size(); i++) {
                                    JSONObject word_json = word_array.getJSONObject(i);
                    %>
                    <li class="mr_15">
                        <div class="ziliao_img"><a
                                href="../pdf/web/viewer.html?file=<%=word_json.optString("pic_dir")%>"
                                target="_blank"><img src="../public/images/word.png" style="width: 154px;height: 154px;margin-left: 57px;"/></a></div>
                        <p><%=word_json.optString("title")%>
                        </p>
                    </li>
                    <%
                                }
                            }
                        }
                        out.print(" <div class=\"clear\"></div>");
                    %>
                </ul>
            </div>
            <div class="right_con">
                <div class="three_t"><h5>视频、动画资料</h5></div>
                <ul class="ziliao">
                    <%
                        if (getDoc.get("video_path") != null && !"".equals(getDoc.get("video_path"))) {
                            JSONArray video_array = JSONArray.fromObject(getDoc.get("video_path"));
                            if (video_array != null) {
                                for (int i = 0; i < video_array.size(); i++) {
                                    JSONObject video_json = video_array.getJSONObject(i);
                    %>
                    <li class="mr_15">
                        <div class="ziliao_img">
                            <div class="p_shipin">
                                <video id="really-cool-video" class="video-js vjs-default-skin vjs-big-play-centered"
                                       controls
                                       preload="auto" width="268" height="154"
                                       data-setup='{}'>
                                    <source src="<%=SetupUtil.getAllAddress(video_json.optString("filePath"))%>"
                                            type='video/mp4'/>
                                </video>
                            </div>
                        </div>
                        <p><%=video_json.optString("title")%>
                        </p>
                    </li>
                    <%
                                }
                            }
                        }
                        out.print(" <div class=\"clear\"></div>");
                    %>
                    <%
                        if (getDoc.get("animation_path") != null && !"".equals(getDoc.get("animation_path"))) {
                            JSONArray animation_array = JSONArray.fromObject(getDoc.get("animation_path"));
                            if (animation_array != null) {
                                for (int i = 0; i < animation_array.size(); i++) {
                                    JSONObject animation_json = animation_array.getJSONObject(i);
                    %>
                    <li class="mr_15">
                        <div class="ziliao_img">
                            <div class="p_shipin">
                                <video id="really-cool-video" class="video-js vjs-default-skin vjs-big-play-centered"
                                       controls
                                       preload="auto" width="268" height="154"
                                       data-setup='{}'>
                                    <source src="<%=SetupUtil.getAllAddress(animation_json.optString("filePath"))%>"
                                            type='video/mp4'/>
                                </video>
                            </div>
                        </div>
                        <p><%=animation_json.optString("title")%>
                        </p>
                    </li>
                    <%
                                }
                            }
                        }
                        out.print(" <div class=\"clear\"></div>");
                    %>
                </ul>
            </div>
            <div class="right_con" id="content">
                <div class="four_t"><h5>图片资料</h5></div>
                <ul class="ziliao">
                    <%
                        if (getDoc.get("pics") != null && !"".equals(getDoc.get("pics"))) {
                            JSONArray pic_array = JSONArray.fromObject(getDoc.get("pics"));
                            if (pic_array != null) {
                                for (int i = 0; i < pic_array.size(); i++) {
                    %>
                    <li class="mr_15">
                        <div class="ziliao_img"><a href="javascript:void(0)"><img src="<%=pic_array.optString(i)%>"/></a></div>
                    </li>
                    
                    <%
                                }
                            }
                        }
                        out.print(" <div class=\"clear\"></div>");
                    %>
                </ul>
                 <div id="galleria"></div>
            </div>
        </div>
    </div>
  <div class="clear"></div>
</div>
<script type="text/javascript">
// Load theme
Galleria.loadTheme('/front_style/src/themes/lightbox/galleria.lightbox.js');
$('#galleria').galleria({
	   data_source: '#content',
	   extend: function() {
			this.bind(Galleria.LOADFINISH, function(e) {
				$(e.imageTarget).click(this.proxy(function(e) {
					e.preventDefault();
					this.next();
				}))
			})
		},
	   keep_source: true,
	   data_config: function(img) {
		   return {
			   description: $(img).next('.caption').html()
		   }
	   }
   });
</script>

<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
