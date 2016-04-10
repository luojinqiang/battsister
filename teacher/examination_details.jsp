<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.baje.sz.util.Doc"%>
<%@page import="com.baje.sz.util.Selectic"%>
<%@page import="com.baje.sz.util.RequestUtil"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
	RequestUtil ru=new RequestUtil(request);
	int question_id=ru.getInt("question_id");
	Selectic selectic=new Selectic();
	Doc questionDoc=selectic.Get_Doc("id,name,type,question,limit_time,end_time","bs_examination", " where isdel=0 and id=?","mysqlss",new Object[]{question_id});
	if(questionDoc==null||questionDoc.isEmpty()){
		out.print("	<script>alert(\"该试题不存在\");window.location.href='/login.jsp';</script>");
		return;
	}
	StringBuffer wenhaoBuffer=new StringBuffer("");
	List valueList=new ArrayList();
	if(questionDoc.get("question")!=null&&!"".equals(questionDoc.get("question"))){
		String ss[]=questionDoc.get("question").split(",");
		if(ss!=null){
			for(int i=0;i<ss.length;i++){
				valueList.add(ss[i]);
				  if (i == 0) {
					  	wenhaoBuffer.append("?");
		             } else {
		            	wenhaoBuffer.append(",?");
		             }
			}
		}
	}
	String table="bs_exercise_library";
	String file="name,name_pic,type,thoughts";
	String wheres="isdel=0 and id in ("+wenhaoBuffer.toString()+")";
	int counts=selectic.Get_count("id", table, wheres, "mysqlss",valueList);
	int pages=ru.getInt("pages");
	pages=pages==0?1:pages;
	int pn=5;
	int page_size=selectic.getPageSize(counts, pn);
	List<Doc> list=selectic.Get_List(pages, pn, counts, table, wheres, file, "", "mysqlss");
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>试题详情</title>
<meta name="keywords"  content="#" />
<meta name="description" content="#" />
<link href="/front_style/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
//=点击展开关闭效果=
function open_zzjs_net(oSourceObj,oTargetObj,shutAble,oOpenTip,oShutTip){
var sourceObj = typeof oSourceObj == "string" ? document.getElementById(oSourceObj) : oSourceObj;
var targetObj = typeof oTargetObj == "string" ? document.getElementById(oTargetObj) : oTargetObj;
var openTip = oOpenTip || "";
var shutTip = oShutTip || "";
if(targetObj.style.display!="none"){
   if(shutAble) return;
   targetObj.style.display="none";
   if(openTip  &&  shutTip){
    sourceObj.innerHTML = shutTip;
   }
} else {
   targetObj.style.display="block";
   if(openTip  &&  shutTip){
    sourceObj.innerHTML = openTip;
   }
}
}
</script>

</head>

<body>
<!-- 引入头部 -->
<jsp:include page="head.jsp">
	<jsp:param value="2" name="type"/>
</jsp:include>

<div class="container">
    <div class="info">
    	<a href="teacher_home.jsp">首页</a><em>></em><a href="teaching.jsp">我要授课</a><em>></em><a href="examination_system.jsp">考试系统</a><em>></em><a href="examination_record.jsp">考试记录</a>
    </div>
</div>
<div class="container">
	<div class="ex_wrap">
		<div class="title_r">考试名称<i>参考人员：全体学员</i><i>考试时长：<%=questionDoc.getIn("")%>分钟</i><i>试题数量：<%=counts%></i></div>
        <div class="ex_one">
            <div class="ex_one_title"><em>单选</em><span>1/20</span>驾驶机动车辆在道路上违反道路交通规则安全法的行为，属于什么行为？</div>
            <ul>
                 <li>
                	<input name="" type="radio" value="0" class="input_radio">
                    <div class="da_an">
                        <p>A、违章行为</p>
                        <div class="da_an_img"><img src="images/user1.jpg"></div>
                    </div>
                    <div class="clear"></div>
               </li>
               <li>
                	<input name="" type="radio" value="0" class="input_radio">
                    <div class="da_an">
                        <p>B、违法行为</p>
                        <div class="da_an_img"><img src="images/user.jpg"></div>
                    </div>
                    <div class="clear"></div>
               </li>
               <li>
                	<input name="" type="radio" value="0" class="input_radio">
                    <div class="da_an">
                        <p>C、过失行为</p>
                        <div class="da_an_img"><img src="images/user1.jpg"></div>
                    </div>
                    <div class="clear"></div>
               </li>
               <li>
                	<input name="" type="radio" value="0" class="input_radio">
                    <div class="da_an">
                    	<p>D、违规行为</p>
                        <div class="da_an_img"><img src="images/user.jpg"></div>
                    </div>
                    <div class="clear"></div>
               </li>
            </ul>
            <div class="ex_botton"><a onclick="open_zzjs_net(this,'zzjs_net1')">本题答案以及解释</a></div>
            <div id="zzjs_net1" class="zzjs_net" style="display:none">本题正确答案B。违反《道路交通安全法》，肯定是违反法律了，当然也就是违法行为了。现在已经没有违规行为和违章行为一说了，都是违法行为。</div>
        </div>
        <div class="ex_one">
            <div class="ex_one_title"><em>单选</em><span>1/20</span>驾驶机动车辆在道路上违反道路交通规则安全法的行为，属于什么行为？</div>
            <ul>
               <li>
                	<input name="" type="checkbox" value="0" class="input_checkbox">
                    <div class="da_an">
                    	<div class="da_an_img"><img src="images/user.jpg"></div>
                    </div>
                    <div class="clear"></div>
                </li>
                <li>
                	<input name="" type="checkbox" value="1" class="input_checkbox">
                    <div class="da_an">
                    	<p>B、违法行为</p>
                    </div>
                    <div class="clear"></div>
               </li>
               <li>
                	<input name="" type="checkbox" value="1" class="input_checkbox">
                    <div class="da_an">
                    	<p>C、过失行为</p>
                    </div>
                    <div class="clear"></div>
               </li>
               <li>
                	<input name="" type="checkbox" value="1" class="input_checkbox">
                    <div class="da_an">
                    	<p>D、违规行为</p>
                    </div>
                    <div class="clear"></div>
               </li>
            </ul>
            <div class="ex_botton"><a onclick="open_zzjs_net(this,'zzjs_net2')">本题答案以及解释</a></div>
            <div id="zzjs_net2" class="zzjs_net" style="display:none">本题正确答案B。违反《道路交通安全法》，肯定是违反法律了，当然也就是违法行为了。现在已经没有违规行为和违章行为一说了，都是违法行为。</div>
        </div>
         <ul class="pre">
        	<li><a href="#"><</a></li>
          	<li><a href="#">1</a></li>
          	<li><a href="#">2</a></li>
          	<li><a href="#">3</a></li>
          	<li><a href="#">4</a></li>
       	  	<li class="active_pre"><a href="#">5</a></li>
          	<li><a href="#">></a></li>
        </ul>
    </div>	
</div>

<!-- 引入尾部 -->
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>

