<%@page import="com.baje.sz.ajax.AjaxXml"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="java.util.List"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
	Selectic selectic=new Selectic();
	RequestUtil ru=new RequestUtil(request);
	int pages=ru.getInt("pages");
	pages=pages==0?1:pages;
	int pn=10;
	int newsClassId=0;
 	Doc classDoc=selectic.Get_Doc("id,classname","bs_news_class"," where isdel=0 and classename=? ","mysqlss",new Object[]{"xinwendongtai"});
 	if(classDoc!=null){
		newsClassId=classDoc.getIn("id");
 	}
 	List valuelist=new ArrayList();
 	valuelist.add(newsClassId);
 	String table="bs_news";
 	String file="id,newstitle,smallfile,addtime,note";
 	String where="isdel=0 and newsclass=?";
	int counts=selectic.Get_count("id",table,where, "mysqlss",valuelist);
	List<Doc> newslist=selectic.Get_List(pages, pn, counts, table, where, file, "order by addtime desc ", "mysqlss",valuelist);
	int page_size=selectic.getPageSize(counts, pn);
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
<!--=== Header ===-->
<jsp:include page="head.jsp">
	<jsp:param value="2" name="type"/>
</jsp:include>
<!--=== End Header ===-->
<div class="banner_news"></div>
<div class="container">
	<%
		if(newslist!=null){
			for(Doc doc:newslist){
				%>
				 <div class="news">
			        <div class="news_img"><a href="news_details.jsp?news_id=<%=doc.getIn("id")%>&type=2"><img src="<%=doc.get("smallfile")%>"></a></div>	
				        <div class="news_word">
				          <h3><a href="news_details.jsp?news_id=<%=doc.getIn("id")%>&type=2"><%=doc.get("newstitle")%></a></h3>
				          <div class="time"><%=AjaxXml.timeStamp2Date(doc.getIn("addtime"),"YY04-MM-DD")%></div>
				          <p><%=doc.get("note")%></p>
				            <div class="news_botton"><a href="news_details.jsp?news_id=<%=doc.getIn("id")%>&type=2">查看详情</a></div>
				        </div>
       			 	<div class="clear"></div>
  				 </div>
				<%
			}
		}
	%>
	<!-- 分页 -->
     <ul class="pre">
      <%=page_size>0?"<li><a href=\""+(pages!=1?"news.jsp?pages="+(pages-1):"javascript:void(0);")+"\"><</a></li>":""%>
       <%
       	int index=1;
       	int index2=page_size;
       	if(page_size>=5){
	       	if(pages+5<=page_size){
	       		index=pages;
	       		index2=pages+4;
	       	}
	       	if(pages+5>page_size){
	       		index=page_size-4;
	       	}
       	}
       	for(int i=index;i<=index2;i++){
       		out.print("<li"+(i==pages?" class=\"active_pre\"":"")+"><a href=\"news.jsp?pages="+i+"\">"+i+"</a></li>");
       	}
       %>
       <%=page_size>0?"<li><a href=\""+(pages!=page_size?"news.jsp?pages="+(pages+1):"javascript:void(0);")+"\">></a></li>":""%>
    </ul>
</div>

<!-- 引入尾部 -->
<%@include file="front_footer.jsp" %>
</body>
</html>
