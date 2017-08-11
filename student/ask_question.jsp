<%@page import="com.battsister.util.SetupUtil"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page import="com.baje.sz.util.Doc" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.baje.sz.util.Selectic" %>
<%@ page import="com.battsister.student.QuestionApi" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    RequestUtil ru = new RequestUtil(request);
    Selectic selectic = new Selectic();
    String action = ru.getString("action");
    if ("save".equals(action)) {
        out.print(new QuestionApi().askQuestion(request));
        return;
    }
    if ("getChapter".equals(action)) {
        int course_id = ru.getInt("course_id");
        out.print(selectic.getJsonArray("select id,name from bs_chapter where isdel=0 and course_id=? order by order_num asc", "mysqlss", new Object[]{course_id}));
        return;
    }
    Doc studentDoc=selectic.Get_Doc("id,teacher_id","bs_students"," where isdel=0 and id=? ","mysqlss",new Object[]{student_id});
    if(studentDoc==null||studentDoc.isEmpty()){
    	 out.print("<script>alert(\"请先登录\");window.location.href='/login.jsp';</script>");
         return;
    }
    Doc teacherDoc=selectic.Get_Doc("id,course_flag", "bs_teachers", " where id=? ","mysqlss",new Object[]{studentDoc.getIn("teacher_id")});
    JSONArray courseArray=new JSONArray();
    if(teacherDoc.get("course_flag")!=null&&!"".equals(teacherDoc.get("course_flag"))){
		JSONArray hasArray=JSONArray.fromObject(teacherDoc.get("course_flag"));
		if(hasArray!=null){
			for(int i=0;i<hasArray.size();i++){
				JSONObject hasJson=hasArray.optJSONObject(i);
				if(hasJson!=null){
					Doc coursedDoc=selectic.Get_Doc("id,learning_guide,name,order_num", "bs_course", " where id=? order by order_num desc ","mysqlss",new Object[]{hasJson.optInt("course_id")});
					if(coursedDoc!=null&&!coursedDoc.isEmpty()){
						JSONObject courseJson=new JSONObject();
						courseJson.put("id", coursedDoc.getIn("id"));
						courseJson.put("learning_guide", coursedDoc.get("learning_guide",""));
						courseJson.put("name", coursedDoc.get("name",""));
						courseJson.put("order_num",coursedDoc.getIn("order_num"));
						courseArray.add(courseJson);
					}
				}
			}
		}
	}
    courseArray=SetupUtil.sortJSONArray(courseArray, "order_num",2);
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>学生端——快速提问</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="../front_style/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../front_style/js/jquery.min.js"></script>
    <script type="text/javascript"
            src="/manage/js/artDialog4.1.6/artDialog.js?skin=blue"></script>
<script type="text/javascript" src="/manage/js//artDialog4.1.6/plugins/iframeTools.source.js"></script>
</head>

<body>
<!--=== Header ===-->
<jsp:include page="header.jsp">
    <jsp:param value="4" name="type"/>
</jsp:include>
<!--=== End Header ===-->

<div class="container">
    <div class="info">
    	<a href="student_home.jsp">首页</a><em>></em><a href="my_questions.jsp">我的提问</a><em>></em><a href="ask_question.jsp">快速提问</a>
    </div>
</div>

<div class="container">
    <form id="quetionForm">
        <input type="hidden" name="action" value="save">
        <div class="ex_wrap mt_none">
            <div class="title_r">快速提问</div>
            <div class="input_c">
                <div class="input_word">提问内容</div>
                <div class="input_text"><textarea name="content" cols="" rows="" placeholder="请输入您要提的问题" class="textarea_c"></textarea></div>
                <div class="clear"></div>
                <div class="c_info">控制在1000个字符</div>
            </div>
            <div class="input_c">
                <div class="input_word">提问章节</div>
                <div class="input_text">
                    <select name="course_id" class="select_k" onchange="getChapter(this);">
                        <option value="0">--选择课程--</option>
                        <%
                            if (courseArray != null && !courseArray.isEmpty()) {
                                for (int i=0;i<courseArray.size();i++) {
                                	JSONObject json = courseArray.optJSONObject(i);
                                    out.print("<option value="+json.optInt("id")+">"+json.optString("name")+"</option>");
                                }
                            }
                        %>
                    </select>
                    <select name="chapter_id" class="select_k">
                        <option value="0">--选择章节--</option>
                    </select>
                </div>
                <div class="clear"></div>
            </div>
            <div class="input_c">
                <div class="botton2"><a onclick="userSave(this);">提交</a></div>
            </div>
        </div>
    </form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>
    function getChapter(obj) {
        var course_id = $(obj).val();
        $.post('?', 'action=getChapter&course_id=' + course_id, function (data) {
            var html = '<option value="0">--选择章节--</option>';
            if (data.length > 0) {
                for (var i = 0; i < data.length; i ++) {
                    html += '<option value="'+data[i].id+'">'+data[i].name+'</option>';
                }
            }
            $('select[name=chapter_id]').html(html);
        }, 'json');
    }

    function userSave(obj) {
        if ($('select[name=course_id]').val() == '0') {
        	art.dialog.alert('请选择课程');
            return false;
        }
        if ($('select[name=chapter_id]').val() == '0') {
        	art.dialog.alert('请选择章节');
            return false;
        }
        if ($('textarea[name=content]').val().length > 1000) {
        	art.dialog.alert('字数不能超过1000个字哦');
            return;
        }
        $(obj).html('提交中...').attr('onclick', 'void(0);');
        $.post('?',$('#quetionForm').serialize(),function (data) {
            $(obj).html(data.msg);
            setTimeout(function () {
                if (data.type) {
                    window.location.href='my_questions.jsp';
                } else {
                    $(obj).attr('onclick', 'userSave(this);').html('提交');
                }
            }, 500);
        },'json');
    }
</script>
</body>
</html>
