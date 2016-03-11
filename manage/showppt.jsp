<%@page import="com.g.Tojpg.Pdf2Jpg"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page import="java.io.File"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>ppt预览</title>
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  	<link rel="stylesheet" href="MPreview/css/base.css">
	<link rel="stylesheet" href="MPreview/css/MPreview.css">
	<script async src="http://c.cnzz.com/core.php"></script>
 <body>
    <h1 style="font-size: 16px;"><a href="javascript:return false;" style="color: #666;"></a>　　<a href="javascript:return false;" style="color: #666;"></a></h1>
    <div class="wrapper">
        <div class="ppt" id="ppt"></div>
    </div>
    <!-- var data = ['upload/1.jpg','upload/2.jpg','upload/3.jpg'];
		$('#doc').MPreview({ data: data }); -->
		<%
			RequestUtil ru=new RequestUtil(request);
			String imagepath=ru.getString("imgpath");
			int num=ru.getInt("num");
			StringBuffer dataBuffer=new StringBuffer("[");
			for(int i=0;i<num;i++){
				if(i==num){
					dataBuffer.append("'/ppt/images/"+imagepath+"/"+(i+1)+""+Pdf2Jpg.SUFF_IMAGE+"'");
				}else{
					dataBuffer.append("'/ppt/images/"+imagepath+"/"+(i+1)+""+Pdf2Jpg.SUFF_IMAGE+"',");
				}
			}
			dataBuffer.append("]");
			//System.out.print(dataBuffer.toString());
		%>
		<script type="text/javascript">
			var data=<%=dataBuffer.toString()%>;
		</script>
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="MPreview/js/MPreviewPPT.js"></script>
    <script type="text/javascript">$('#ppt').MPreviewPPT({ data:data});</script>
    <script type="text/javascript">
    $(document).ready(function (){
    	$('.wrapper').css('height','80%');
    });
    </script>
</body>
</html>
