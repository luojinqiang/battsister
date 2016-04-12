<%@page contentType="text/html; charset=utf-8" %>

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
<div class="top_bg">
	<div class="top_con">
        <div class="top_nav">欢迎来到厚学网！您尚未 [<a href="login.jsp">登录</a>]</div>
        <!-- <div class="search">
        	<div class="search_botton"><a href="#">搜索</a></div>
            <input name="" type="text" class="input_search" placeholder="请输入您要搜索的内容">
            <div class="clear"></div>
        </div> -->
        <div class="clear"></div>
    </div>
</div>
<!--=== Header ===-->
<div class="headerbg">               
    <div class="header"> 
        <div class="logo">                                           
            <a href="index.html"><img src="/front_style/images/logo.png" alt="Logo" /></a>
        </div>                                               
         <ul class="navbar">
            <li  class="active_index">
            	<a href="index.jsp">
                	<h3>首页</h3>
                    <p>home</p>
                </a>
            </li>
            <li class="em_line">|</li>
            <li>
            	<a href="news.jsp">
                	<h3>新闻动态</h3>
                    <p>news</p>
                </a>
            </li>
            <li class="em_line">|</li>
            <li>
            	<a href="course.jsp">
                	<h3>课程推荐</h3>
                    <p>courses</p>
                </a>
            </li> 
            <li class="em_line">|</li>
            <li>
            	<a href="industry_resources.jsp">
                	<h3>行业资源</h3>
                    <p>industry</p>
                </a>
            </li>
            <li class="em_line">|</li>
            <li>
            	<a href="professional_resources.jsp">
                	<h3>专业资源</h3>
                    <p>professional</p>
                </a>
             </li>
            <li class="em_line">|</li>
            <li>
            	<a href="about.jsp">
                	<h3>关于我们</h3>
                    <p>about us</p>
                </a>
            </li>
        </ul>
        <div class="clear"></div>                
  </div>           
</div>   
<!--=== End Header ===-->
<div class="ct-banner">
    <div class="ct-focusbox">         
        <div class="ct-focusimg ">
            <ul class="ct-fimglist">
                <li class="ct-banner01"></li>
                <li class="ct-banner02"></li>
                <li class="ct-banner03"></li>
                <li class="ct-banner04"></li>
            </ul>
        </div> 
        <div class="ct-focustool w1100">
            <ul class="ct-ftoollist">
                <li class="on"><a href="javascript:void(0);"><img src="/front_style/images/ct-banner01_s.jpg"></a></li>
                <li><a href="javascript:void(0);"><img src="/front_style/images/ct-banner02_s.jpg"></a></li>
                <li><a href="javascript:void(0);"><img src="/front_style/images/ct-banner03_s.jpg"></a></li>
                <li><a href="javascript:void(0);"><img src="/front_style/images/ct-banner04_s.jpg"></a></li>
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
		<div class="item">
			<img src="/front_style/images/tu.jpg" alt="">
			<div class="shd"><a href="#"></a></div>
			<div class="txt">
				<h3><a href="#">课程标题1</a></h3>
				<p>精通Java程序设计、JavaEE体系架构、主流开源框架、设计模式、项目管理等。擅长从浅入深，循序渐进。</p>
			</div>
		</div>
		<div class="item">
			<img src="/front_style/images/tu.jpg" alt="">
			<div class="shd"><a href="#"></a></div>
			<div class="txt">
				<h3><a href="#">课程标题2</a></h3>
				<p>精通Java程序设计、JavaEE体系架构、主流开源框架、设计模式、项目管理等。擅长从浅入深，循序渐进。</p>
			</div>
		</div>
		<div class="item">
			<img src="/front_style/images/tu.jpg" alt="">
			<div class="shd"><a href="#"></a></div>
			<div class="txt">
				<h3><a href="#">课程标题3</a></h3>
				<p>精通Java程序设计、JavaEE体系架构、主流开源框架、设计模式、项目管理等。擅长从浅入深，循序渐进。</p>
			</div>
		</div>
		<div class="item">
			<img src="/front_style/images/tu.jpg" alt="">
			<div class="shd"><a href="#"></a></div>
			<div class="txt">
				<h3><a href="#">课程标题4</a></h3>
				<p>精通Java程序设计、JavaEE体系架构、主流开源框架、设计模式、项目管理等。擅长从浅入深，循序渐进。</p>
			</div>
		</div>
		<div class="item">
			<img src="/front_style/images/tu.jpg" alt="">
			<div class="shd"><a href="#"></a></div>
			<div class="txt">
				<h3><a href="#">课程标题5</a></h3>
				<p>精通Java程序设计、JavaEE体系架构、主流开源框架、设计模式、项目管理等。擅长从浅入深，循序渐进。</p>
			</div>
		</div>
		<div class="item">
			<img src="/front_style/images/tu.jpg" alt="">
			<div class="shd"><a href="#"></a></div>
			<div class="txt">
				<h3><a href="#">课程标题6</a></h3>
				<p>精通Java程序设计、JavaEE体系架构、主流开源框架、设计模式、项目管理等。擅长从浅入深，循序渐进。</p>
			</div>
		</div>
		<div class="item">
			<img src="/front_style/images/tu.jpg" alt="">
			<div class="shd"><a href="#"></a></div>
			<div class="txt">
				<h3><a href="#">课程标题7</a></h3>
				<p>精通Java程序设计、JavaEE体系架构、主流开源框架、设计模式、项目管理等。擅长从浅入深，循序渐进。</p>
			</div>
		</div>
		<div class="item">
			<img src="/front_style/images/tu.jpg" alt="">
			<div class="shd"><a href="#"></a></div>
			<div class="txt">
				<h3><a href="#">课程标题8</a></h3>
				<p>精通Java程序设计、JavaEE体系架构、主流开源框架、设计模式、项目管理等。擅长从浅入深，循序渐进。</p>
			</div>
		</div>
		<div class="item">
			<img src="/front_style/images/tu.jpg" alt="">
			<div class="shd"><a href="#"></a></div>
			<div class="txt">
				<h3><a href="#">课程标题9</a></h3>
				<p>精通Java程序设计、JavaEE体系架构、主流开源框架、设计模式、项目管理等。擅长从浅入深，循序渐进。</p>
			</div>
		</div>
		<div class="item">
			<img src="/front_style/images/tu.jpg" alt="">
			<div class="shd"><a href="#"></a></div>
			<div class="txt">
				<h3><a href="#">课程标题10</a></h3>
				<p>精通Java程序设计、JavaEE体系架构、主流开源框架、设计模式、项目管理等。擅长从浅入深，循序渐进。</p>
			</div>
		</div>
		<div class="item">
			<img src="/front_style/images/tu.jpg" alt="">
			<div class="shd"><a href="#"></a></div>
			<div class="txt">
				<h3><a href="#">课程标题11</a></h3>
				<p>精通Java程序设计、JavaEE体系架构、主流开源框架、设计模式、项目管理等。擅长从浅入深，循序渐进。</p>
			</div>
		</div>
		<div class="item">
			<img src="/front_style/images/tu.jpg" alt="">
			<div class="shd"><a href="#"></a></div>
			<div class="txt">
				<h3><a href="#">课程标题12</a></h3>
				<p>精通Java程序设计、JavaEE体系架构、主流开源框架、设计模式、项目管理等。擅长从浅入深，循序渐进。</p>
			</div>
		</div>
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
                    <a href="#">
                    <div class="news_list">
                        <div class="date">
                            <div class="month">
                                <span>12</span>
                                <span>月</span>
                            </div>
                            <div class="day">24</div>
                        </div>
                        <div class="news_index_con">
                            <div class="news_index_img"><img src="/front_style/images/tu.jpg"></div>
                            <div class="news_index_word">
                                <h5>华晨客车有限公司员工电动汽车安全培训</h5>
                              <p>对华晨客车（大连）有限公司员工进行电动汽车安全培训对华晨客车（大连）有限公训……</p>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    </a>
                    <a href="#">
                    <div class="news_list">
                        <div class="date">
                            <div class="month">
                                <span>12</span>
                                <span>月</span>
                            </div>
                            <div class="day">24</div>
                        </div>
                        <div class="news_index_con">
                            <div class="news_index_img"><img src="/front_style/images/tu.jpg"></div>
                            <div class="news_index_word">
                                <h5>华晨客车有限公司员工电动汽车安全培训</h5>
                              <p>对华晨客车（大连）有限公司员工进行电动汽车安全培训对华晨客车（大连）有限公训……</p>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>	
                    </a>
                    <a href="#">
                    <div class="news_list">
                        <div class="date">
                            <div class="month">
                                <span>12</span>
                                <span>月</span>
                            </div>
                            <div class="day">24</div>
                        </div>
                        <div class="news_index_con">
                            <div class="news_index_img"><img src="/front_style/images/tu.jpg"></div>
                            <div class="news_index_word">
                                <h5>华晨客车有限公司员工电动汽车安全培训</h5>
                              <p>对华晨客车（大连）有限公司员工进行电动汽车安全培训对华晨客车（大连）有限公训……</p>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    </a>			
                </div>
                <div  class="s1_right">
                    <a href="#">
                    <div class="news_list">
                        <div class="date">
                            <div class="month">
                                <span>12</span>
                                <span>月</span>
                            </div>
                            <div class="day">24</div>
                        </div>
                        <div class="news_index_con">
                            <div class="news_index_img"><img src="/front_style/images/tu.jpg"></div>
                            <div class="news_index_word">
                                <h5>华晨客车有限公司员工电动汽车安全培训</h5>
                              <p>对华晨客车（大连）有限公司员工进行电动汽车安全培训对华晨客车（大连）有限公训……</p>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    </a>
                    <a href="#">
                    <div class="news_list">
                        <div class="date">
                            <div class="month">
                                <span>12</span>
                                <span>月</span>
                            </div>
                            <div class="day">24</div>
                        </div>
                        <div class="news_index_con">
                            <div class="news_index_img"><img src="/front_style/images/tu.jpg"></div>
                            <div class="news_index_word">
                                <h5>华晨客车有限公司员工电动汽车安全培训</h5>
                              <p>对华晨客车（大连）有限公司员工进行电动汽车安全培训对华晨客车（大连）有限公训……</p>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>	
                    </a>
                    <a href="#">
                    <div class="news_list">
                        <div class="date">
                            <div class="month">
                                <span>12</span>
                                <span>月</span>
                            </div>
                            <div class="day">24</div>
                        </div>
                        <div class="news_index_con">
                            <div class="news_index_img"><img src="/front_style/images/tu.jpg"></div>
                            <div class="news_index_word">
                                <h5>华晨客车有限公司员工电动汽车安全培训</h5>
                              <p>对华晨客车（大连）有限公司员工进行电动汽车安全培训对华晨客车（大连）有限公训……</p>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    </a>
                </div>	
                <div class="clear"></div>
            </div>
        </div>
    </div>
</div>
<!--===End wrapper1 ===-->


<div class="system">
    <div class="system_con">
        <div class="system_word">
            <h1>考试系统</h1>
            <p>在线考试、在线学习、在线培训、在线练习功能随机试卷，人工组卷、自定义抽题百分百适应性强，科目、部门结构、功能名称等都可自定义试卷多样化在线考试、在线学习、在线培训、在线练习功能随机试卷，人工组卷、自定义抽题百分百适应性强，科目、部门结构、功能名称等都可自定义试卷多样化</p>
            <div class="botton4"><a href="#">考试系统</a></div>
        </div>
        <div class="clear"></div>
    </div>	
</div>

<div class="container">
	<div class="title">
        <h1>合作单位</h1>
        <h6>Cooperative enterprises</h6>
    </div>
    <div class="s2_con">
    	<div class="mr_frbox">
            <img class="mr_frBtnL prev" src="/front_style/images/mfrL.jpg" width="28" height="46" />
            <div class="mr_frUl">
                <ul>
                    <li>
                    	<p><img src="/front_style/images/mfr_1.jpg"/></p>
                    	<p><img src="/front_style/images/mfr_2.jpg"/></p>
                    	<p><img src="/front_style/images/mfr_2.jpg"/></p>
                        <p><img src="/front_style/images/mfr_1.jpg"/></p>
                    </li>
                    <li>
                        <p><img src="/front_style/images/mfr_3.jpg"/></p>
                        <p><img src="/front_style/images/mfr_6.jpg"/></p>
                        <p><img src="/front_style/images/mfr_2.jpg"/></p>
                        <p><img src="/front_style/images/mfr_3.jpg"/></p>
                    </li>
                    <li>
                        <p><img src="/front_style/images/mfr_4.jpg"/></p>
                        <p><img src="/front_style/images/mfr_7.jpg"/></p>
                        <p><img src="/front_style/images/mfr_2.jpg"/></p>
                        <p><img src="/front_style/images/mfr_3.jpg"/></p>
                    </li>
                    <li>
                    	<p><img src="/front_style/images/mfr_5.jpg"/></p>
                        <p><img src="/front_style/images/mfr_8.jpg"/></p>
                        <p><img src="/front_style/images/mfr_2.jpg"/></p>
                        <p><img src="/front_style/images/mfr_3.jpg"/></p>
                    </li>
                    <li>
                    	<p><img src="/front_style/images/mfr_1.jpg"/></p>
                        <p><img src="/front_style/images/mfr_2.jpg"/></p>
                        <p><img src="/front_style/images/mfr_2.jpg"/></p>
                        <p><img src="/front_style/images/mfr_3.jpg"/></p>
                    </li>
                    <li>
                    	<p><img src="/front_style/images/mfr_3.jpg"/></p>
                        <p><img src="/front_style/images/mfr_6.jpg"/></p>
                        <p><img src="/front_style/images/mfr_2.jpg"/></p>
                        <p><img src="/front_style/images/mfr_3.jpg"/></p>
                    </li>
                    <li>
                    	<p><img src="/front_style/images/mfr_4.jpg"/></p>
                        <p><img src="/front_style/images/mfr_7.jpg"/></p>
                        <p><img src="/front_style/images/mfr_2.jpg" /></p>
                    </li>
                </ul>
            </div>
            <img class="mr_frBtnR next" src="/front_style/images/mfrR.jpg" width="28" height="46" />
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

<!-- <div class="bg_s5">
    <div class="container">
    	<div class="section5">
           <div class="s5_left">
                <div class="title_s5">联系我们</div>
                <h6>Get in  touch with us </h6>
                <p>深圳市汉优科技有限公司</p>
                <ul>
                	<li class="ic_ad">地址: 深圳市龙华民治大道1083展滔科技大厦c座1411</li>
                    <li class="ic_email">邮箱：hanyouapp@qq.com</li>
                    <li class="ic_tel">电话：0755-28521510</li>
                </ul>
           </div>
           <div class="s5_center">
          		<div class="title_s5">关注我们</div>
                <h6>Pay attention to us</h6>
                <p class="erweima"><img src="/front_style/images/erweima.jpg"></p>
                <p>扫描关注微信</p>		
          </div>
           <div class="s5_right">
           		<div class="title_s5">留言板</div>
                <h6>message board</h6>
                <div class="s5_label">
                	<input name="" type="text" class="s5_text" placeholder="姓名">
                    <input name="" type="text" class="s5_text" placeholder="电话">
                    <textarea name="" cols="" rows="" class="s5_textarea">请输入</textarea>
                    <a href="#"><div class="s5_botton">提交</div></a>
                    <div class="clear"></div>
                </div>
           </div>
           <div class="clear"></div>
        </div>
    </div>
</div> -->
<!-- 引入尾部 -->
<%@include file="front_footer.jsp" %>
</body>
</html>
