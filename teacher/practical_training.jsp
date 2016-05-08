<%@page import="com.battsister.util.SetupUtil" %>
<%@page import="com.battsister.util.BasicType" %>
<%@page import="net.sf.json.JSONObject" %>
<%@page import="net.sf.json.JSONArray" %>
<%@page import="com.baje.sz.util.Doc" %>
<%@page import="com.baje.sz.util.Selectic" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%
    RequestUtil ru = new RequestUtil(request);
    int course_id = ru.getInt("course_id");
    JSONObject getJson = null;//选择的课程
    Object teacher_id = session.getAttribute("teacher_id");
    Selectic selectic = new Selectic();
    if (teacher_id == null) {
        out.print("	<script>alert(\"请先登录\");window.location.href='/login.jsp';</script>");
        return;
    }
    Doc teacherDoc = selectic.Get_Doc("id,course_flag", "bs_teachers", " where id=? ", "mysqlss", new Object[]{teacher_id});
    if (teacherDoc == null || teacherDoc.isEmpty()) {
        out.print("	<script>alert(\"请先登录\");window.location.href='/login.jsp';</script>");
        return;
    }
    JSONArray course_array = new JSONArray();
    if (teacherDoc.get("course_flag") != null && !"".equals(teacherDoc.get("course_flag"))) {
        JSONArray hasArray = JSONArray.fromObject(teacherDoc.get("course_flag"));
        if (hasArray != null) {
            for (int i = 0; i < hasArray.size(); i++) {
                JSONObject course_json = new JSONObject();
                JSONObject hasJson = hasArray.optJSONObject(i);
                if (hasJson != null) {
                    Doc coursedDoc = selectic.Get_Doc("id,name,introduce,pic,practical_word_path,practical_video_path", "bs_course", " where id=? ", "mysqlss", new Object[]{hasJson.optInt("course_id")});
                    if (coursedDoc != null && !coursedDoc.isEmpty()) {
                        course_json.put("id", coursedDoc.getIn("id"));
                        course_json.put("name", coursedDoc.get("name"));
                        course_json.put("introduce", coursedDoc.get("introduce"));
                        course_json.put("pic", coursedDoc.get("pic"));
                        course_json.put("practical_word_path", coursedDoc.get("practical_word_path"));
                        course_json.put("practical_video_path", coursedDoc.get("practical_video_path"));
                        course_array.add(course_json);
                    }
                }
                if (course_id == 0) {
                    if (i == 0) {//第一次进来
                        getJson = course_json;
                    }
                } else {//选择课程后
                    if (course_id == course_json.optInt("id")) {
                        getJson = course_json;
                    }
                }
            }
        }
    }
    if (getJson == null) {
        out.print("	<script>alert(\"您尚未购买课程\");window.location.href='/login.jsp';</script>");
        return;
    }
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>我要实训</title>
    <meta name="keywords" content="#"/>
    <meta name="description" content="#"/>
    <link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/front_style/js/jquery.min.js"></script>
    <script src="/front_style/js/showList.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/front_style/ppt_word/css/base.css">
    <!-- video5 -->
    <link href="/front_style/video5/css/video-js.min.css" rel="stylesheet">
    <script src="/front_style/video5/js/video.min.js"></script>
    <script>
        videojs.options.flash.swf = "/front_style/video5/js/video-js.swf";
    </script>
</head>
<body>
<!--=== Header ===-->
<!-- 引入头部 -->
<jsp:include page="head.jsp">
    <jsp:param value="3" name="type"/>
</jsp:include>
<!--=== End Header ===-->
<!-- 引入第二个头部 -->
<%@include file="head1.jsp" %>

<div class="container">
    <div class="left_nav">
        <div class="operate">
            <ul id="juheweb">
                <h3>我的实训</h3>
                <%
                    for (int i = 0; i < course_array.size(); i++) {
                %>
                <li onclick="hrefUrl('<%=course_array.getJSONObject(i).optInt("id")%>');" id="l_<%=course_array.getJSONObject(i).optInt("id")%>">
                    <h4 <%=getJson.optInt("id") == course_array.getJSONObject(i).optInt("id") ? "class=\"selected\"" : ""%>>
                        <%=course_array.getJSONObject(i).optString("name")%>
                    </h4>

                    <div class="list-item <%=getJson.optInt("id") == course_array.getJSONObject(i).optInt("id") ? "" : "none"%>">
                        <%
                            String practical_word_path = course_array.getJSONObject(i).optString("practical_word_path");
                            if (practical_word_path != null && !"".equals(practical_word_path)) {
                                JSONArray pathArray = JSONArray.fromObject(practical_word_path);
                                JSONObject path_json;
                                if (pathArray != null) {
                                    for (int m = 0; m < pathArray.size(); m++) {
                                        path_json = pathArray.getJSONObject(m);
                                        out.print("<p><a href=\"/pdf/web/viewer.html?file=" + path_json.optString("word_dir") + "\" target=\"_blank\">" + path_json.optString("title") + "</a></p>");
                                    }
                                }
                        %>
                    </div>
                </li>
                <%
                        }
                    }
                %>
            </ul>
            <script type="text/javascript" language="javascript">
                navList(12);
            </script>
        </div>
    </div>
    <div class="right_w">
        <div class="project_w">
            <div class="title_c"><%=getJson.opt("name")%>
            </div>
            <%--<div class="wrapper">
                <div class="doc" id="doc" style="margin-top: -20px;width: 85%;margin-left: 10px;"></div>
            </div>--%>
            <div class="project_con">
                <h5>更多相关资料</h5>
                <ul class="ziliao">
                    <%
                        if (getJson.optString("practical_video_path") != null && !"".equals(getJson.optString("practical_video_path"))) {
                            JSONArray video_array = JSONArray.fromObject(getJson.optString("practical_video_path"));
                            if (video_array != null) {
                                for (int j = 0; j < video_array.size(); j++) {
                                    JSONObject video_json = video_array.getJSONObject(j);
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
                    %>
                    <div class="clear"></div>
                </ul>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>
<script>
    function hrefUrl(course_id) {
        window.location.href = 'practical_training.jsp?course_id=' + course_id;
    }
</script>
</body>
</html>