<%@page import="com.battsister.util.SetupUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page import="com.baje.sz.util.Doc" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.baje.sz.util.Selectic" %>
<%@ page import="java.util.List" %>
<%@ page import="sun.reflect.generics.tree.BaseType" %>
<%@ page import="com.battsister.util.BasicType" %>
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
    <title>学习指导</title>
    <meta name="keywords" content="#"/>
    <meta name="description" content="#"/>
    <link href="../front_style/css/style.css" rel="stylesheet" type="text/css">
  <!--   <link rel="stylesheet" href="../front_style/ppt_word/css/base.css">
    <link rel="stylesheet" href="../front_style/ppt_word/css/MPreview.css"> -->
    <script type="text/javascript" src="../front_style/js/jquery.min.js"></script>
    <script src="../front_style/js/showList.js" type="text/javascript"></script>
    <style>
        .pdfobject-container {width: 878px; height: 800px; margin-left: -20px;}
        .pdfobject { border: 1px solid #666; }
    </style>
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
                    if (courseArray != null && !courseArray.isEmpty()) {
                        for(int i=0;i<courseArray.size();i++){
                        	JSONObject courserJson=courseArray.optJSONObject(i);
                        	 out.print("<li><h5><a href='/pdf/web/viewer.jsp?file="+ BasicType.getValueByKey(courserJson.optString("learning_guide"), "word_dir")+"' target='show'>" + courserJson.optString("name") + "</a></h5></li>");
                        }
                    }
                %>
            </ul>
        </div>
    </div>
    <div class="right_w">
        <div class="right_con">

            <div class="">
                <div class="doc" id="doc"> 
                <iframe name="show" style="width: 100%;height: 900px;" frameBorder="0">
                </iframe>
                </div> 
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
