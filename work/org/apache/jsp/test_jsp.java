/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.28
 * Generated at: 2016-01-20 08:59:24 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class test_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_classes = null;
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("\t<meta charset=\"UTF-8\">\r\n");
      out.write("\t<title>七牛云存储 - JavaScript SDK</title>\r\n");
      out.write("\t<link href=\"js/qiniu_js/demo/favicon.ico\" rel=\"shortcut icon\">\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"js/qiniu_js/demo/bootstrap/css/bootstrap.min.css\">\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"js/qiniu_js/demo/main.css\">\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"js/qiniu_js/demo/js/highlight/highlight.css\">\r\n");
      out.write("\r\n");
      out.write("\t<!--[if lt IE 9]>\r\n");
      out.write("      <script src=\"js/Respond-1.4.2/respond.min.js\"></script>\r\n");
      out.write("    <![endif]-->\r\n");
      out.write("<script src=\"http://c.cnzz.com/core.php\"></script></head>\r\n");
      out.write("<body>\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("\t<div class=\"text-left col-md-12 wrapper\">\r\n");
      out.write("\t\t<!-- <h1 class=\"text-left col-md-12 \">\r\n");
      out.write("\t\t\t七牛云存储 - JavaScript SDK\r\n");
      out.write("            <a class=\"btn btn-default view_code\" id=\"show_code\">\r\n");
      out.write("                查看初始化代码\r\n");
      out.write("            </a>\r\n");
      out.write("            <a class=\"btn btn-default view_github\" href=\"https://github.com/qiniupd/qiniu-js-sdk\" target=\"_blank\">\r\n");
      out.write("\t\t\t\t<img src=\"http://qtestbucket.qiniudn.com/GitHub-Mark-32px.png\">\r\n");
      out.write("\t\t\t\tView Source on Github\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t\t</h1> -->\r\n");
      out.write("       </div>\r\n");
      out.write("    <div class=\"body\">\r\n");
      out.write("        <div class=\"col-md-12\">\r\n");
      out.write("            <div id=\"container\">\r\n");
      out.write("                <a class=\"btn btn-default btn-lg \" id=\"pickfiles\" href=\"#\" >\r\n");
      out.write("                    <i class=\"glyphicon glyphicon-plus\"></i>\r\n");
      out.write("                    <span>选择文件</span>\r\n");
      out.write("                </a>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("<!-- \r\n");
      out.write("        <div style=\"display:none\" id=\"success\" class=\"col-md-12\">\r\n");
      out.write("            <div class=\"alert-success\">\r\n");
      out.write("                队列全部文件处理完毕\r\n");
      out.write("            </div>\r\n");
      out.write("        </div> -->\r\n");
      out.write("       <!--  <div class=\"col-md-12 \">\r\n");
      out.write("            <table class=\"table table-striped table-hover text-left\"   style=\"margin-top:40px;display:none\">\r\n");
      out.write("                <thead>\r\n");
      out.write("                  <tr>\r\n");
      out.write("                    <th class=\"col-md-4\">Filename</th>\r\n");
      out.write("                    <th class=\"col-md-2\">Size</th>\r\n");
      out.write("                    <th class=\"col-md-6\">Detail</th>\r\n");
      out.write("                  </tr>\r\n");
      out.write("                </thead>\r\n");
      out.write("                <tbody id=\"fsUploadProgress\">\r\n");
      out.write("                </tbody>\r\n");
      out.write("            </table>\r\n");
      out.write("        </div> style=\"width:10px;height:20px;background-color:red\"-->\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write(" <div id=\"fsUploadProgress\" style=\"width:10px;height:20px;background-color:#9AFF9A;text-align: center;\"></div>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/qiniu_js/demo/js/jquery-1.9.1.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/qiniu_js/demo/bootstrap/js/bootstrap.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/qiniu_js/demo/js/plupload/plupload.full.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/qiniu_js/demo/js/plupload/i18n/zh_CN.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/qiniu_js/demo/js/ui.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/qiniu_js/src/qiniu.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/qiniu_js/demo/js/highlight/highlight.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/qiniu_js/demo/js/main.js\"></script>\r\n");
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
