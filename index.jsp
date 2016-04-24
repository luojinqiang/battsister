<%@page import="java.util.ArrayList"%>
<%@page import="com.baje.sz.ajax.AjaxXml"%>
<%@page import="java.util.List"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	String action=ru.getString("action");
	if("logOut".equals(action)){
		session.removeAttribute("teacher_id");
		session.removeAttribute("teacher_name");
		session.removeAttribute("student_id");
		session.removeAttribute("student_name");
	}
	Object teacher_id=session.getAttribute("teacher_id");
	Object student_id=session.getAttribute("student_id");
	Selectic selectic=new Selectic();
/* 	//banner图
	Doc bannerDoc=selectic.Get_Doc("id,banner_pics", "bs_info"," where isdel=0 and id=? ","mysqlss");
	JSONArray bannerArray=null;
	if(bannerDoc!=null&&bannerDoc.get("banner_pics")!=null&&!"".equals(bannerDoc.get("banner_pics"))){
		bannerArray=JSONArray.fromObject(bannerDoc.get("banner_pics"));
	}
 	*/
 //推荐课程
 List<Doc> courseList=selectic.Get_List("id,name,introduce,pic", "bs_course", " where isdel=0 and is_recommend=1 order by order_num asc ","mysqlss");
 //新闻列表
 int newsClassId=0;
 Doc classDoc=selectic.Get_Doc("id,classname","bs_news_class"," where isdel=0 and classename=? ","mysqlss",new Object[]{"xinwendongtai"});
 if(classDoc!=null){
	 newsClassId=classDoc.getIn("id");
 }
 List<Doc> newsList=selectic.Get_List("id,newstitle,smallfile,addtime,note", "bs_news"," where isdel=0 and newsclass=? order by addtime desc, ordernum asc limit 6  ", "mysqlss",new Object[]{newsClassId});
 //合作企业、院校
 List<Doc> cooperationList=selectic.Get_List("id,type,name,pic,weburl", "bs_cooperation_unit", " where isdel=0","mysqlss");
 List<Doc> cooperationList1=new ArrayList();
 List<Doc> cooperationList2=new ArrayList();
 if(cooperationList!=null){
	 for(int i=0;i<cooperationList.size();i++){
		 if(cooperationList.get(i).getIn("type")==1){
			 cooperationList1.add(cooperationList.get(i));
		 }else{
			 cooperationList2.add(cooperationList.get(i));
		 }
	 }
 }
 %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>网站首页</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" href="/front_style/css/owl.carousel.css">
<link type="text/css" rel="stylesheet" href="/front_style/css/owl.theme.css">
<script type="text/javascript" src="/front_style/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/front_style/js/wkct-js.js"></script>
<script type="text/javascript" src="/front_style/js/owl.carousel.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#scroll').owlCarousel({
		items: 4,
		autoPlay: true,
		navigation: true,
		navigationText: ["",""],
		scrollPerPage: true
	});
});
</script>
<script type="text/javascript" src="/front_style/js/jquery.SuperSlide2.js"></script>
</head>

<body class="bg_white">
<!--=== Header ===-->
<jsp:include page="head.jsp">
	<jsp:param value="1" name="type"/>
</jsp:include>
<!--=== End Header ===-->
<div class="ct-banner">
    <div class="ct-focusbox">         
        <div class="ct-focusimg ">
            <ul class="ct-fimglist">
                <li class="ct-banner01"></li>
                <li class="ct-banner02"></li>
                <li class="ct-banner03"></li>
            </ul>
        </div> 
        <div class="ct-focustool w100">
            <ul class="ct-ftoollist">
                <li class="on"><a href="javascript:void(0)"><img src="/front_style/images/ct-banner01_s.jpg"></a></li>
                <li><a href="javascript:void(0)"><img src="/front_style/images/ct-banner02_s.jpg"></a></li>
                <li><a href="javascript:void(0)"><img src="/front_style/images/ct-banner03_s.jpg"></a></li>
            </ul>
        </div>
    </div>
</div>


<div class="scroll-outer">
    <div class="title">
        <h1>课程推荐</h1>
        <h6>Course recommendation</h6>
    </div>
	<div id="scroll" class="owl-carousel">
	<%
		if(courseList!=null){
			for(Doc doc:courseList){
	%>
		<div class="item">
			<img src="<%=doc.get("pic")%>" alt="<%=doc.get("name")%>">
			<div class="shd"><a href="course_details.jsp?course_id=<%=doc.getIn("id")%>"></a></div>
			<div class="txt">
				<h3><a href="course_details.jsp?course_id=<%=doc.getIn("id")%>"><%=doc.get("name")%></a></h3>
				<p><%=doc.get("introduce")%></p>
			</div>
		</div>
	<%
			}
		}
	%>
	</div>
</div>

<!--=== wrapper1 ===-->
<div class="wrapper1">
    <div class="container">
        <div class="section1">
            <div class="title">
                <h1>新闻动态</h1>
                <h6>news information</h6>
            </div>
            <div class="s1_con">
                <div class="s1_left">
                     <%
            	if(newsList!=null){
            		for(int i=0;i<newsList.size()&&i<3;i++){
            			Doc doc=newsList.get(i);
            			%>
                    <a href="news_details.jsp?news_id=<%=doc.getIn("id")%>">
	                    <div class="news_list">
	                        <div class="date">
	                            <div class="month">
	                                <span><%=AjaxXml.timeStamp2Date(doc.getIn("addtime"), "MM")%></span>
	                                <span>月</span>
	                            </div>
	                            <div class="day"><%=AjaxXml.timeStamp2Date(doc.getIn("addtime"), "DD")%></div>
	                        </div>
	                        <div class="news_index_con">
	                            <div class="news_index_img"><img src="<%=doc.get("smallfile")%>"></div>
	                            <div class="news_index_word">
	                                <h5><%=doc.get("newstitle")%></h5>
	                              <p><%=doc.get("note")%></p>
	                            </div>
	                        </div>
	                        <div class="clear"></div>
	                    </div>
                    </a>
            			<%
            		}
            	}
            %>
                </div>
                
                
                <div  class="s1_right">
                   <%
                   		if(newsList!=null){
                   			for(int i=3;i<newsList.size();i++){
                   				Doc doc=newsList.get(i);
                   				%>
                   	<a href="news_details.jsp?news_id=<%=doc.getIn("id")%>">
	                    <div class="news_list">
	                        <div class="date">
	                            <div class="month">
	                                <span><%=AjaxXml.timeStamp2Date(doc.getIn("addtime"), "MM")%></span>
	                                <span>月</span>
	                            </div>
	                            <div class="day"><%=AjaxXml.timeStamp2Date(doc.getIn("addtime"), "DD")%></div>
	                        </div>
	                        <div class="news_index_con">
	                            <div class="news_index_img"><img src="<%=doc.get("smallfile")%>"></div>
	                            <div class="news_index_word">
	                                <h5><%=doc.get("newstitle")%></h5>
	                              <p><%=doc.get("note")%></p>
	                            </div>
	                        </div>
	                        <div class="clear"></div>
	                    </div>
                    </a>
                   				<%
                   			}
                   %>
                </div>	
                <div class="clear"></div>
                 <%
            		}
                %>
            </div>
        </div>
    </div>
</div>
<!--===End wrapper1 ===-->

<div class="system">
    <div class="system_con">
        <div class="system_word">
            <h1>考试系统</h1>
            <div class="sys_one">
            	<h3>在线考试</h3>
                <p>在线考试系统采用随机抽题、人工组卷、题库类型百分比等可自定义出题</p>
            </div>
            <div class="sys_two">
            	<h3>自动评分</h3>
                <p>支持自动评分、自动改卷、成绩排名、错题回顾、解题思路等功能模块</p>
            </div>
            <div class="botton4"><a href="<%if(teacher_id!=null&&!"".equals(teacher_id)){out.print("/teacher/examination_system.jsp");}else if(student_id!=null&&!"".equals(student_id)){out.print("/student/test_history.jsp");}else{out.print("/login.jsp");}%>">考试系统</a></div>
        </div>
        <div class="clear"></div>
    </div>	
</div>
<div class="wrapper1">
    <div class="container">
        <div class="title">
            <h1>合作企业</h1>
            <h6>cooperative enterprise</h6>
        </div>
        <div class="s2_con">
        <%
        	if(cooperationList2.size()>0){
        %>
            <div class="mr_frbox">
                <img class="mr_frBtnL prev" src="/front_style/images/mfrL.png" width="28" height="46" />
                <div class="mr_frUl">
                    <ul>
                     <%
                    	
                    	for(int i=0;i<cooperationList2.size();i++){
                    		if(i%2==0){
                    			out.print(" <li> ");
                    		}
                    			out.print("<p><img src=\""+cooperationList2.get(i).get("pic")+"\"/></p>");
                    		if(i%3==0&&i!=0){
                    			out.print(" </li> ");
                    		}
                    	}
                    out.print("</li>");
                    %> 
                    </ul>
                </div>
                <img class="mr_frBtnR next" src="/front_style/images/mfrR.png" width="28" height="46" />
            </div>
            <%
        		}
            %>
            <script type="text/javascript">
            $(".mr_frbox").slide({
                titCell:"",
                mainCell:".mr_frUl ul",
                autoPage:true,
                effect:"leftLoop",
                autoPlay:true,
                vis:4
            });
            </script>
        </div>
        <div class="clear"></div>
    </div>
</div>

<div class="container">
    <div class="title">
        <h1>合作院校</h1>
        <h6>cooperative institutions</h6>
    </div>
    <div class="s2_con">
        <div class="mr_frbox">
            <img class="mr_frBtnL prev" src="/front_style/images/mfrL.png" width="28" height="46" />
            <div class="mr_frUl">
                <ul>
                 <%
                    	
                    	for(int i=0;i<cooperationList1.size();i++){
                    		if(i%2==0){
                    			out.print(" <li> ");
                    		}
                    			out.print("<p><img src=\""+cooperationList1.get(i).get("pic")+"\"/></p>");
                    		if(i%3==0&&i!=0){
                    			out.print(" </li> ");
                    		}
                    	}
                    out.print("</li>");
                    %> 
                </ul>
            </div>
            <img class="mr_frBtnR next" src="/front_style/images/mfrR.png" width="28" height="46" />
        </div>
        <script type="text/javascript">
        $(".mr_frbox").slide({
            titCell:"",
            mainCell:".mr_frUl ul",
            autoPage:true,
            effect:"leftLoop",
            autoPlay:true,
            vis:4
        });
        </script>
    </div>
    <div class="clear"></div>
</div>
<!-- 引入尾部 -->
<%@include file="front_footer.jsp" %>
</body>
</html>
