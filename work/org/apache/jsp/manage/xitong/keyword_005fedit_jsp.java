/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.28
 * Generated at: 2016-02-22 09:17:03 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.manage.xitong;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.baje.sz.ajax.AjaxXml;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import com.baje.sz.util.RequestUtil;
import com.baje.sz.util.*;
import com.hanyou.admin.sys.*;
import com.hanyou.util.*;
import com.baje.sz.util.*;
import com.baje.sz.ajax.*;
import com.hanyou.admin.sys.*;

public final class keyword_005fedit_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/manage/xitong/../ini_sys.jsp", Long.valueOf(1448868343606L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("com.hanyou.admin.sys");
    _jspx_imports_packages.add("com.baje.sz.ajax");
    _jspx_imports_packages.add("com.hanyou.util");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_packages.add("com.baje.sz.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.ArrayList");
    _jspx_imports_classes.add("java.util.Iterator");
    _jspx_imports_classes.add("com.baje.sz.ajax.AjaxXml");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("com.baje.sz.util.RequestUtil");
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
    if (current_flags.indexOf(",6002,") < 0) {
        response.sendRedirect("../error.jsp?left=xitong");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    int id = ru.getInt("id");
    Keyword dw = new Keyword();
    if (action.equals("usersave")) {
        out.print(dw.keywordEdit(request, userid, user_name, gym_group_id, gym_id).toString());
        return;
    }

    String keyword = "";
    String replace_word = "";
    int key_type = 0;
    if (id > 0) {
        Doc doc = utildb.Get_Doc("id,keyword,replace_word,key_type", "hy_sys_keyword", "where id=? and isdel=0", "mysqlss", new Object[]{id});
        if (doc != null && !doc.isEmpty()) {
            keyword = doc.get("keyword");
            replace_word = doc.get("replace_word");
            key_type = doc.getIn("key_type");
        }
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
      out.write("    <script language=javascript src='../js/sys.js'></script>\r\n");
      out.write("    <link type=\"text/css\" rel=\"stylesheet\" href=\"../css/jquery.alert.css\"/>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"../js/jquery.alert.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("        function usersave() {\r\n");
      out.write("            var keyword = $(\"#keyword\").val();\r\n");
      out.write("\r\n");
      out.write("            if (keyword == \"\") {\r\n");
      out.write("                $(\"#keyword\").alert('关键字不能为空');\r\n");
      out.write("                return;\r\n");
      out.write("            }\r\n");
      out.write("            $(\"#tjbutton\").attr(\"disabled\", true);\r\n");
      out.write("            $(\"#tisspan\").html(\"<img src='../images/loading.gif' />提交中，请稍候……\");\r\n");
      out.write("            $.ajax({\r\n");
      out.write("                dataType: \"json\",\r\n");
      out.write("                type: \"post\",\r\n");
      out.write("                url: \"keyword_edit.jsp\",\r\n");
      out.write("                data: $(\"#form1\").serialize(),\r\n");
      out.write("                success: function (msg) {\r\n");
      out.write("                    if (msg.type == true) {\r\n");
      out.write("                        window.parent.art.dialog({\r\n");
      out.write("                            id: 'tisID',\r\n");
      out.write("                            content: msg.msg,\r\n");
      out.write("                            lock: true,\r\n");
      out.write("                            icon: \"succeed\",\r\n");
      out.write("                            cancelVal: '确定',\r\n");
      out.write("                            cancel: function () {\r\n");
      out.write("                                window.parent.location.reload();\r\n");
      out.write("                                window.parent.art.dialog({id: \"tisID\"}).close();\r\n");
      out.write("                                window.parent.art.dialog({id: \"xitong\"}).close();\r\n");
      out.write("                            }\r\n");
      out.write("                        });\r\n");
      out.write("                    } else {\r\n");
      out.write("                        window.parent.art.dialog.alert(msg.msg);\r\n");
      out.write("                        $(\"#tjbutton\").attr(\"disabled\", false);\r\n");
      out.write("                        $(\"#tisspan\").html(\"\");\r\n");
      out.write("                    }\r\n");
      out.write("\r\n");
      out.write("                }\r\n");
      out.write("            });\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("    </script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"ifr\">\r\n");
      out.write("<div id=\"dd\" style=\"padding:5px;\">\r\n");
      out.write("    <div class=\"box_input\">\r\n");
      out.write("        <form id=\"form1\" name=\"form1\" method=\"post\" action=\"\">\r\n");
      out.write("            <input name=\"id\" id=\"id\" type=\"hidden\" value=\"");
      out.print(id);
      out.write("\"/>\r\n");
      out.write("            <input name=\"action\" id=\"action\" type=\"hidden\" value=\"usersave\"/>\r\n");
      out.write("            <ul class=\"row1 clearfix\">\r\n");
      out.write("                <li>关键字：<input name=\"keyword\" type=\"text\" value=\"");
      out.print(keyword);
      out.write("\" id=\"keyword\" size=\"40\"/>\r\n");
      out.write("                </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("            <ul class=\"row1 clearfix\">\r\n");
      out.write("                <li>状态：<select name=\"key_type\" id=\"key_type\">\r\n");
      out.write("                    <option value=\"0\" ");
      out.print((key_type == 0) ? "selected=\"selected\"" : "" );
      out.write(">不能出现</option>\r\n");
      out.write("                </select>\r\n");
      out.write("                </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"row_btn\">\r\n");
      out.write("                <button type=\"button\" id=\"tjbutton\" onclick=\"usersave()\">确定提交</button>\r\n");
      out.write("                <span id=\"tisspan\"></span>\r\n");
      out.write("            </div>\r\n");
      out.write("        </form>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
