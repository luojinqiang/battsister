<%@ page import="com.baje.sz.util.Doc" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.baje.sz.util.Selectic" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    RequestUtil ru = new RequestUtil(request);
    Selectic selectic = new Selectic();
    String learning_guide = "", name = "";
    List<Doc> courseList = selectic.Get_List("id,learning_guide,name", "bs_course", " where isdel=0", "mysqlss", new Object[]{});

    int course_id = ru.getInt("course_id");
    if (course_id == 0) {

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
                            out.print("<li><h5 class=\"selected\" onclick=\"javascript:showPdf(this);\" data=" + doc.get("learning_guide") + "><a>" + doc.get("name") + "</a></h5></li>");
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
        <div class="right_con">

            <div class="wrapper">
                <div class="doc" id="doc" style="margin-left:-10px;width:800px;height:600px;margin-top:-30px;"></div>
                <!--  <div class="ppt" id="ppt" style="margin-left:-10px;width:800px;height:600px;margin-top:-30px;"></div>-->
            </div>

        </div>
    </div>
    <div class="clear"></div>
</div>
<script type="text/javascript" src="../front_style/ppt_word/js/MPreview.js"></script>
<script type="text/javascript">
    var data=[];
    function showPdf(obj) {
        var json = eval('('+$(obj).attr("data")+')');
        var url = json.word_dir;
        var num = json.num;
        console.log(url);
        for (var i = 1; i <= num; i ++) {
            data.push('/document/images/' + url + '/test-'+(i - 1)+'.png');
        }
        console.log(data);
        $('#doc').MPreview({ data: data });
    }
</script>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
