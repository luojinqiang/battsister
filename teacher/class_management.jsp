<%@page import="com.battsister.teacher.TeacherApi"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=utf-8" %>
<%
request.setCharacterEncoding("utf-8");
//设置response字符编码
response.setContentType("text/html;charset=utf-8");
RequestUtil ru=new RequestUtil(request);
Object teacher_id=session.getAttribute("teacher_id");
Selectic selectic=new Selectic();
if(teacher_id==null){
	out.print("	<script>alert(\"请先登录\");window.location.href='/login.jsp';</script>");
}
String action=ru.getString("action");
if("del".equals(action)){
	out.print(new TeacherApi().delClass(request));
	return;
}
/* int pages=ru.getInt("pages");
pages=pages==0?1:pages; 
 int counts=selectic.Get_count("id", "bs_students", " teacher_id=? and isdel=0", "mysqlss",new Object[]{teacher_id}); 
StringBuffer whereBuffer=new StringBuffer("teacher_id=? and isdel=0");
List valueList=new ArrayList();
valueList.add(teacher_id);
 List<Doc> classList=selectic.Get_List(pages, 10, counts, "bs_class",whereBuffer.toString(), "id,class_name,create_time"," order by id desc ","mysqlss",valueList); */
List<Doc> classList=selectic.Get_List("id,class_name,create_time", "bs_class", " where isdel=0 and teacher_id=? ","mysqlss",new Object[]{teacher_id});
/* int pageSize=selectic.getPageSize(counts,10); */
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>学生管理</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/front_style/js/jquery.min.js"></script>
<script src="/front_style/js/showList.js" type="text/javascript"></script>
<script type="text/javascript"
            src="/manage/js/artDialog4.1.6/artDialog.js?skin=blue"></script>
<script type="text/javascript" src="/manage/js//artDialog4.1.6/plugins/iframeTools.source.js"></script>
</head>
<body>
<!-- 引入头部 -->
<jsp:include page="head.jsp">
	<jsp:param value="4" name="type"/>
</jsp:include>
<!-- 引入第二个头部 -->
<%@include file="head1.jsp" %>
<div class="container">
  	<div class="stu_top">
    	<div class="stu_botton"><a href="increase_class.jsp">新增班级</a></div>
    	<div class="stu_botton"><a href="student_management.jsp">学生管理</a></div>
        <div class="clear"></div>
    </div>
    <div class="stu_con">
    	<table  width="100%;">
          <tr>
            <th>班级名称</th>
            <th>添加时间</th>
            <th>操作</th>
          </tr>
		 <%
		 	if(classList!=null){
		 		for(Doc doc:classList){
		 			%>
		 			<tr>
            		<td><%=doc.get("class_name")%></td>
           			<td><%=AjaxXml.timeStamp2Date(doc.getIn("create_time"), "YY04-MM-DD HH:MI:SS")%></td>
            		<td><a href="increase_class.jsp?class_id=<%=doc.getIn("id")%>">编辑</a><em>|</em><a href="javascript:delStudent('<%=doc.getIn("id")%>')">删除</a></td>
         			</tr>
		 			<%
		 		}
		 	}
		 %>
        </table>
    	<%-- <ul class="pre">
            <%
            	if(pages>1){
            		out.print("<li><a href=\"class_management.jsp?pages="+(pages-1)+"\">></a></li>");
            	}
            	for(int i=1;i<=pageSize;i++){
            		out.print("<li "+(pages==i?"class=\"active_pre\"":"")+"><a href=\"class_management.jsp?pages="+i+"\">"+i+"</a></li>");
            	}
            	if(pages<pageSize){
            		out.print("<li><a href=\"class_management.jsp?pages="+(pages+1)+"\">></a></li>");
            	}
            %>
        </ul> --%>
    </div>
</div>
<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
	function delStudent(id){
		 art.dialog({
             id: 'delID',
             content: '你确定要删除班级吗？该操作将删除该班级下的所有学生?',
             lock: true,
             button: [
                 {
                     name: '确定',
                     callback: function () {
                    	 $.ajax({ 
             	            dataType: "json",
             	            type: "post", 
             	            url: "class_management.jsp",
             	            data: "action=del&class_id="+id, 
             	            success: function (msg) {
             	                if (msg.type) {
             	                  	window.location.reload();
             	                } else {
             	                	 art.dialog.alert(msg.msg);
             	                }
             	            }
             	        });
                         return false;
                     },
                     focus: true
                 },
                 {
                     name: '取消'
                 }
             ]
         });
	}
</script>
</body>
</html>
