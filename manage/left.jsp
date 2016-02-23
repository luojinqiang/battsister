<%@ page contentType="text/html; charset=utf-8" %>
<link href="/manage/css/colortemplate.css" rel="stylesheet" type="text/css"/>
<div class="sidebarWrap">
	<%
		if(gym_group_id==0){
	%>
	    <div class="sidebar" id="yonghu" style="display:none">
        <h3>
            <span>用户管理</span>
        </h3>
        <ul class="nav_list">

            <%
                if (current_flags.contains("1001")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('yonghu/yonghu.jsp','用户管理')">用户管理</a></li>
            <%
                }
                if (current_flags.contains("1004")) {
            %>
             <li><a href="javascript:window.parent.jianyi2('yonghu/level_experience_group.jsp?group_type=1','积分操作组别')">积分操作组别</a></li>
            <%
                }
                if (current_flags.contains("1005")) {
            %>
           <li><a href="javascript:window.parent.jianyi2('yonghu/level_experience_operating.jsp?operating_type=1','积分操作')">积分操作</a></li>
            <%
                }
                if (current_flags.contains("1007")) {
            %>
             <li><a href="javascript:window.parent.jianyi2('yonghu/level_experience_operating_user.jsp?operating_type=1','积分获取情况')">积分获取情况</a></li>
            <%
                }
               %>
        </ul>
    </div>
	<%
		}
	%>

    <div class="sidebar" id="jianshenfang" style="display:none">
        <h3>
            <span>健身房管理</span>
        </h3>
        <ul class="nav_list">
            <%
                if (gym_group_id == 0) {
                    if (current_flags.contains("3001")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('jianshenfang/jituan.jsp','连锁集团管理')">连锁集团管理</a></li>
            <%
                    }
                }
						 if(gym_id==0){  
                if (current_flags.contains("3005")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('jianshenfang/gym.jsp','健身房管理')">健身房管理</a></li>
            <%
                }
					  	} 
                if (current_flags.contains("3009")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('jianshenfang/coach.jsp','教练管理')">教练管理</a></li>
            <%}
				if (current_flags.contains("3045")) { 
				%>
            <li><a href="javascript:window.parent.jianyi2('jianshenfang/device.jsp','设备管理')">设备管理</a></li>
            <%
                 }
                 if (current_flags.contains("3049")) {
             %>
             <li>
                 <a href="javascript:window.parent.jianyi2('jianshenfang/bodyMeasure_titai.jsp', '体态管理')">体态管理</a>
             </li>
             <%
                 } 
                 if(current_flags.contains("3050")){
                 	%>
                 	 <li>
                 <a href="javascript:window.parent.jianyi2('jianshenfang/bodyMeasure_tineng.jsp', '体能管理')">体能管理</a>
             </li>
                 	<%
                 }
                 if(current_flags.contains("3051")){
              		%>
              		  <li><a href="javascript:window.parent.jianyi2('jianshenfang/bodyMeasure_tice.jsp', '体测管理')">体测管理</a>
            				 </li>
              		<%
                 }
                if (current_flags.contains("3017")) {
            %>
            <li>
                <a href="javascript:window.parent.jianyi2('jianshenfang/gym_member_book.jsp?book_type=1','预约私教')">预约私教</a>
            </li>
            <% 
                }
            %>
        </ul>
    </div>
    <div class="sidebar" id="order" style="display:none">
        <h3>
            <span>订单管理</span>
        </h3>
        <ul class="nav_list">
            <%if (current_flags.contains("2007")) { %>
            <li><a href="javascript:window.parent.jianyi2('order/hy_order.jsp','订单管理')">订单管理</a></li>
            <%
                }
            if(gym_group_id==0){
            	if(current_flags.contains("2025")){
            		%>
            		<li><a href="javascript:window.parent.jianyi2('order/member_measure_item.jsp','体测项目')">体测项目</a>
            </li>
            		<%                       		
            	}
                if (current_flags.contains("2026")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('order/plan_action_type.jsp','动作类型')">动作类型</a></li>
            <%
                }
                if (current_flags.contains("2027")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('order/default_action.jsp','默认动作')">默认动作</a></li>
            <%
                }
                if (current_flags.contains("2028")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('order/plan_action_type.jsp?type=1','健身目标')">健身目标</a></li>
             <%} if (current_flags.contains("2029")) {
                            %>
                            <li>
                                <a href="javascript:window.parent.jianyi2('order/common_language_class.jsp?','常用语类型')">常用语类型</a>
                            </li><%
                } if(current_flags.contains("2030")){
                	%>
                	 <li>
                    	<a href="javascript:window.parent.jianyi2('order/common_language.jsp','常用语设置')">常用语设置</a>
                	</li>
                	<%
                	
                } if(current_flags.contains("2031")){
                    	%>
                    	<li><a href="javascript:window.parent.jianyi2('order/pro_class.jsp?class_status=1','商品栏目')">商品栏目</a></li>
                    	<%
                    }
            }
                if(current_flags.contains("2032")){
                    	%>
                    	 <li><a href="javascript:window.parent.jianyi2('order/pro_product.jsp','商品管理')">商品管理</a></li>
                    	<%
                    }
                if(gym_group_id==0){
	                if(current_flags.contains("2033")){
	                    	%>
	                   	<li><a href="javascript:window.parent.jianyi2('order/user_money.jsp','用户资金记录')">用户资金记录</a></li>
	                   	<%
	                   } 
	                }
	                   %>
             </ul>
    </div>
    <%
    if(gym_group_id==0){
        if (current_flags.contains("4004")) {
    %>
    <div class="sidebar" id="xinxi" style="display:none">
        <h3>
            <span>信息管理</span>
        </h3>
        <ul class="nav_list">
            <% if (current_flags.contains("4002")) {%>
            <li><a href="javascript:window.parent.jianyi2('xinxi/news.jsp','信息内容')">信息内容</a></li>
            <%
                }
                if (current_flags.contains("4001")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('xinxi/newsclass.jsp','信息栏目')">信息栏目</a></li>

            <%
                }
                if (current_flags.contains("4003")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('xinxi/news_edit.jsp','发布信息')">发布信息</a></li>
            <%
                }
            %>
        </ul>
    </div>
    <%
        }
    }
    %>
    <%
    	if(gym_group_id==0){
    %>
    <div class="sidebar" id="faxian" style="display:none">
        <h3>
            <span>发现管理</span>
        </h3>
        <ul class="nav_list">
            <% if (current_flags.contains("5001")) { %>
            <li><a href="javascript:window.parent.jianyi2('faxian/wenzhang.jsp','发现文章')">发现文章</a></li>
            <%
                }
                if (current_flags.contains("5005")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('faxian/huifu.jsp','文章评论')">文章评论</a></li>
            <%
                }
                if (current_flags.contains("5007")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('faxian/hy_friendster_carousel.jsp','每日推荐')">每日推荐</a></li>
            <%} %>
        </ul>
    </div>
	<%
    	}
	%>
    <div class="sidebar" id="xitong" style="display:none">
        <h3>
            <span>系统管理管理</span>
        </h3>
        <ul class="nav_list">
            <%
          if(gym_group_id==0){
            if (current_flags.contains("6001")) { %>
            <li><a href="javascript:window.parent.jianyi2('xitong/rizhi.jsp','系统日志')">系统日志</a></li>
            <li><a href="javascript:window.parent.jianyi2('xitong/rizhi.jsp?log_type=2','教练系统日志')">教练系统日志</a></li>
            <%
                }
                if (current_flags.contains("6002")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('xitong/keyword.jsp','关键词管理')">关键词管理</a></li>
            <%
                }
                if (current_flags.contains("6009")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('xitong/thirdPartyApply.jsp','加盟申请')">加盟申请</a></li>
            <%
                }
                if (current_flags.contains("6006")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('xitong/guanliyuan.jsp','后台管理员管理')">后台管理员管理</a></li>
            <%
                }
                if (current_flags.contains("6003")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('xitong/userfeedback.jsp','用户反馈')">用户反馈</a></li>
            <%
                }
                if (current_flags.contains("6008")) {
            %>
            <li><a href="javascript:window.parent.jianyi2('xitong/tuisong.jsp','会员推送')">会员推送</a></li>
            <%
            }
          }
            %>
            <li><a href="javascript:window.parent.jianyi2('xitong/password_edit.jsp','修改密码')">修改密码</a></li>
        </ul>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(
            function () {
                var leftarr = ['yonghu', 'order', 'jianshenfang', 'xinxi', 'xitong', 'faxian'];
                var nowhref = window.location.href;
                for (l in leftarr) {
                    if (nowhref.indexOf(leftarr[l]) > -1) {
                        $("#" + leftarr[l]).show();
                    } else {
                        $("#" + leftarr[l]).hide();
                    }
                }
            });
</script>