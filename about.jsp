<%@page contentType="text/html; charset=utf-8" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>关于我们</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
</head>

<body class="bg_white">
<jsp:include page="head.jsp">
	<jsp:param value="6" name="type"/>
</jsp:include>
<!--=== End Header ===-->
<div class="banner_about"></div>

<!--=== about ===-->
<div class="container">
    <div class="s_about_left">
         <h1>公司简介</h1>
         <h6>company profile</h6>
    	<p>深圳市派司德科技有限公司成立于2007年，是一家专业从事新能源汽车技术教学实训设备研发与生产、新能源汽车技术教学资源开发及新能源汽车运维服务的高新技术企业。公司自成立以来，以新能源技术为导向，以优质的服务为保障，秉承“诚实守信，团结创新，目标力行，卓越共赢”的核心价值观和“专业专注，满足客户需求，超越客户期望”的企业理念，相继与国内外多家整车厂及院校合作，开展新能源汽车设计、新能源汽车专业人才培养及新能源汽车运维服务等工作。</p>
        <p> 公司分别在深圳和北京设立了产品研发及生产基地，合计占地6000余平方米，并在四川、山东、安徽、辽宁等地设立直属分支机构。组建了一支拥有丰富的新能源汽车专业技术及教育培训经验的研发团队，并汇聚了众多新能源汽车领域专业技术人才和管理人才。公司现有员工300余名，其中高级工程师21名，博士、硕士学历的高素质人才50余名。</p>
    </div>
    <div class="s_about_right"><img src="/front_style/images/about1.jpg"></div>
    <div class="clear"></div>
</div>

<div class="wrapper2">
    <div class="container">
    	<div class="s_title">
            <h1>企业文化</h1>
            <h6>corporate culture</h6>
        </div>
        <div class="s_about">
        	<div class="s_about_one s_mr">
            	<h3>企业愿景</h3>
                <p>助推中国新能源技术腾飞</p>
            </div>
            <div class="s_about_one s_mr">
            	<h3>企业精神</h3>
                <p>服务  创新  规范  理解</p>
                <p>通过服务，树立企业品牌形象</p>
				<p>通过创新，造就企业发展机会</p>
				<p>通过规范，完善企业运行机制</p>
				<p>通过理解，形成企业良好文化</p>
            </div>
            <div class="s_about_one">
            	<h3>用人理念</h3>
                <p>（1）强调能力有差别，但责任大于能力；</p>
                <p>（2）强调效率限于对公司的认识；</p>
				<p>（3）强调协作、团队精神；</p>
				<p>（4）强调忠诚、责任的价值观念。</p>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>

<div class="container">
    <div class="title">
        <h1>荣誉证书</h1>
        <h6>Certificate of honor</h6>
    </div>
    <div class="s_about">
    	<ul>
        	<li class="mr_li"><img src="/front_style/images/zhengshu1.jpg"></li>
            <li class="mr_li"><img src="/front_style/images/zhengshu2.jpg"></li>
            <li class="mr_li"><img src="/front_style/images/zhengshu3.jpg"></li>
            <li class="mr_li"><img src="/front_style/images/zhengshu4.jpg"></li>
            <li><img src="/front_style/images/zhengshu5.jpg"></li>
            <div class="clear"></div>
        </ul>
    </div>
</div>

<!-- 引入尾部 -->
<%@include file="front_footer.jsp" %>

</body>
</html>
