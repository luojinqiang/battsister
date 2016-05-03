<%@page import="java.util.ArrayList"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="java.util.List"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	Selectic selectic=new Selectic();
	int pages=ru.getInt("pages");
	pages=pages==0?1:pages;
	int pn=12;
	String table="bs_course";
	String file="id,name,introduce,pic,order_num,add_time";
	String where="isdel=0 and is_recommend=1";
	int counts=selectic.Get_count("id",table,where,"mysqlss",new ArrayList());
	List<Doc> courselist=selectic.Get_List(pages, pn, counts, table, where, file, "order by order_num asc  ", "mysqlss",new ArrayList());
	int page_size=selectic.getPageSize(counts, pn);
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>课程推荐</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/front_style/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/front_style/js/jquery.isotope.js"></script>
<script type="text/javascript" src="/front_style/js/script.js"></script>
</head>
<body class="bg_white">
<jsp:include page="head.jsp">
	<jsp:param value="3" name="type"/>
</jsp:include>
<!--=== End Header ===-->
<div class="banner_course"></div>
<div class="container">
   <div class="two_con">
   		<%
   			if(courselist!=null){
   				for(int i=0;i<courselist.size();i++){
   					Doc doc=courselist.get(i);
   					if(i!=0&&i%3==0){
   						%>
   						 <div class="re_one">
				        	<div class="re_one_img"><a href="course_details.jsp?course_id=<%=doc.getIn("id")%>"><img src="<%=doc.get("pic")%>"></a></div>
				            <div class="re_one_word">
				            	<h3><%=doc.get("name")%></h3>
				                <p><%=doc.get("introduce")%></p>
				            </div>
       					</div>
   						<%
   					}else{
   						%>
   						<div class="re_one re_one_right">
				        	<div class="re_one_img"><a href="course_details.jsp?course_id=<%=doc.getIn("id")%>"><img src="<%=doc.get("pic")%>"></a></div>
				            <div class="re_one_word">
				            	 <h3><%=doc.get("name")%></h3>
				                 <p><%=doc.get("introduce")%></p> 
				            </div>
       					</div>
   						<%
   					}
   				}
   			}
   		%>
        <div class="clear"></div>
      <!-- 分页 -->
     <ul class="pre">
      <%=page_size>0?"<li><a href=\""+(pages!=1?"course.jsp?pages="+(pages-1):"javascript:void(0);")+"\"><</a></li>":""%>
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
       		out.print("<li"+(i==pages?" class=\"active_pre\"":"")+"><a href=\"course.jsp?pages="+i+"\">"+i+"</a></li>");
       	}
       %>
       <%=page_size>0?"<li><a href=\""+(pages!=page_size?"course.jsp?pages="+(pages+1):"javascript:void(0);")+"\">></a></li>":""%>
    </ul>
   </div> 
</div>
<!-- 引入尾部 -->
<%@include file="front_footer.jsp" %>
</body>
</html>
