<%@page import="com.battsister.util.BasicType"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page import="java.io.File"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>ppt播放</title>
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  	<link rel="stylesheet" href="/front_style/ppt_word/css/base.css">
	<link rel="stylesheet" href="/front_style/ppt_word/css/MPreview.css">
	<!-- <script async src="http://c.cnzz.com/core.php"></script> -->
 <body>
    <h1 style="font-size: 16px;"><a href="javascript:return false;" style="color: #666;"></a>　　<a href="javascript:return false;" style="color: #666;"></a></h1>
    <div class="wrapper" style="height: 80%;">
        <div class="ppt" id="ppt"></div>
    </div>
    <!-- var data = ['upload/1.jpg','upload/2.jpg','upload/3.jpg'];
		$('#doc').MPreview({ data: data }); -->
		<%
			RequestUtil ru=new RequestUtil(request);
			String imagepath=ru.getString("pic_dir");
			int num=ru.getInt("num");
			StringBuffer dataBuffer=new StringBuffer("[");
			for(int i=0;i<num;i++){
				if(i==(num-1)){
					dataBuffer.append("'"+BasicType.getWordPptPath(imagepath, i)+"'");
				}else{
					dataBuffer.append("'"+BasicType.getWordPptPath(imagepath, i)+"',");
				}
			}
			dataBuffer.append("]");
			//System.out.print(dataBuffer.toString());
		%>
		<script type="text/javascript">
			var data=<%=dataBuffer.toString()%>;
		</script>
    <script type="text/javascript" src="/public/js/jquery.min.js"></script>
    <script type="text/javascript" src="/front_style/ppt_word/js/MPreviewPPT.js"></script>
    <script type="text/javascript">$('#ppt').MPreviewPPT({ data:data});</script>
</body>
</html>
