<%@page import="java.util.List"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.battsister.teacher.TeacherApi"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
RequestUtil ru=new RequestUtil(request);
String action=ru.getString("action");
if("send".equals(action)){
	TeacherApi teacherApi=new TeacherApi();
	out.print(teacherApi.sendExamination(request));
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
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>发起考试</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/front_style/js/jquery.min.js"></script>
<!-- 时间选择器 -->
<script type="text/javascript" src="/front_style/datepicker/jquery-ui-datepicker.js"></script>
<script type="text/javascript" src="/front_style/js/lean-modal.min.js"></script>
<link href="/front_style/datepicker/jquery-ui.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#lean_overlay{position:fixed; z-index:10; top:0px; left:0px; height:100%; width:100%; background:#000; display:none;}
.lean-modal{width:40%; font-size:14px; position:absolute; left:0; top:0; display:none; background:#ddd; border-radius:3px; box-shadow: 0px 1px 5px #333333; } 
.lean-modal .modal_close{   display:block; width:100%; height:40px;  z-index:2000; text-align:center; border-top:#ccc solid 1px; line-height:40px;}
.lean-modal a{ color:#333;text-decoration:none;}.lean-modal a:hover{ text-decoration:none;}
.lean-modal{ z-index:10001;display:none; color:#ffffff;}
.lean-modal .tips{ line-height:24px; padding:0px 10px;  max-height:300px; overflow:auto;}


.tan-list{ border-top:#ccc solid 1px; padding:10px; text-align:left; color:#CCC;}
.tan-title label{ display:block; width:100%; height:100%;}
</style>
<script type="text/javascript">
function intid(){
	$('#home_mod_tips').leanModal(); 
} 
</script>
</head>
<body>
<!--=== Header ===-->
<!-- 引入头部 -->
<jsp:include page="head.jsp">
	<jsp:param value="2" name="type"/>
</jsp:include>

<div class="container">
    <div class="info">
    	<a href="teacher_home.jsp">首页</a><em>></em><a href="teaching.jsp">我要授课</a><em>></em><a href="examination_system.jsp">考试系统</a><em>></em><a href="examination.jsp">发起考试</a>
    </div>
</div>
<div class="container">
	<div class="ex_wrap">
		<div class="title_r">发起考试</div>
		 <div class="input_c">
            <div class="input_word">考试名称</div>
            <div class="input_text"><input name="name" type="text" class="input_k" placeholder="请输入考试名称"></div>
            <div class="clear"></div>
        </div>
		 <div class="input_c">
            <div class="input_word">考试班级</div>
            <div class="input_text" onclick="intid();"><input name="classes" type="text" class="input_k" placeholder="选择考试班级"></div>
            <div class="clear"></div>
        </div>
        <div class="input_c">
            <div class="input_word">考试模式</div>
            <div class="input_text">
            <select name="examination_model" id="examination_model" class="select_k" onchange="setModel();">
              <option value="1">按模块</option>
              <option value="0">按任务</option>
          </select>
            </div>
            <div class="clear"></div>
        </div>
         <div class="input_c">
            <div class="input_word">考试时长</div>
            <div class="input_text">
          	    <select class="select_k" id="limit_time">
          	    	<option value="30">30分钟</option>
          	    	<option value="60">60分钟</option>
          	    	<option value="90">90分钟</option>
          	    </select>
            </div>
            <div class="clear"></div>
        </div>
         <div class="input_c">
            <div class="input_word">考试截至时间</div>
            <div class="input_text">
          	 <input name="end_time" type="text" class="input_k"  readonly="readonly"/>
            </div>
            <div class="clear"></div>
        </div>
         <div class="input_c" id="module">
            <div class="input_word">选择模块</div>
            <div class="input_text">
           <select class="select_k" id="course_id">
               <%
            	if(course_array!=null){
            		for(int i=0;i<course_array.size();i++){
            			JSONObject course_json=course_array.getJSONObject(i);
            			if(course_json!=null){
          					out.print("<option value=\""+course_json.optInt("id")+"\">"+course_json.optString("name")+"</option>");
            			}
            		}
            	}
            %> 
          </select>
          </div>
            <div class="clear"></div>
        </div> 
      <div class="input_c" id="work" style="display: none;">
            <div class="input_word">选择任务</div>
            <div class="input_text">
           <select  class="select_k" id="chapter_id">
               <%
            	if(course_array!=null){
            		for(int i=0;i<course_array.size();i++){
            			JSONObject course_json=course_array.getJSONObject(i);
            			if(course_json!=null){
            				JSONArray chapterArray=course_json.optJSONArray("chapter_array");
            				if(chapterArray!=null){
            					for(int j=0;j<chapterArray.size();j++){
            						JSONObject chapter_json=chapterArray.getJSONObject(j);
            						if(chapter_json!=null){
            							out.print("<option value=\""+chapter_json.optInt("id")+"\">"+course_json.optString("name")+"-"+chapter_json.optString("name")+"</option>");
            						}
            					}
            				}
            			}
            		}
            	}
            %> 
          </select>
          </div>
            <div class="clear"></div>
        </div> 
        <div class="input_c">
            <div class="botton2"><a href="javascript:void(0)" onclick="send();">发起考试</a></div>
        </div>
        
    <div id="home_mod_tips" class="lean-modal"> 
		<div class="tips">
			<%
				List<Doc> classList=selectic.Get_List("id,class_name", "bs_class","where isdel=0 and teacher_id=? ","mysqlss",new Object[]{teacher_id});
				if(classList!=null){
					for(int i=0;i<classList.size();i++){
						Doc doc=classList.get(i);
						%>
						 <div class="ysh_webkit tan-list"> 
				            <div class="tan-title ysh_webkit_flex"><label for="check1"><%=doc.get("class_name")%></label></div>
				            <div class="tan-box"><input type="checkbox"  name="class_ids" value="<%=doc.getIn("id")%>" onchange="showClassName()"></div>
	       				</div> 
						<%
					}
				}
			%>
	    </div>
	    <div class="h"><a class="modal_close" href="javascript:void(0);">确定</a></div>
	</div>
    </div>	
</div>
<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
	function setModel(){
		var type=$('#examination_model').val();
		if(type==0){
			$('#work').show();
			$('#module').hide();
		}else{
			$('#work').hide();
			$('#module').show();
		}
	}
	function send(){
		var type=$('#examination_model').val();
		var id=0;
		var name=$('input[name=name]').val();
		var limit_time=$('#limit_time').val();
		if(name==undefined||name==""){
			alert("请输入考试名称");
			return;
		}
		var class_ids=getcheckbox("class_ids");
		if(class_ids==""){
			alert("请输入参加考试的班级");
			return;
		}
		if(limit_time==undefined||limit_time<=0){
			alert("请输入考试时长");
			return;
		}
		var end_time=$('input[name=end_time]').val();
		if(end_time==undefined||end_time==""){
			alert("请选择考试截至时间");
			return;
		}
		if(type==0){
			id=$('#chapter_id').val();
		}else{
			id=$('#course_id').val();
		}
		$.ajax({ 
            dataType: "json",
            type: "post", 
            url: "examination.jsp",
            data: "action=send&type="+type+"&id="+id+"&name="+name+"&end_time="+end_time+"&class_ids="+class_ids+"&limit_time="+limit_time, 
            success: function (msg) {
                if (msg.type) {
                  	alert("发起考试成功");
                  	window.location.href='examination_system.jsp';
                } else {
                    alert(msg.msg);
                }
            }
        });
	}
	//时间选择器
	$(function(){
	$("input[name=end_time]").datepicker({
		yearRange:"2016:2020",	
		minDate: 1,
		maxDate: 30
	});
});
	
function showClassName(){
	var classNames="";
	$('input:checkbox[name=class_ids]').each(function(){
	       if($(this).is(':checked')){
	    	   var class_name=$(this).parent().parent().find('div').find('label').text();
	    	   if(classNames==""){
	    		   classNames=class_name;
	    	   }else{
	    		   classNames=classNames+" , "+class_name;
	    	   }
	       }
	});
	$('input[name=classes]').val(classNames);
}

function getcheckbox(checkname) {
    var flag = "";
    $("[name='" + checkname + "']:checkbox").each(function () {
        if (this.checked == true) {
            if (flag == "") {
                flag = this.value;
            } else {
                flag = flag + "," + this.value;
            }

        }
    });
    return flag;
}
</script>
</body>
</html>
