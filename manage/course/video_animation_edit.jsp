<%@page import="com.battsister.util.SetupUtil"%>
<%@page import="com.battsister.model.Course"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.battsister.util.BasicType"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.baje.sz.util.*" %>
<%@ page import="com.baje.sz.ajax.*" %>
<%@ page import="com.battsister.admin.sys.*" %>
<%@ include file="../ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    if (current_flags.indexOf(",2001,") < 0) {
        response.sendRedirect("../error.jsp?left=yonghu");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    int type=ru.getInt("type");//1是实训视频，上传，2是章节视频上传，3是章节动画上传
    int id = ru.getInt("id");
    if(action.equals("save1")){//是实训视频
    	Course course=new Course();
    	out.print(course.editVideo(request, user_id, user_name));
    	return; 
    }
    if (action.equals("save2")) {//章节视频上传
    	Chapter Chapter=new Chapter();
    	out.print(Chapter.editVideo(request, user_id, user_name));
    	return; 
    }
    if(action.equals("save3")){//章节动画上传
    	Chapter Chapter=new Chapter();
    	out.print(Chapter.editAnimation(request, user_id, user_name));
    	return; 
    }
    if(type==1){
    	action="save1";
    }else if(type==2){
    	action="save2";
    }else{
    	action="save3";
    }
	String video_path="",name="";
	String titles=ru.getString("titles");
	String filePaths=ru.getString("filePaths");
			
    Doc doc = null;
    if(type==1){//实训视频
    	doc=utildb.Get_Doc("id,practical_video_path as 'video_path',name", "bs_course", " where id=? and isdel=0", "mysqlss", new Object[]{id});
    }else if(type==2){//章节视频上传
    	doc=utildb.Get_Doc("id,video_path,name", "bs_chapter", " where id=? and isdel=0", "mysqlss", new Object[]{id});
    }else{//章节动画上传
    	doc=utildb.Get_Doc("id,animation_path as 'video_path',name", "bs_chapter", " where id=? and isdel=0", "mysqlss", new Object[]{id});
    }
    if (doc == null) {
        out.print("信息不存在");
        return;
    } else {
    	video_path=doc.get("video_path");
    	name=doc.get("name");
    }
    JSONArray dirArray=new JSONArray();
    JSONObject backjson=BasicType.getVideoAnimationFiles();
    if(backjson!=null&&backjson.optString("courseDirArray")!=null&&!"".equals(backjson.optString("courseDirArray"))){
    	dirArray=backjson.optJSONArray("courseDirArray");
    	dirArray=dirArray==null?new JSONArray():dirArray;
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>table</title>
    <link href="../css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="../css/base.css" rel="stylesheet" type="text/css"/>
      <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script language="javascript" src='../js/sys.js'></script>
    <script type='text/javascript' src='/public/js/operamasks/operamasks-ui.min.js'></script>
     <link href="/public/video5/css/video-js.min.css" rel="stylesheet"/>
	<script  type='text/javascript'src="/public/video5/js/video.min.js"></script>
       <style type="text/css">
        .del {
            bottom: 0;
            height: 22px;
            width: 200px;
            line-height: 22px;
            text-align: center;
            background: #000;
            color: #fff;
            filter: alpha(opacity=70);
            -moz-opacity: 0.7;
            -khtml-opacity: 0.7;
            opacity: 0.7;
            cursor: pointer;
            margin-top: 3px;
        }
    </style>
    <script type="text/javascript">
    	var dirArray=eval('<%=dirArray%>');
    	function getChapterDirByDir(obj){
    		var dirName=$(obj).val();
    		for(var i=0;i<dirArray.length;i++){
    			if(dirArray[i].courseDirName==dirName){
    				var chapterDirArray=dirArray[i].chapterDirArray;
    				$("#chapterDir").empty();
    				if(chapterDirArray.length>0){
    					 $("#chapterDir").append("<option value=\"0\">--请选择文件夹二--</option>");
    					 for(var s=0;s<chapterDirArray.length;s++){
    						 $("#chapterDir").append("<option value=\""+chapterDirArray[s].chapterDirName+"\">"+chapterDirArray[s].chapterDirName+"</option>"); 
    					 }
    				}else{
    					 $("#chapterDir").append("<option value=\"0\">--暂无文件夹--</option>");
    				}
    			}
    		}
    	} 
    	function getFilesByDir(obj){
    		var chapterDir=$(obj).val();
    		for(var i=0;i<dirArray.length;i++){
    			var chapterDirArray=dirArray[i].chapterDirArray;
    			if(chapterDirArray!=undefined){
    				for(var s=0;s<chapterDirArray.length;s++){
    					if(chapterDirArray[s].chapterDirName==chapterDir){
    						var files=chapterDirArray[s].fileArray;
    						$("#fileName").empty();
    	    				if(files.length>0){
    	    					 $("#fileName").append("<option value=\"0\">--请选择文件--</option>");
    	    					 for(var j=0;j<files.length;j++){
    	    						 $("#fileName").append("<option value=\""+files[j].filePath+"\">"+files[j].fileName+"</option>"); 
    	    					 }
    	    				}else{
    	    					 $("#fileName").append("<option value=\"0\">--暂无文件--</option>");
    	    				}
    					}
    				}
    			}
    		}
    	} 
    </script>
    <script type="text/javascript">
        function usersave() {
            $("#tjbutton").attr("disabled", true);
            $("#tisspan").html("<img src='../images/loading.gif' />提交中，请稍候……");
            var title_str="";
            var filePath_str="";
            $("input[name=filePath]").each(function (){
            	filePath_str+=","+$(this).val();
            });
            $("input[name=title]").each(function (){
            	title_str+=","+$(this).val();
            });
            $.ajax({
                dataType: "json",
                type: "post",
                url: "video_animation_edit.jsp",
                data: $("#form1").serialize()+"&filePath_str="+filePath_str+"&title_str="+title_str,
                success: function (msg) {
                    if (msg.type) {
                        window.parent.art.dialog({
                            id: 'tisID',
                            content: msg.msg,
                            lock: true,
                            icon: "succeed",
                            cancelVal: '确定',
                            cancel: function () {
                                window.parent.location.reload();
                                window.parent.art.dialog({id: "tisID"}).close();
                                window.parent.art.dialog({id: "user"}).close();
                            }
                        });
                    } else {
                        window.parent.art.dialog.alert(msg.msg);
                        $("#tjbutton").attr("disabled", false);
                        $("#tisspan").html("");
                    }

                }
            });
        }

    </script>
</head>
<body class="ifr">
<div id="dd" style="padding:5px;">
    <div class="box_input">
        <form id="form1" name="form1" method="post" action="">
            <input name="id" id="id" type="hidden" value="<%=id%>"/>
            <input name="action" id="action" type="hidden" value="<%=action%>"/>
            	      <ul class="row2 clearfix">
                <li>
                       <h4 style="margin-bottom:20px;"><%=name%>--<%=type==1||type==2?"视频":"动画"%>上传</h4>
                </li>
                   <li>
                       <h4 style="margin-bottom:20px;color: red;">请确保视频已上传到服务器</h4>
                </li>
            </ul>
            <ul class="row1 clearfix">
            <li>
            文件夹一：
            <select name="dirName" onchange="getChapterDirByDir(this)">
            <option value="">--请选择文件夹--</option>
           <%
           	if(dirArray!=null){
           		for(int i=0;i<dirArray.size();i++){
           			JSONObject json=dirArray.getJSONObject(i);
           			%>
           			<option value="<%=json.optString("courseDirName")%>"><%=json.optString("courseDirName")%></option>
           			<%
           		}
           	}
           %>
           </select>
             </li>
             <li>
              文件夹二：
           <select name="chapterDir" id="chapterDir" onchange="getFilesByDir(this)">
            <option value="">--请选择文件夹二--</option>
           	</select>
             </li>
             <li>
            选择文件：
            <select name="fileName" id="fileName">
            <option value="">--请选择文件--</option>
           	</select>
             </li>
           </ul>
           <ul class="row2 clearfix">
           	 <li>
            	请输入标题：
            	<input name="key" type="text" style="width:200px;"/>
            </li>
              <li>
             	<button type="button" onclick="addVideo();">添加视频</button>
             </li>
           </ul>
           <hr />
           <ul class="row1 clearfix" id="videos">
           <%
	           if(video_path==null||"".equals(video_path)){
	           		video_path="[]";
	           }
           		JSONArray video_array=JSONArray.fromObject(video_path);
           		video_array=video_array==null?new JSONArray():video_array;
          		if(filePaths!=null&&titles!=null){
              		String ss[]=filePaths.split(",");
              		String ts[]=titles.split(",");
              		if(ss!=null&&ts!=null){
              			for(int i=0;i<ss.length;i++){
              				if(!"".equals(ss[i])){
              					JSONObject json=new JSONObject();
                  				json.put("filePath",ss[i]);
       						if(ts.length>i){
       						json.put("title",ts[i]);
       						}
       						video_array.add(json);
              				}
              			}
              		}
              	}
           		for(int i=0;i<video_array.size();i++){
           			JSONObject json=video_array.getJSONObject(i);
           				%>
           				<li>
           			<span>
           		标题：<input type="text" name="title" style="margin-bottom:10px;margin-top:10px;width:180px;" value="<%=json.optString("title")%>"/>
           			<video id="really-cool-video" class="video-js vjs-default-skin vjs-big-play-centered" controls
 			preload="auto" width="220" height="132" poster="https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png"
 		data-setup='{}'>
		<source src="<%=SetupUtil.getAllAddress(json.optString("filePath"))%>" type='video/mp4' />
	</video>
	<input type="hidden" name="filePath" value="<%=json.optString("filePath")%>"/>
	<div class="del">
	删除
</div>
</span>
     </li>
         	<%
         	}
         %>
           </ul>
            <div class="row_btn" style="margin-top:20px;">
                <button type="button" id="tjbutton" onclick="usersave()">确定提交</button>
                <span id="tisspan"></span>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
	$(document).ready(function (){
		 $('div .del').off('click').on('click', function () {
             $(this).parent().remove();
         });
	});
	
	function addVideo(){
		if($('#fileName').val()==''||$('#fileName').val()=='0'){
			 window.parent.art.dialog.alert('请选择添加的视频');
			 return;
		} 
		 if($('input[name=key]').val()==''){
			 window.parent.art.dialog.alert('请输入视频的标题');
			 return;
		}
         var titles='<%=titles%>'+','+$('input[name=key]').val();
         var filePaths='<%=filePaths%>'+','+$('#fileName').val();
         window.location.href='video_animation_edit.jsp?id=<%=id%>&titles='+titles+'&filePaths='+filePaths+'&type=<%=type%>';
	}
</script>
<!--End Sidebar--> </body>
</html>