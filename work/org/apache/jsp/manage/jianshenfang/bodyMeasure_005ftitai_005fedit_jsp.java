/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.28
 * Generated at: 2015-12-10 05:42:59 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.manage.jianshenfang;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.hanyou.userjson.Userdataapi;
import net.sf.json.JSONObject;
import net.sf.json.JSONArray;
import com.hanyou.util.FitnessBasicType;
import com.hanyou.util.BasicType;
import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;
import com.baje.sz.util.*;
import com.baje.sz.ajax.*;
import com.hanyou.admin.sys.*;
import com.baje.sz.util.*;
import com.baje.sz.ajax.*;
import com.hanyou.admin.sys.*;

public final class bodyMeasure_005ftitai_005fedit_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/manage/jianshenfang/../ini_sys.jsp", Long.valueOf(1448868343606L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("com.hanyou.admin.sys");
    _jspx_imports_packages.add("com.baje.sz.ajax");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_packages.add("com.baje.sz.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.ArrayList");
    _jspx_imports_classes.add("com.hanyou.util.FitnessBasicType");
    _jspx_imports_classes.add("java.util.Iterator");
    _jspx_imports_classes.add("com.hanyou.userjson.Userdataapi");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("com.hanyou.util.BasicType");
    _jspx_imports_classes.add("net.sf.json.JSONArray");
    _jspx_imports_classes.add("net.sf.json.JSONObject");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    request.setCharacterEncoding("utf-8");
    AdminLogin checklogin = new AdminLogin();
    int userid = 0;
    String user_name = "guest";
    String current_flags = "";
    int gym_group_id = 0, gym_id = 0;
    Selectic utildb = new Selectic();
    Doc currentUser = null;
    int ii = checklogin.checkLogin(request, response);
    if (ii == 0) {
        user_name = checklogin.getuser_name();
        userid = checklogin.getuserid();

        currentUser = utildb.Get_Doc("user_flag,gym_group_id,gym_id", "hy_sys_user", "where id=" + userid, "mysqlss");
        //System.out.println("currentUser="+currentUser);
        if (currentUser != null) {
            current_flags = AjaxXml.getString(currentUser.get("user_flag"));
            //System.out.println("current_flags="+current_flags);
            gym_group_id = currentUser.getIn("gym_group_id");
            gym_id = currentUser.getIn("gym_id");

        }
        //flag=admin_username.get("flag");
    } else {
        out.print("<script>");
        out.print("alert('请登录后再操作');");
        out.print("window.parent.location = '/manage/login.jsp'");
        out.print("</script>");
        return;
    }

      out.write('\r');
      out.write('\n');

    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    if (!(current_flags.indexOf(",3009,") > -1)) {
        out.print("<script>alert('没有对应的权限');</script>");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    int id = ru.getInt("id");
    if (action.equals("save")) {//更新
        GroupAPI groupApi = new GroupAPI();
        out.print(groupApi.addOrEditCoach(request, userid, user_name,
                gym_group_id, gym_id));
        return;
    }
    String mem_name="",tice_time="",tice_back="",tice_side="",tice_pic="",tice_tv="",coach_name="";
    Doc doc = utildb.Get_Doc("b.mem_name,b.mem_username,a.tice_time,a.tice_back,a.tice_side,a.tice_pic,a.tice_tv,c.coach_name", "hy_member_measure_titai a  left join hy_member b on a.member_id=b.id left join hy_coach c on a.coach_id=c.id", "where a.isdel=0 and a.id=? ", "mysqlss", new Object[]{id});
    if (doc==null||doc.isEmpty()) {
        out.print("信息不存在");
        return;
    } else {
    	mem_name=Userdataapi.displayMemberName(doc.get("mem_usename"),doc.get("mem_name"));
    	tice_time=doc.getIn("tice_time")>0?AjaxXml.timeStamp2Date(doc.getIn("tice_time"),"YY04-MM-DD HH:MI:SS"):tice_time;
    	tice_back=doc.get("tice_back","");
    	tice_side=doc.get("tice_side","");
    	tice_pic=doc.get("tice_pic");
    	tice_tv=doc.get("tice_tv");
    	coach_name=doc.get("coach_name");
    }

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>\r\n");
      out.write("    <title>table</title>\r\n");
      out.write("    <link href=\"../css/reset.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("    <link href=\"../css/base.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"../js/jquery-1.7.2.min.js\"></script>\r\n");
      out.write("    <script language=\"javascript\" src='../js/sys.js'></script>\r\n");
      out.write("    <script language=\"javascript\" src='../js/webcalendar.js'></script>\r\n");
      out.write("    <script type='text/javascript' src='/public/js/global.js'></script>\r\n");
      out.write("    <link href='/public/js/operamasks/operamasks-ui.css' rel='stylesheet' type='text/css'/>\r\n");
      out.write("    <script type='text/javascript' src='/public/js/operamasks/operamasks-ui.min.js'></script>\r\n");
      out.write("    <style type=\"text/css\">\r\n");
      out.write("        .del {\r\n");
      out.write("            bottom: 0;\r\n");
      out.write("            height: 22px;\r\n");
      out.write("            line-height: 22px;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            background: #000;\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            color: #fff;\r\n");
      out.write("            filter: alpha(opacity=70);\r\n");
      out.write("            -moz-opacity: 0.7;\r\n");
      out.write("            -khtml-opacity: 0.7;\r\n");
      out.write("            opacity: 0.7;\r\n");
      out.write("            cursor: pointer;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"ifr\">\r\n");
      out.write("<div id=\"dd\" style=\"padding: 5px;\">\r\n");
      out.write("    <div class=\"box_input\">\r\n");
      out.write("        <form id=\"form1\" name=\"form1\" method=\"post\" action=\"\">\r\n");
      out.write("            <input name=\"id\" id=\"id\" type=\"hidden\" value=\"");
      out.print(id);
      out.write("\"/>\r\n");
      out.write("            <input name=\"action\" id=\"action\" type=\"hidden\" value=\"save\"/>\r\n");
      out.write("            <ul class=\"row3 clearfix\">\r\n");
      out.write("            <li>\r\n");
      out.write("\t\t\t\t用户名：");
      out.print(mem_name);
      out.write("\r\n");
      out.write("            </li>\r\n");
      out.write("            <li>\r\n");
      out.write("            \t教练名：");
      out.print(coach_name);
      out.write("\r\n");
      out.write("            </li>\r\n");
      out.write("            <li>\r\n");
      out.write("            \t体测时间：");
      out.print(tice_time);
      out.write("\r\n");
      out.write("            </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("            <hr/>\r\n");
      out.write("            <ul class=\"row1 clearfix\">\r\n");
      out.write("            \t<li><span style=\"font-weight: bold;\">背面体态：</span><br/><br/>\r\n");
      out.write("            \t\t");

            			if(tice_back!=null&&!"".equals(tice_back)){
            				JSONArray back_array=JSONArray.fromObject(tice_back);
            				if(back_array!=null){
            					for(int i=0;i<back_array.size();i++){
            						JSONObject back_json=back_array.optJSONObject(i);
            						out.print(back_json.optString("title")+":&nbsp;["+back_json.optString("option")+"]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;建议：&nbsp;["+back_json.optString("advice")+"]<br/>");
            					}
            				}
            			}
            		
      out.write("\r\n");
      out.write("            \t</li>\r\n");
      out.write("            </ul>\r\n");
      out.write("            <hr />\r\n");
      out.write("            <ul class=\"row1 clearfix\">\r\n");
      out.write("            \t<li>\r\n");
      out.write("            \t\t<span style=\"font-weight: bold;\">侧面体态：</span><br/><br/>\r\n");
      out.write("            \t\t");

            			if(tice_side!=null&&!"".equals(tice_side)){
            				JSONArray side_array=JSONArray.fromObject(tice_side);
            				if(side_array!=null){
            					for(int i=0;i<side_array.size();i++){
            						JSONObject side_json=side_array.optJSONObject(i);
            						out.print(side_json.optString("title")+":&nbsp;["+side_json.optString("option")+"]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;建议：&nbsp;["+side_json.optString("advice")+"]<br/>");
            					}
            				}
            			}
            		
      out.write("\r\n");
      out.write("            \t</li>\r\n");
      out.write("            </ul>\r\n");
      out.write("             <hr />\r\n");
      out.write("            <ul class=\"row1 clearfix\">\r\n");
      out.write("            \t<li>\r\n");
      out.write("            \t\t<span style=\"font-weight: bold;\">体测图片：</span><br/><br/>\r\n");
      out.write("            \t\t");

            			if(tice_pic!=null&&!"".equals(tice_pic)){
            				System.out.print("tice_pic-->"+tice_pic);
            				JSONArray pic_array=JSONArray.fromObject(tice_pic);
            				if(pic_array!=null){
            					for(int i=0;i<pic_array.size();i++){
            						JSONObject pic_json=pic_array.optJSONObject(i);
            						out.print(pic_json.optString("title")+":&nbsp;&nbsp;<img src=\""+pic_json.optString("picurl")+"\" style=\"width:100px;height:100px;vertical-align:top;\"/>&nbsp;&nbsp;&nbsp;");
            					}
            				}
            			}
            		
      out.write("\r\n");
      out.write("            \t</li>\r\n");
      out.write("            </ul>\r\n");
      out.write("             <hr />\r\n");
      out.write("            <ul class=\"row1 clearfix\">\r\n");
      out.write("            \t<li>\r\n");
      out.write("            \t\t<span style=\"font-weight: bold;\">体测视频：</span><br/><br/>\r\n");
      out.write("            \t\t");

            			if(tice_tv!=null&&!"".equals(tice_tv)){
            				JSONArray tv_array=JSONArray.fromObject(tice_tv);
            				if(tv_array!=null){
            					for(int i=0;i<tv_array.size();i++){
            						JSONObject tv_json=tv_array.optJSONObject(i);
            						out.print(tv_json.optString("title")+":&nbsp;&nbsp;<video src="+tv_json.optString("tvurl")+" controls=\"controls\" style=\"width:200px;height:200px;vertical-align:top;\">");
            					}
            				}
            			}
            		
      out.write("\r\n");
      out.write("            \t</li>\r\n");
      out.write("            </ul>\r\n");
      out.write("           <!--  <div class=\"row_btn\">\r\n");
      out.write("                <button type=\"button\" id=\"tjbutton\" onclick=\"usersave()\">确定提交</button>\r\n");
      out.write("                <span id=\"tisspan\"></span>\r\n");
      out.write("            </div> -->\r\n");
      out.write("        </form>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<!--End Sidebar-->\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
