<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page import="com.baje.sz.util.Doc" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.baje.sz.util.Selectic" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    RequestUtil ru = new RequestUtil(request);
    Selectic selectic = new Selectic();
    Doc studentDoc=selectic.Get_Doc("id,teacher_id","bs_students"," where isdel=0 and id=? ","mysqlss",new Object[]{student_id});
    if(studentDoc==null||studentDoc.isEmpty()){
    	 out.print("<script>alert(\"请先登录\");window.location.href='/login.jsp';</script>");
         return;
    }
    Doc teacherDoc=selectic.Get_Doc("id,course_flag", "bs_teachers", " where id=? ","mysqlss",new Object[]{studentDoc.getIn("teacher_id")});
    List<Doc> courseList=new ArrayList();
    if(teacherDoc.get("course_flag")!=null&&!"".equals(teacherDoc.get("course_flag"))){
		JSONArray hasArray=JSONArray.fromObject(teacherDoc.get("course_flag"));
		if(hasArray!=null){
			for(int i=0;i<hasArray.size();i++){
				JSONObject hasJson=hasArray.optJSONObject(i);
				if(hasJson!=null){
					Doc coursedDoc=selectic.Get_Doc("id,learning_guide,name", "bs_course", " where id=? ","mysqlss",new Object[]{hasJson.optInt("course_id")});
					if(coursedDoc!=null&&!coursedDoc.isEmpty()){
						courseList.add(coursedDoc);
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
    <title>学习指导</title>
    <meta name="keywords" content="#"/>
    <meta name="description" content="#"/>
    <link href="../front_style/css/style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../front_style/ppt_word/css/base.css">
    <link rel="stylesheet" href="../front_style/ppt_word/css/MPreview.css">
    <script type="text/javascript" src="../front_style/js/jquery.min.js"></script>
    <script src="../front_style/js/showList.js" type="text/javascript"></script>
</head>

<body>
<!--=== Header ===-->
<jsp:include page="header.jsp">
    <jsp:param value="2" name="type"/>
</jsp:include>

<!--=== End Header ===-->

<div class="container">
    <div class="left_nav">
        <div class="operate">
            <ul id="juheweb">
                <h3>学习指导</h3>
                <%
                    if (courseList != null && !courseList.isEmpty()) {
                        for (Doc doc : courseList) {
                            out.print("<li><h5 onclick=\"javascript:showPdf(this);\" data=" + doc.get("learning_guide") + "><a>" + doc.get("name") + "</a></h5></li>");
                        }
                    }
                %>
            </ul>
        </div>
    </div>
    <div class="right_w">
        <div class="right_con">

            <div class="">
                <div class="doc" id="doc" style="margin-left:-19px;margin-top:-20px;width:818px;height:600px;"></div>
                <!--  <div class="ppt" id="ppt" style="margin-left:-10px;width:800px;height:600px;margin-top:-30px;"></div>-->
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<script type="text/javascript" src="../front_style/ppt_word/js/MPreview.js"></script>
<script type="text/javascript">

    PDFViewerApplication.open('<%=ru.getString("file")%>', $('#viewerContainer'));
    function showPdf(obj) {
        var data=[];
        $('.selected').attr('class', '');
        $(obj).attr('class', 'selected');
        var json = eval('('+$(obj).attr("data")+')');
        var url = json.word_dir;
        var num = json.num;
        for (var i = 1; i <= num; i ++) {
            data.push('/document/images/' + url + '/test-'+(i - 1)+'.png');
        }
        $('#doc').html('').MPreview({ data: data });
    }
</script>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
