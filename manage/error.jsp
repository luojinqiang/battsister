<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    RequestUtil ru = new RequestUtil(request);
    String left = ru.getString("left");
    String isxy = ru.getString("isxy");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>table</title>
    <link href="css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="css/base.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/jquery.contextmenu.css"/>
    <script type="text/javascript" src="js/jquery.contextmenu.js"></script>
    <script type="text/javascript">

    </script>

</head>

<body class="ifr">
<%
if(isxy!=null && !isxy.equals("noleft")){
	
	%><%@ include file="left.jsp" %><!--End Sidebar--><%
    }
%>
<!--End Sidebar-->
<div class="iframe_box">
    <div class="pms_error">
        <div class="error_icon"><s></s></div>
        <div class="error_txt">
            <p><strong>很抱歉，您有没此操作权限。</strong></p>

            <p>请联系管理员在帐号管理分配权限或通过页面顶部和左边功能菜单进入其他页面。</p>

            <p><a href="javascript:window.parent.jianyi2('xitong/guanliyuan.jsp','管理员列表')">点击此处分配权限</a></p>
        </div>
    </div>
</div><!--iframe_box END-->

<div class="clear"></div>
</body>
</html>