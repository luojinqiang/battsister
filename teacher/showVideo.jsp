<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page import="com.battsister.util.SetupUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <script type="text/javascript" src="/front_style/js/jquery.min.js"></script>
	<!-- video5 -->
    <link href="/front_style/video5/css/video-js.min.css" rel="stylesheet">
    <script src="/front_style/video5/js/video.min.js"></script>
    <script>
        videojs.options.flash.swf = "/front_style/video5/js/video-js.swf";
    </script>
  </head>
  <%
  	RequestUtil ru=new RequestUtil(request);
  	String filePath=ru.getString("filePath");
  %>
  <body style="text-align: center;">
  <div style="margin:0 auto; width:1300px;height:500px;">
    <video id="example_video1" class="video-js vjs-default-skin vjs-big-play-centered"
                                       controls
                                       preload="true" width="1300" height="600"
                                       data-setup='{"autoplay":true}'>
                                    <source src="<%=SetupUtil.getAllAddress(filePath)%>"
                                            type='video/mp4'/>
                                </video>
                                </div>
  </body>
</html>
