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
    int id = ru.getInt("id");
    if (action.equals("save")) {//更新
    	Course course=new Course();
    	out.print(course.editVideo(request, user_id, user_name));
    	return; 
    }
	String video_path="",name="";
	String titles=ru.getString("titles");
	String keys=ru.getString("keys");
			
    Doc doc = utildb.Get_Doc("id,practical_video_path,name", "bs_course", " where id=? and isdel=0", "mysqlss", new Object[]{id});
    if (doc == null) {
        out.print("信息不存在");
        return;
    } else {
    	video_path=doc.get("practical_video_path");
    	name=doc.get("name");
    }
    JSONArray resource_array=BasicType.getQiNiuResourse(1,"");//获取七牛服务器的文件
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
        function usersave() {
            $("#tjbutton").attr("disabled", true);
            $("#tisspan").html("<img src='../images/loading.gif' />提交中，请稍候……");
            var title_str="";
            var key_str="";
            $("input[name=key]").each(function (){
            	key_str+=","+$(this).val();
            });
            $("input[name=title]").each(function (){
            	title_str+=","+$(this).val();
            });
            $.ajax({
                dataType: "json",
                type: "post",
                url: "practical_video_edit.jsp",
                data: $("#form1").serialize()+"&key_str="+key_str+"&title_str="+title_str,
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
            <input name="action" id="action" type="hidden" value="save"/>
            	      <ul class="row2 clearfix">
                <li>
                       <h4 style="margin-bottom:20px;"><%=name%>--实训视频选择</h4>
                </li>
                   <li>
                       <h4 style="margin-bottom:20px;color: red;">请确保视频已上传到服务器</h4>
                </li>
            </ul>
            <ul class="row3 clearfix">
            <li>
            	标题：
            	<input name="input" type="text" style="width:140px;"/>
            </li>
            <li>
            <select name="resource" id="resource">
            <option value="">--请选择视频--</option>
           <%
           	if(resource_array!=null){
           		for(int i=0;i<resource_array.size();i++){
           			JSONObject json=resource_array.getJSONObject(i);
           			%>
           			<option value="<%=json.optString("key")%>"><%=json.optString("key")%></option>
           			<%
           		}
           	}
           %>
           </select>
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
          		if(keys!=null&&titles!=null){
              		String ss[]=keys.split(",");
              		String ts[]=titles.split(",");
              		if(ss!=null&&ts!=null){
              			for(int i=0;i<ss.length;i++){
              				if(!"".equals(ss[i])){
              					JSONObject json=new JSONObject();
                  				json.put("key",ss[i]);
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
		<source src="<%=BasicType.getResoursePath(json.optString("key"))%>" type='video/mp4' />
	</video>
	<input type="hidden" name="key" value="<%=json.optString("key")%>"/>
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
		 if($('input[name=input]').val()==''){
			 window.parent.art.dialog.alert('请输入视频的标题');
			 return;
		}
		if($('#resource').val()==''){
			 window.parent.art.dialog.alert('请选择添加的视频');
			 return;
		} 
         var titles='<%=titles%>'+','+$('input[name=input]').val();
         var keys='<%=keys%>'+','+$('#resource').val();
         window.location.href='practical_video_edit.jsp?id=<%=id%>&titles='+titles+'&keys='+keys;
	}
</script>
<!--End Sidebar--> </body>
</html>