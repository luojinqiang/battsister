<%@page import="java.util.List"%>
<%@page import="com.baje.sz.ajax.AjaxXml"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	int news_id=ru.getInt("news_id");
	int type=ru.getInt("type");
	int other_type=ru.getInt("other_type");
	int pages=ru.getInt("pages");//几页
	Selectic selectic=new Selectic();
	Doc newsDoc=selectic.Get_Doc("id,newsclass,newstitle,bigfile,addtime,content", "bs_news", " where isdel=0 and id=? ","mysqlss",new Object[]{news_id});
	if(newsDoc==null||newsDoc.isEmpty()){
		out.print("	<script>alert(\"信息不存在\");window.location.href='news.jsp';</script>");
		return;
	}
	//查找到前一篇，下一篇
	int next_news_id=0;
	int previous_news_id=0;
	List<Doc> newsList=selectic.Get_List("id","bs_news", " where isdel=0 and newsclass=? order by ordernum asc ,addtime desc", "mysqlss",new Object[]{newsDoc.getIn("newsclass")});
	if(newsList!=null){
		for(int i=0;i<newsList.size();i++){
			if(newsList.get(i).getIn("id")==news_id){
				if(i!=0){
					previous_news_id=newsList.get(i-1).getIn("id");
				}
				if(i!=newsList.size()-1){
					next_news_id=newsList.get(i+1).getIn("id");
				}
			}
		}
	}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>新闻动态</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
</head>
<body class="bg_white">
<jsp:include page="head.jsp">
	<jsp:param value="<%=type%>" name="type"/>
</jsp:include>
<!--=== End Header ===-->
<!-- <div class="banner_news"></div> -->
<div class="container">
   <div class="news_title">
        <h2><%=newsDoc.get("newstitle")%></h2>
        <p><%=AjaxXml.timeStamp2Date(newsDoc.getIn("addtime"), "YY04-MM-DD HH:MI:SS")%></p>
   </div>
   <div class="news_con">
       <%=newsDoc.get("content") %>
   </div>
   <div class="re_list">
   		<div class="up_botton"><a href="<%
   			if(type==2){
   				out.print("news.jsp?pages="+pages);
   			}else if(type==4){
   				out.print("industry_resources.jsp?type="+other_type+"&pages="+pages);
   			}else{
   				out.print("professional_resources.jsp?type="+other_type+"&pages="+pages);
   			}
   		%>">返回列表</a></div>
        <%
       		if(previous_news_id>0){
       			%>
       			<div class="up_botton"><a href="news_details.jsp?news_id=<%=previous_news_id%>&type=<%=type%>&other_type=<%=other_type%>&pages=<%=pages%>">上一篇</a></div>
       			<%
       		}
        %>
       <%
      		if(next_news_id>0){
      			%>
      			 <div class="up_botton"><a href="news_details.jsp?news_id=<%=next_news_id%>&type=<%=type%>&other_type=<%=other_type%>&pages=<%=pages%>">下一篇</a></div>
      			<%
      		}
        %>
        <div class="clear"></div>
  </div>
   
</div>
<!-- 引入尾部 -->
<%@include file="front_footer.jsp" %>
</body>
</html>
