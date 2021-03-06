<%@ page import="com.baje.sz.ajax.AjaxXml" %>
<%@ page import="com.baje.sz.util.Doc" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="com.baje.sz.util.Selectic" %>
<%@ page import="com.battsister.student.StudentApi" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    if ("save".equals(action)) {
        out.print(new StudentApi().editStudentInfo(request));
        return;
    }
    Doc doc = new Selectic().Get_Doc("name,birth,sex,mobile,headpic", "bs_students", "where id=?", "mysqlss", new Object[]{student_id});
    String name = "";
    String birth = "";
    int sex = 0;
    String mobile = "";
    String headpic="";
    if (doc != null && !doc.isEmpty()) {
        name = doc.get("name");
        birth = AjaxXml.timeStamp2Date(doc.getIn("birth"), "YY04-MM-DD");
        sex = doc.getIn("sex");
        mobile = doc.get("mobile");
        headpic=doc.get("headpic");
    }
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>个人中心</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="../front_style/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../front_style/js/jquery.min.js"></script>
     <script type="text/javascript"
            src="/manage/js/artDialog4.1.6/artDialog.js?skin=blue"></script>
<script type="text/javascript" src="/manage/js//artDialog4.1.6/plugins/iframeTools.source.js"></script>
<!-- 图片上传 -->
 <script type='text/javascript' src='/public/js/global.js'></script>
    <script type='text/javascript' src='/public/js/operamasks/operamasks-ui.min.js'></script>
</head>

<body>
<!--=== Header ===-->
<jsp:include page="header.jsp">
    <jsp:param value="5" name="type"/>
</jsp:include>
<!--=== End Header ===-->

<div class="container">
    <div class="info">
    	<a href="student_home.jsp">首页</a><em>></em><a href="st_personal.jsp">个人中心</a><em>></em><a href="st_personal.jsp">个人资料</a>
    </div>
</div>

<div class="container">
    <jsp:include page="user_left.jsp">
        <jsp:param value="1" name="type"/>
    </jsp:include>
    <form id="userInfo">
        <input type="hidden" name="action" value="save">
        <div class="right_w mt_none">
            <div class="title_r">个人资料</div>
            <div class="input_c">
                <div class="input_word">账号</div>
                <div class="input_text"><input name="username" type="text" class="input_k" placeholder="<%=username%>" readonly></div>
                <div class="clear"></div>
            </div>
            <div class="input_c">
                <div class="input_word">姓名</div><input name="name" type="text" class="input_k" placeholder="" value="<%=name%>" notnull>
                <div class="clear"></div>
            </div>
            <div class="input_c">
                <div class="input_word">性别</div>
                <div class="input_text"><select name="sex" class="select_k">
                    <option value="1" <%=1==sex?"selected":""%>>男</option>
                    <option value="2" <%=2==sex?"selected":""%>>女</option>
                </select></div>
                <div class="clear"></div>
            </div>
           <%--  <div class="input_c">
                <div class="input_word">生日</div>
                <div class="input_text"><input name="birth" type="text" class="input_k" onclick="SelectDate(this,'yyyy-MM-dd',0,0);" placeholder="" value="<%=birth%>" notnull readonly="readonly"/></div>
                <div class="clear"></div>
            </div> --%>
            <div class="input_c">
                <div class="input_word">手机号码</div>
                <div class="input_text"><input name="mobile" type="text" class="input_k"  value="<%=mobile%>" notnull></div>
                <div class="clear"></div>
            </div>
            <div class="input_c">
                <div class="input_word">密码</div>
                <div class="input_text"><input name="password" type="text" class="input_k"  placeholder="不输入则不修改"></div>
                <div class="clear"></div>
            </div>
            <div class="input_c">
                <div class="input_word">头像</div>
                <div class="input_text">
                	<span class="input"> <span class="upload_file">
									<div>
                                        <div class="up_input">
                                            <input name="FileUpload" id="smallfileUpload1" type="file"/>
                                        </div>
                                        <div class="tips">
                                        </div>
                                        <div class="clear"></div>
                                        <input type="hidden" name="headpic"
                                               value="<%=headpic%>"/>
                                    </div>
									<div class="img" id="smallfileDetail1" style="width: 100px;"></div>
							</span> </span>
                </div>
                <div class="clear"></div>
                 <script type="text/javascript">
                if ($('#smallfileUpload1').size()) {
                    global_obj.file_upload($('#smallfileUpload1'),
                            $('#userInfo input[name=headpic]'), $('#smallfileDetail1'),
                            'web_column');
                    $('#smallfileDetail1').html(
                            global_obj.img_link($('#userInfo input[name=headpic]').val()));
                    if ($('#userInfo input[name=headpic]').val() != '') {
                        $('#smallfileDetail1').append('<div class="del">删除</div>');
                    }
                    $('#smallfileDetail1 div').click(function () {
                        $('#userInfo input[name=headpic]').val('');
                        $(this).parent().html('');
                    });
                }
            </script>
            </div>
            <div class="input_c">
                <div class="botton2"><a href="javascript:void(0)" onclick="userSave(this);">确认修改</a></div>
            </div>
        </div>
    </form>
    <div class="clear"></div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
<script language=javascript src='../manage/js/webcalendar.js'></script>
<script language=javascript src='../public/js/global.js'></script>

<script>
    function userSave(obj) {
        if(global_obj.check_form($('*[notnull]'))){return false;}
        var name=$('input[name=name]').val();
        if(name==""||name==undefined){
			art.dialog.alert("请输入您的姓名");
			return;
		}
        if(name.length>20){
			art.dialog.alert("您的姓名似乎太长了点");
			return;
		}
        var password=$('input[name=password]').val();
        if(password!=""&&password!=undefined){
			var pass_reg=/^[0-9a-zA-Z]*$/g;
			if(!pass_reg.test(password)){
				art.dialog.alert("密码只能为字母、数字");
				return false;
			}
		}
        var mobile=$('input[name=mobile]').val();
        if(mobile!=""){
        	if(!/^(13[0-9]|17[0-9]|15[0-9]|18[0-9])\d{8}$/i.test(mobile)){
        		art.dialog.alert("您的手机号码格式似乎不正确哦");
    			return false;
        	}
        }
        $(obj).html('提交中...').attr('onclick', 'void(0);');
        $.post('?',$('#userInfo').serialize(),function (data) {
        	if(data.type){
        		//art.dialog.alert(data.msg);
        		window.location.href='student_home.jsp';
        	}else{
        		art.dialog.alert(data.msg);
        	}
        },'json');
    }
</script>
</body>
</html>
