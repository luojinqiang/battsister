<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	int type=ru.getInt("type");
	Object teach_id=session.getAttribute("teacher_id");
	if(teach_id==null){
		out.print("	<script>alert(\"请先登录\");window.location.href='/login.jsp';</script>");
	}
	Doc teachDoc=new Selectic().Get_Doc("id,school_id","bs_teachers"," where id=? ","mysqlss",new Object[]{teach_id});
 	if(teachDoc==null||teachDoc.isEmpty()){
	 out.print("<script>alert(\"请先登录\");window.location.href='/login.jsp';</script>");
 	}
 	Doc schDoc=new Selectic().Get_Doc("id,logo","bs_schools"," where id=? ","mysqlss",new Object[]{teachDoc.getIn("school_id")});
 	if(schDoc==null||schDoc.isEmpty()){
 		out.print("<script>alert(\"请先登录\");window.location.href='/login.jsp';</script>");
 	}
 	String schLogo=schDoc.getString("logo");
%>
<!--=== Header ===-->
<div class="headerbg_tea">               
    <div class="header_tea"> 
        <div class="logo_tea">                                           
            <a href="/index.jsp"><img src="/front_style/images/logo.png" alt="Logo" /></a>
        </div>                                               
         <ul class="navbar_tea">
            <li <%=type==1?"class=\"active_tea\"":""%>><a href="teacher_home.jsp">我要备课</a></li>
            <li <%=type==2?"class=\"active_tea\"":""%>><a href="teaching.jsp">我要授课</a></li>
            <li <%=type==3?"class=\"active_tea\"":""%>><a href="practical_training.jsp">我要实训</a></li> 
            <li <%=type==4?"class=\"active_tea\"":""%>><a href="student_management.jsp">学生管理</a></li>
            <li <%=type==5?"class=\"active_tea\"":""%>><a href="personal.jsp">个人中心</a></li>
            <li>
            <!--  <div class="user_tea">  -->
	            <!-- <div class="user_tea_img" style="margin: 0 auto;"> -->
	                	<%
	                		if(schLogo!=null&&!"".equals(schLogo.trim())){
	                			%>
	                			<img src="<%=schLogo%>" style="width: 200px;height: 60px;line-height: 60px;">
	                			<%
	                		}else{
	                			%>
	                			<img src="/front_style/images/user01.png">
	                			<%
	                		}
	                	%>
	              <!--   </div> -->
	              <!--  </div> -->
                </li>
                <!-- <div class="down_tea">个人中心</div> -->
              <!--   </a> -->
        </ul>
        <div class="clear"></div>                  
  </div>           
</div>   
<!--=== End Header ===--><!--=== End Header ===-->
