<%@page contentType="text/html; charset=utf-8" %>
 <script src="/front_style/js/jquery.contextmenu.js"></script>
<script type="text/javascript">
var menu1 = [
             /*{'刷新页面':function(menuItem,menu) { window.location.reload(); } }*/
         ];
         $(function() {
             $(this).contextMenu(menu1,{theme:'vista'});
         });
</script>
  <div class="footer">
    <div class="footer_con">
        <ul class="footer_nav">
            <li><a href="/about.jsp">关于我们</a></li>
            <li><a href="using_instructions.jsp">平台使用手册</a></li>
           <!--  <li><a href="contact.html">联系我们</a></li> -->
            <li><a href="feedback.jsp">投诉&反馈 </a></li>
            <div class="clear"></div>
        </ul>
        <p>Copyright ©  2006-2016 深圳市派司德科技有限公司 <a href="http://www.beian.miit.gov.cn/" target="_blank">粤ICP备19162788号</a></p>
    </div>
</div>
