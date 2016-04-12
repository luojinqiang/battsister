<%@ page contentType="text/html; charset=utf-8" %>
<link href="/manage/css/colortemplate.css" rel="stylesheet" type="text/css"/>
<div class="sidebarWrap">
	    <div class="sidebar" id="teacher" style="display:none">
        <h3>
            <span>用户管理</span>
        </h3>
        <ul class="nav_list">
   			<%
                if (current_flags.contains("1001")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('teacher/schools.jsp','学校管理')">学校管理</a></li>
            <%
                }
               %>
            <%
                if (current_flags.contains("1002")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('teacher/teachers.jsp','教师管理')">教师管理</a></li>
            <%
                }if (current_flags.contains("1003")) {
                    %>
                   <li><a href="javascript:window.parent.jianyi2('teacher/students.jsp','学生管理')">学生管理</a></li>
                    <%
                 }
           %>
        </ul>
    </div>
    <div class="sidebar" id="course" style="display:none">
        <h3>
            <span>课程管理</span>
        </h3>
        <ul class="nav_list">
   			<%
                if (current_flags.contains("2001")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('course/course.jsp','课程管理')">课程管理</a></li>
            <%
                 }
           %>
        </ul>
    </div>
    <div class="sidebar" id="xinxi" style="display:none">
        <h3>
            <span>信息管理</span>
        </h3>
        <ul class="nav_list">
            <% if (current_flags.contains("3001")) {%>
             <li><a href="javascript:window.parent.jianyi2('xinxi/newsclass.jsp','信息栏目')">信息栏目</a></li>
            <%
                }
                if (current_flags.contains("3002")) {
            %>
              <li><a href="javascript:window.parent.jianyi2('xinxi/news.jsp','信息内容')">信息内容</a></li>

            <%
                }
               if(current_flags.contains("3003")){
                	%>
			 <li><a href="javascript:window.parent.jianyi2('xinxi/cooperaton_unit.jsp','合作院校、企业')">合作院校、企业</a></li>
                	<%
                }if(current_flags.contains("3004")){
             	   %>
             	   <li><a href="javascript:window.parent.jianyi2('xinxi/banner.jsp','首页banner图')">首页banner图</a></li>
             	   <%
                }
              %>
        </ul>
    </div>
    <div class="sidebar" id="xitong" style="display:none">
        <h3>
            <span>系统管理</span>
        </h3>
        <ul class="nav_list">
            <%
            if (current_flags.contains("4001")) { %>
            <li><a href="javascript:window.parent.jianyi2('xitong/rizhi.jsp','系统日志')">系统日志</a></li>
            <%
                }
                if (current_flags.contains("4002")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('xitong/keyword.jsp','关键词管理')">关键词管理</a></li>
            <%
                }
                if (current_flags.contains("4003")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('xitong/userfeedback.jsp','用户反馈')">用户反馈</a></li>
            <%
            }
            %>
            <li><a href="javascript:window.parent.jianyi2('xitong/password_edit.jsp','修改密码')">修改密码</a></li>
        </ul>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(
            function () {
                var leftarr = ['teacher','course', 'xinxi', 'xitong'];
                var nowhref = window.location.href;
                for (l in leftarr) {
                    if (nowhref.indexOf(leftarr[l]) > -1) {
                        $("#" + leftarr[l]).show();
                    } else {
                        $("#" + leftarr[l]).hide();
                    }
                }
            });
</script>