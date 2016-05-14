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
StringBuffer whereBuffer=new StringBuffer("a.teacher_id=? and a.isdel=0 and b.isdel=0 ");
String seacherWord=ru.getString("seacherWord");//学生名字查找
int class_id=ru.getInt("class_id");//班级id查找
List valueList=new ArrayList();
valueList.add(teacher_id);
if(seacherWord!=null&&!"".equals(seacherWord)){
	whereBuffer.append(" and ( a.name like ? or a.username like ?) ");
	valueList.add("%"+seacherWord+"%");
	valueList.add("%"+seacherWord+"%");
}
if(class_id>0){
	whereBuffer.append(" and a.class_id=? ");
	valueList.add(class_id);
}
List<Doc> studentList=selectic.Get_List(pages, 10, counts, "bs_students a left join bs_class b on a.class_id=b.id",whereBuffer.toString(), "a.id,a.name,a.username,a.sex,a.mobile,b.class_name"," order by a.id desc ","mysqlss",valueList);
int pageSize=selectic.getPageSize(counts,10);
/*教师的班级*/
List<Doc> classList=selectic.Get_List("id,class_name","bs_class"," where isdel=0 and teacher_id=? ","mysqlss",new Object[]{teacher_id});
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
  		<div class="stu_botton"><a href="class_management.jsp">班级管理</a></div>
    	<div class="stu_botton"><a href="increase_students.jsp">新增学员</a></div>
       	<div class="stu_botton1"><a href="javascript:delAll();">删除学员</a></div>
      	<div class="stu_top_right">
      	<form action="" method="post">
      	<select name="class_id" class="select_c">
              <option value="0">全部班级</option>
            	<%
            		if(classList!=null){
            			for(Doc doc:classList){
            				out.print("<option value=\""+doc.getIn("id")+"\""+(class_id==doc.getIn("id")?"selected=\"selected\"":"")+">"+(doc.get("class_name"))+"</option>");
            			}
            		}
            	%>
           </select>
        	<input name="seacherWord" value="<%=seacherWord%>" type="text" class="input_stu" placeholder="输入学生学号、姓名进行搜索">
          	<input type="submit" class="tijiao" value="提交">
        </form>
        </div>
        <div class="clear"></div>
    </div>
    <div class="stu_con">
    	<table  width="100%;">
          <tr>
           <th></th>
           <th>班级</th>
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
		 			<td><input type="checkbox" name="id" value="<%=doc.getIn("id")%>"></td>
		 			<td><%=doc.get("class_name")%></td>
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
		 <tr>
                    <td colspan="7" style="text-align:left;">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox"
                                                                     value="checkbox" onchange="CheckAll(this);"/>
                        选中/取消所有
                    </td>
                </tr>
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
		art.dialog({
            id: 'delID',
            content: '你确定要删除该学生吗？',
            lock: true,
            button: [
                {
                    name: '确定',
                    callback: function () {
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
	function delAll(){
		var ids=getcheckbox("id");
		if(ids==""){
			art.dialog.alert("请选择需要删除的学生？");
            return;
		}
		if(confirm("你确定要删除全部学生吗？")){
			$.ajax({ 
	            dataType: "json",
	            type: "post", 
	            url: "student_management.jsp",
	            data: "action=delAll&ids="+ids, 
	            success: function (msg) {
	                if (msg.type) {
	                  	window.location.reload();
	                } else {
	                	art.dialog.alert(msg.msg);
	                }
	            }
	        });
		}
	}
	function CheckAll(obj){
		$('input:checkbox[name=id]').each(function(){
	       if($(obj).is(':checked')){
	    	   $(this).attr("checked", true);
	       }else{
	    	   $(this).attr("checked", false);
	       }
		});
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
