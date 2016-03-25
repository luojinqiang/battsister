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
String action=ru.getString("action");
if("del".equals(action)){
	out.print(new TeacherApi().delStudent(request));
	return;
}
if("delAll".equals(action)){
	out.print(new TeacherApi().delAllStudent(request));
	return;
}
Object teacher_id=session.getAttribute("teacher_id");
Selectic selectic=new Selectic();
if(teacher_id==null){
	out.print("	<script>alert(\"请先登录\");window.location.href='/login.jsp';</script>");
}
int pages=ru.getInt("pages");
pages=pages==0?1:pages;
int counts=selectic.Get_count("id", "bs_students", " teacher_id=? and isdel=0", "mysqlss",new Object[]{teacher_id});
StringBuffer whereBuffer=new StringBuffer("teacher_id=? and isdel=0");
String seacherWord=ru.getString("seacherWord");
List valueList=new ArrayList();
valueList.add(teacher_id);
if(seacherWord!=null&&!"".equals(seacherWord)){
	whereBuffer.append(" and ( name like ? or username like ?) ");
	valueList.add("%"+seacherWord+"%");
	valueList.add("%"+seacherWord+"%");
}
List<Doc> studentList=selectic.Get_List(pages, 10, counts, "bs_students",whereBuffer.toString(), "id,name,username,sex,mobile"," order by id desc ","mysqlss",valueList);
int pageSize=selectic.getPageSize(counts,10);
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
    	<div class="stu_botton"><a href="increase_students.jsp">新增学员</a></div>
       	<%
       		if(studentList!=null&&!studentList.isEmpty()){
       			out.print(" <div class=\"stu_botton\"><a href=\"javascript:delAll();\">删除全部学员</a></div>");
       		}
       	%>
      	<div class="stu_top_right">
      	<form action="" method="post">
        	<input name="seacherWord" value="<%=seacherWord%>" type="text" class="input_stu" placeholder="输入学生学号、姓名进行搜索">
          	<input type="submit" class="tijiao" value="提交">
        </form>
        </div>
        <div class="clear"></div>
    </div>
    <div class="stu_con">
    	<table  width="100%;">
          <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>联系电话</th>
            <th>性别</th>
            <th>操作</th>
          </tr>
		 <%
		 	if(studentList!=null){
		 		for(Doc doc:studentList){
		 			%>
		 			<tr>
            		<td><%=doc.get("username")%></td>
           			<td><%=doc.get("name")%></td>
            		<td><%=doc.get("mobile")%></td>
            		<td><%if(doc.getIn("sex")==1){out.print("男");}else if(doc.getIn("sex")==2){out.print("女");}%></td>
            		<td><a href="update_students.jsp?student_id=<%=doc.getIn("id")%>">编辑</a><em>|</em><a href="javascript:delStudent('<%=doc.getIn("id")%>')">删除</a></td>
         			</tr>
		 			<%
		 		}
		 	}
		 %>
        </table>
    	<ul class="pre">
            <%
            	if(pages>1){
            		out.print("<li><a href=\"student_management.jsp?pages="+(pages-1)+"\">></a></li>");
            	}
            	for(int i=1;i<=pageSize;i++){
            		out.print("<li "+(pages==i?"class=\"active_pre\"":"")+"><a href=\"student_management.jsp?pages="+i+"\">"+i+"</a></li>");
            	}
            	if(pages<pageSize){
            		out.print("<li><a href=\"student_management.jsp?pages="+(pages+1)+"\">></a></li>");
            	}
            %>
        </ul>
    </div>
</div>
<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
	function delStudent(id){
		if(confirm("你确定要删除改学生吗？")){
			$.ajax({ 
	            dataType: "json",
	            type: "post", 
	            url: "student_management.jsp",
	            data: "action=del&student_id="+id, 
	            success: function (msg) {
	                if (msg.type) {
	                  	window.location.reload();
	                } else {
	                    alert(msg.msg);
	                }
	            }
	        });
		}
	}
	function delAll(){
		if(confirm("你确定要删除全部学生吗？")){
			$.ajax({ 
	            dataType: "json",
	            type: "post", 
	            url: "student_management.jsp",
	            data: "action=delAll", 
	            success: function (msg) {
	                if (msg.type) {
	                  	window.location.reload();
	                } else {
	                    alert(msg.msg);
	                }
	            }
	        });
		}
	}
</script>
</body>
</html>
