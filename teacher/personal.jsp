<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%
	RequestUtil ru=new RequestUtil(request);
	Object teacher_id=session.getAttribute("teacher_id");
	Selectic selectic=new Selectic();
	if(teacher_id==null){
		out.print("	<script>alert(\"请先登录\");window.location.href='/login.jsp';</script>");
	}
	Doc teacherDoc=selectic.Get_Doc("name,username,sex,mobile", "bs_teachers", " where id=? ","mysqlss",new Object[]{teacher_id});
	if(teacherDoc==null||teacherDoc.isEmpty()){
		out.print("	<script>alert(\"请先登录\");window.location.href='/login.jsp';</script>");
	}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>个人中心</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="head.jsp">
	<jsp:param value="5" name="type"/>
</jsp:include>
<div class="container">
    <div class="info">
    	<a href="teacher_home.jsp">首页</a><em>></em><a href="personal.jsp">个人中心</a><em>></em><a href="personal.jsp">个人资料</a>
    </div>
</div>

<div class="container">
	<div class="left_nav mt_none">
      <div class="operate">
        <ul id="juheweb">
          <li>
            <h5 class="selected"><a href="personal.html">个人资料</a></h5>
          </li>
          <li>
            <h5><a href="feedback.html">意见反馈</a></h5>
          </li>
          <li >
            <h5><a href="using_instructions.html">平台使用手册</a></h5>
          </li>
        </ul>
        <script type="text/javascript" language="javascript">
			navList(12);
		</script>
      </div>
  	</div>
    <div class="right_w mt_none">
        <div class="title_r">个人资料</div>
        <div class="input_c">
            <div class="input_word">账号</div>
            <div class="input_text"><input name="username" type="text" class="input_k" value="<%=teacherDoc.get("username")%>" placeholder="<%=teacherDoc.get("username")%>"></div>
            <div class="clear"></div>
        </div>
        <div class="input_c">
            <div class="input_word">姓名</div>
            <div class="input_text"><input name="name" type="text" value="<%=teacherDoc.get("name")%>" class="input_k" placeholder="<%=teacherDoc.get("name")%>"></div>
            <div class="clear"></div>
        </div>
        <div class="input_c">
            <div class="input_word">性别</div>
            <div class="input_text"><select name="sex" class="select_k">
              <option <%=teacherDoc.getIn("sex")==1?"selected=\"selected\"":""%>>男</option>
              <option <%=teacherDoc.getIn("sex")==2?"selected=\"selected\"":""%>>女</option>
          </select></div>
            <div class="clear"></div>
        </div>
       <!--  <div class="input_c">
            <div class="input_word">年龄</div>
            <div class="input_text"><input name="" type="text" class="input_k"  placeholder="23"></div>
            <div class="clear"></div>
        </div> -->
        <div class="input_c">
            <div class="input_word">联系电话</div>
            <div class="input_text"><input name="mobile" value="<%=teacherDoc.get("mobile")%>" type="text" class="input_k"  placeholder="<%=teacherDoc.get("mobile")%>"></div>
            <div class="clear"></div>
        </div>
        <div class="input_c">
            <div class="input_word">密码</div>
            <div class="input_text"><input name="password" type="text" class="input_k"  placeholder="******"><span style="color: red;font-size: 12px;">不修改则不输入</span></div>
            <div class="clear"></div>
        </div>
        <div class="input_c">
            <div class="input_word">确认密码</div>
            <div class="input_text"><input name="password_comfirm" type="text" class="input_k"  placeholder=""></div>
            <div class="clear"></div>
        </div>
        <div class="input_c">
            <div class="botton2"><a href="#">确认修改</a></div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<!-- 底部 -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
