/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.28
 * Generated at: 2015-12-23 03:02:15 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.manage.order;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import com.baje.sz.util.*;
import com.baje.sz.ajax.*;
import com.hanyou.admin.sys.Newsclass;
import com.hanyou.util.*;
import com.baje.sz.util.*;
import com.baje.sz.ajax.*;
import com.hanyou.admin.sys.*;

public final class common_005flanguage_005fclass_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/manage/order/../left.jsp", Long.valueOf(1450407753560L));
    _jspx_dependants.put("/manage/order/../ini_sys.jsp", Long.valueOf(1448868343606L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("com.hanyou.admin.sys");
    _jspx_imports_packages.add("com.hanyou.util");
    _jspx_imports_packages.add("com.baje.sz.ajax");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_packages.add("com.baje.sz.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.ArrayList");
    _jspx_imports_classes.add("java.util.Iterator");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("com.hanyou.admin.sys.Newsclass");
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
    RequestUtil ru = new RequestUtil(request);
    if (current_flags.indexOf(",2029,") < 0) {
        response.sendRedirect("../error.jsp?left=xinxi");
        return;
    }
    String action = ru.getString("action");
    if (action.equals("del")) {
       CommonLanguageAPI commonLanguageAPI=new CommonLanguageAPI();
        out.print(commonLanguageAPI.delCommonLanguageClass(request, userid, user_name, gym_group_id, gym_id));
        return;
    }
    if (action.equals("batchDel")) {
    	 CommonLanguageAPI commonLanguageAPI=new CommonLanguageAPI();
        out.print(commonLanguageAPI.batchDelCommonLanguageClass(request, userid, user_name, gym_group_id, gym_id));
        return;
    }
    int parent_id = ru.getInt("parent_id");

      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>\r\n");
      out.write("    <title>table</title>\r\n");
      out.write("    <link href=\"../css/reset.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("    <link href=\"../css/base.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("    <link href=\"../css/page.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"../js/jquery-1.7.2.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    <script type=\"text/javascript\" src=\"../js/artDialog4.1.6/artDialog.js?skin=green\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"../js/artDialog4.1.6/plugins/iframeTools.source.js\"></script>\r\n");
      out.write("    <script language=\"javascript\" src='../js/sys.js'></script>\r\n");
      out.write("    <script language=\"javascript\" src='../js/webcalendar.js'></script>\r\n");
      out.write("    <script type=\"text/javascript\">\r\n");
      out.write("        var menu1 = [\r\n");
      out.write("            {\r\n");
      out.write("                '刷新页面': function (menuItem, menu) {\r\n");
      out.write("                    window.location.reload();\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        ];\r\n");
      out.write("        $(function () {\r\n");
      out.write("            //$(this).contextMenu(menu1,{theme:'vista'});\r\n");
      out.write("        });\r\n");
      out.write("        function edit(id,parent_id,title) {\r\n");
      out.write("        \t openurl('common_language_class_edit.jsp?id=' + id + '&parent_id='+parent_id+'&title='+title, 'user', title, 700, 380, 0, 10, true);\r\n");
      out.write("        }\r\n");
      out.write("        artDialog.fn.shake = function () {\r\n");
      out.write("            var style = this.DOM.wrap[0].style,\r\n");
      out.write("                    p = [4, 8, 4, 0, -4, -8, -4, 0],\r\n");
      out.write("                    fx = function () {\r\n");
      out.write("                        style.marginLeft = p.shift() + 'px';\r\n");
      out.write("                        if (p.length <= 0) {\r\n");
      out.write("                            style.marginLeft = 0;\r\n");
      out.write("                            clearInterval(timerId);\r\n");
      out.write("                        }\r\n");
      out.write("                        ;\r\n");
      out.write("                    };\r\n");
      out.write("            p = p.concat(p.concat(p));\r\n");
      out.write("            timerId = setInterval(fx, 13);\r\n");
      out.write("            return this;\r\n");
      out.write("        };\r\n");
      out.write("\r\n");
      out.write("        function del(id) {\r\n");
      out.write("            art.dialog({\r\n");
      out.write("                id: 'delID',\r\n");
      out.write("                content: '是否确定删除选中项？',\r\n");
      out.write("                lock: true,\r\n");
      out.write("                button: [{\r\n");
      out.write("                    name: '确定',\r\n");
      out.write("                    callback: function () {\r\n");
      out.write("                        if (id == \"\") {\r\n");
      out.write("                            art.dialog({\r\n");
      out.write("                                id: 'delID'\r\n");
      out.write("                            }).close();\r\n");
      out.write("                            art.dialog.alert('请选择操作项');\r\n");
      out.write("                            return false;\r\n");
      out.write("                        }\r\n");
      out.write("                        $.ajax({\r\n");
      out.write("                            beforeSend: function () {\r\n");
      out.write("                                art.dialog({\r\n");
      out.write("                                    id: 'delID'\r\n");
      out.write("                                }).close();\r\n");
      out.write("                                art.dialog({\r\n");
      out.write("                                    id: 'tisID',\r\n");
      out.write("                                    lock: true,\r\n");
      out.write("                                    title: '提交中，请稍候……'\r\n");
      out.write("                                });\r\n");
      out.write("                            },\r\n");
      out.write("                            dataType: \"json\",\r\n");
      out.write("                            type: \"post\",\r\n");
      out.write("                            url: \"common_language_class.jsp\",\r\n");
      out.write("                            data: \"action=del&id=\" + id + \"\",\r\n");
      out.write("                            success: function (data) {\r\n");
      out.write("                                art.dialog({\r\n");
      out.write("                                    id: 'tisID'\r\n");
      out.write("                                }).close();\r\n");
      out.write("                                if (data.type) {\r\n");
      out.write("                                    art.dialog({\r\n");
      out.write("                                        id: 'tisID',\r\n");
      out.write("                                        content: data.msg,\r\n");
      out.write("                                        lock: true,\r\n");
      out.write("                                        icon: \"succeed\",\r\n");
      out.write("                                        cancelVal: '确定',\r\n");
      out.write("                                        cancel: function () {\r\n");
      out.write("                                            window.location.reload();\r\n");
      out.write("                                            art.dialog({\r\n");
      out.write("                                                id: \"tisID\"\r\n");
      out.write("                                            }).close();\r\n");
      out.write("                                        }\r\n");
      out.write("                                    });\r\n");
      out.write("                                } else {\r\n");
      out.write("                                    art.dialog.alert(data.msg);\r\n");
      out.write("                                }\r\n");
      out.write("                            }\r\n");
      out.write("                        });\r\n");
      out.write("                        return false;\r\n");
      out.write("                    },\r\n");
      out.write("                    focus: true\r\n");
      out.write("                }, {\r\n");
      out.write("                    name: '取消'\r\n");
      out.write("                }]\r\n");
      out.write("            });\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        function batchDel() {\r\n");
      out.write("            var id = getcheckbox(\"id\");\r\n");
      out.write("            if (id == \"\") {\r\n");
      out.write("                alert(\"请选择删除项？\");\r\n");
      out.write("                return;\r\n");
      out.write("            }\r\n");
      out.write("            var dialog = art.dialog({\r\n");
      out.write("                id: 'delID',\r\n");
      out.write("                content: '是否确定删除选中项？',\r\n");
      out.write("                button: [\r\n");
      out.write("                    {\r\n");
      out.write("                        name: '确定',\r\n");
      out.write("                        callback: function () {\r\n");
      out.write("                            $.ajax({\r\n");
      out.write("                                beforeSend: function () {\r\n");
      out.write("                                    art.dialog({id: 'delID'}).close();\r\n");
      out.write("                                    art.dialog({\r\n");
      out.write("                                        id: 'tisID',\r\n");
      out.write("                                        lock: true,\r\n");
      out.write("                                        title: '提交中，请稍候……'\r\n");
      out.write("                                    });\r\n");
      out.write("                                },\r\n");
      out.write("                                dataType: \"json\",\r\n");
      out.write("                                type: \"post\",\r\n");
      out.write("                                url: \"common_language_class.jsp\",\r\n");
      out.write("                                data: \"action=batchDel&ids=\" + id + \"\",\r\n");
      out.write("                                success: function (msg) {\r\n");
      out.write("                                    art.dialog({id: 'tisID'}).close();\r\n");
      out.write("                                    if (msg.type) {\r\n");
      out.write("                                        art.dialog({\r\n");
      out.write("                                            id: 'tisID',\r\n");
      out.write("                                            content: msg.msg,\r\n");
      out.write("                                            lock: true,\r\n");
      out.write("                                            icon: \"succeed\",\r\n");
      out.write("                                            cancelVal: '确定',\r\n");
      out.write("                                            cancel: function () {\r\n");
      out.write("                                                window.location.reload();\r\n");
      out.write("                                                art.dialog({id: \"tisID\"}).close();\r\n");
      out.write("                                            }\r\n");
      out.write("                                        });\r\n");
      out.write("                                    } else {\r\n");
      out.write("                                        art.dialog.alert(msg.msg);\r\n");
      out.write("                                    }\r\n");
      out.write("                                }\r\n");
      out.write("                            });\r\n");
      out.write("                            return false;\r\n");
      out.write("                        },\r\n");
      out.write("                        focus: true\r\n");
      out.write("                    },\r\n");
      out.write("                    {\r\n");
      out.write("                        name: '取消'\r\n");
      out.write("                    }\r\n");
      out.write("                ]\r\n");
      out.write("            });\r\n");
      out.write("            dialog.shake && dialog.shake();// 调用抖动接口\r\n");
      out.write("        }\r\n");
      out.write("    </script>\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"ifr\">\r\n");
      out.write("\r\n");
      out.write("<link href=\"/manage/css/colortemplate.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("<div class=\"sidebarWrap\">\r\n");
      out.write("    <div class=\"sidebar\" id=\"yonghu\" style=\"display:none\">\r\n");
      out.write("        <h3>\r\n");
      out.write("            <span>用户管理</span>\r\n");
      out.write("        </h3>\r\n");
      out.write("        <ul class=\"nav_list\">\r\n");
      out.write("\r\n");
      out.write("            ");

                if (current_flags.contains("1001")) {
            
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('yonghu/yonghu.jsp','用户管理')\">用户管理</a></li>\r\n");
      out.write("            ");

                }
                if (current_flags.contains("1004")) {
            
      out.write("\r\n");
      out.write("             <li><a href=\"javascript:window.parent.jianyi2('yonghu/level_experience_group.jsp?group_type=1','积分操作组别')\">积分操作组别</a></li>\r\n");
      out.write("            ");

                }
                if (current_flags.contains("1005")) {
            
      out.write("\r\n");
      out.write("           <li><a href=\"javascript:window.parent.jianyi2('yonghu/level_experience_operating.jsp?operating_type=1','积分操作')\">积分操作</a></li>\r\n");
      out.write("            ");

                }
                if (current_flags.contains("1007")) {
            
      out.write("\r\n");
      out.write("             <li><a href=\"javascript:window.parent.jianyi2('yonghu/level_experience_operating_user.jsp?operating_type=1','积分获取情况')\">积分获取情况</a></li>\r\n");
      out.write("            ");

                }
               
      out.write("\r\n");
      out.write("        </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"sidebar\" id=\"jianshenfang\" style=\"display:none\">\r\n");
      out.write("        <h3>\r\n");
      out.write("            <span>健身房管理</span>\r\n");
      out.write("        </h3>\r\n");
      out.write("        <ul class=\"nav_list\">\r\n");
      out.write("            ");

                if (gym_group_id == 0) {
                    if (current_flags.contains("3001")) {
            
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('jianshenfang/jituan.jsp','连锁集团管理')\">连锁集团管理</a></li>\r\n");
      out.write("            ");

                    }
                }
						/*  if(gym_id==0){  */
                if (current_flags.contains("3005")) {
            
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('jianshenfang/gym.jsp','健身房管理')\">健身房管理</a></li>\r\n");
      out.write("            ");

                }
					 /* 	}  */
                if (current_flags.contains("3009")) {
            
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('jianshenfang/coach.jsp','教练管理')\">教练管理</a></li>\r\n");
      out.write("            ");
}
				if (current_flags.contains("3045")) { 
				
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('jianshenfang/device.jsp','设备管理')\">设备管理</a></li>\r\n");
      out.write("            ");

                 }
                 if (current_flags.contains("3049")) {
             
      out.write("\r\n");
      out.write("             <li>\r\n");
      out.write("                 <a href=\"javascript:window.parent.jianyi2('jianshenfang/bodyMeasure_titai.jsp', '体态管理')\">体态管理</a>\r\n");
      out.write("             </li>\r\n");
      out.write("             ");

                 } 
                 if(current_flags.contains("3050")){
                 	
      out.write("\r\n");
      out.write("                 \t <li>\r\n");
      out.write("                 <a href=\"javascript:window.parent.jianyi2('jianshenfang/bodyMeasure_tineng.jsp', '体能管理')\">体能管理</a>\r\n");
      out.write("             </li>\r\n");
      out.write("                 \t");

                 }
                 if(current_flags.contains("3051")){
              		
      out.write("\r\n");
      out.write("              \t\t  <li><a href=\"javascript:window.parent.jianyi2('jianshenfang/bodyMeasure_tice.jsp', '体测管理')\">体测管理</a>\r\n");
      out.write("            \t\t\t\t </li>\r\n");
      out.write("              \t\t");

                 }
                if (current_flags.contains("3017")) {
            
      out.write("\r\n");
      out.write("            <li>\r\n");
      out.write("                <a href=\"javascript:window.parent.jianyi2('jianshenfang/gym_member_book.jsp?book_type=1','预约私教')\">预约私教</a>\r\n");
      out.write("            </li>\r\n");
      out.write("            ");
 
                }
            
      out.write("\r\n");
      out.write("        </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"sidebar\" id=\"order\" style=\"display:none\">\r\n");
      out.write("        <h3>\r\n");
      out.write("            <span>订单管理</span>\r\n");
      out.write("        </h3>\r\n");
      out.write("        <ul class=\"nav_list\">\r\n");
      out.write("            ");
if (current_flags.contains("2007")) { 
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('order/hy_order.jsp','订单管理')\">订单管理</a></li>\r\n");
      out.write("            ");

                }
                if (current_flags.contains("2026")) {
            
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('order/plan_action_type.jsp','动作类型')\">动作类型</a></li>\r\n");
      out.write("            ");

                }
                if (current_flags.contains("2027")) {
            
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('order/default_action.jsp','默认动作')\">默认动作</a></li>\r\n");
      out.write("            ");

                }
                if (current_flags.contains("2028")) {
            
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('order/plan_action_type.jsp?type=1','健身目标')\">健身目标</a></li>\r\n");
      out.write("             ");
} if (current_flags.contains("2029")) {
                            
      out.write("\r\n");
      out.write("                            <li>\r\n");
      out.write("                                <a href=\"javascript:window.parent.jianyi2('order/common_language_class.jsp?','常用语类型')\">常用语类型</a>\r\n");
      out.write("                            </li>");

                } if(current_flags.contains("2030")){
                	
      out.write("\r\n");
      out.write("                \t <li>\r\n");
      out.write("                    \t<a href=\"javascript:window.parent.jianyi2('order/common_language.jsp','常用语设置')\">常用语设置</a>\r\n");
      out.write("                \t</li>\r\n");
      out.write("                \t");

                	
                } 
      out.write("\r\n");
      out.write("                \r\n");
      out.write("\t\t\t\t\t     <li><a href=\"javascript:window.parent.jianyi2('order/pro_class.jsp?class_status=1','商品栏目')\">商品栏目</a></li>\r\n");
      out.write("\t\t\t\t\t     <li><a href=\"javascript:window.parent.jianyi2('order/pro_product.jsp','商品管理')\">商品管理</a></li>\r\n");
      out.write("        </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("    ");

        if (current_flags.contains("4004")) {
    
      out.write("\r\n");
      out.write("    <div class=\"sidebar\" id=\"xinxi\" style=\"display:none\">\r\n");
      out.write("        <h3>\r\n");
      out.write("            <span>信息管理</span>\r\n");
      out.write("        </h3>\r\n");
      out.write("        <ul class=\"nav_list\">\r\n");
      out.write("            ");
 if (current_flags.contains("4002")) {
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('xinxi/news.jsp','信息内容')\">信息内容</a></li>\r\n");
      out.write("            ");

                }
                if (current_flags.contains("4001")) {
            
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('xinxi/newsclass.jsp','信息栏目')\">信息栏目</a></li>\r\n");
      out.write("\r\n");
      out.write("            ");

                }
                if (current_flags.contains("4003")) {
            
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('xinxi/news_edit.jsp','发布信息')\">发布信息</a></li>\r\n");
      out.write("            ");

                }
            
      out.write("\r\n");
      out.write("        </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("    ");

        }
    
      out.write("\r\n");
      out.write("    <div class=\"sidebar\" id=\"faxian\" style=\"display:none\">\r\n");
      out.write("        <h3>\r\n");
      out.write("            <span>发现管理</span>\r\n");
      out.write("        </h3>\r\n");
      out.write("        <ul class=\"nav_list\">\r\n");
      out.write("            ");
 if (current_flags.contains("5001")) { 
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('faxian/wenzhang.jsp','发现文章')\">发现文章</a></li>\r\n");
      out.write("            ");

                }
                if (current_flags.contains("5005")) {
            
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('faxian/huifu.jsp','文章评论')\">文章评论</a></li>\r\n");
      out.write("            ");

                }
                if (current_flags.contains("5007")) {
            
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('faxian/hy_friendster_carousel.jsp','每日推荐')\">每日推荐</a></li>\r\n");
      out.write("            ");
} 
      out.write("\r\n");
      out.write("        </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"sidebar\" id=\"xitong\" style=\"display:none\">\r\n");
      out.write("\r\n");
      out.write("        <h3>\r\n");
      out.write("            <span>系统管理管理</span>\r\n");
      out.write("        </h3>\r\n");
      out.write("        <ul class=\"nav_list\">\r\n");
      out.write("            ");
if (current_flags.contains("6001")) { 
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('xitong/rizhi.jsp','系统日志')\">系统日志</a></li>\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('xitong/rizhi.jsp?log_type=2','教练系统日志')\">教练系统日志</a></li>\r\n");
      out.write("            ");

                }
                if (current_flags.contains("6002")) {
            
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('xitong/keyword.jsp','关键词管理')\">关键词管理</a></li>\r\n");
      out.write("            ");

                }
                if (current_flags.contains("6009")) {
            
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('xitong/thirdPartyApply.jsp','加盟申请')\">加盟申请</a></li>\r\n");
      out.write("            ");

                }
                if (current_flags.contains("6006")) {
            
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('xitong/guanliyuan.jsp','后台管理员管理')\">后台管理员管理</a></li>\r\n");
      out.write("            ");

                }
                if (current_flags.contains("6003")) {
            
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('xitong/userfeedback.jsp','用户反馈')\">用户反馈</a></li>\r\n");
      out.write("            ");

                }
                if (current_flags.contains("6008")) {
            
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('xitong/tuisong.jsp','会员推送')\">会员推送</a></li>\r\n");
      out.write("            ");
}
      out.write("\r\n");
      out.write("            <li><a href=\"javascript:window.parent.jianyi2('xitong/password_edit.jsp','修改密码')\">修改密码</a></li>\r\n");
      out.write("        </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("    $(document).ready(\r\n");
      out.write("            function () {\r\n");
      out.write("                var leftarr = ['yonghu', 'order', 'jianshenfang', 'xinxi', 'xitong', 'faxian'];\r\n");
      out.write("                var nowhref = window.location.href;\r\n");
      out.write("                for (l in leftarr) {\r\n");
      out.write("                    if (nowhref.indexOf(leftarr[l]) > -1) {\r\n");
      out.write("                        $(\"#\" + leftarr[l]).show();\r\n");
      out.write("                    } else {\r\n");
      out.write("                        $(\"#\" + leftarr[l]).hide();\r\n");
      out.write("                    }\r\n");
      out.write("                }\r\n");
      out.write("            });\r\n");
      out.write("</script>");
      out.write("<!--End Sidebar-->\r\n");
      out.write("<div class=\"iframe_box\">\r\n");

	String parent_name="";
	if(parent_id>0){
		Doc parent_doc=utildb.Get_Doc("id,class_name","hy_coach_common_language_class", " where id=? and isdel=0 ","mysqlss",new Object[]{parent_id});
		if(parent_doc!=null&&!parent_doc.isEmpty()){
			parent_name=parent_doc.get("class_name");
		}	
	}

      out.write("\r\n");
      out.write("    <div class=\"form_info\"><strong>");
      out.print(!"".equals(parent_name)?parent_name:"常用语分类列表");
      out.write("\r\n");
      out.write("    </strong></div>\r\n");
      out.write("   ");
      out.write("\r\n");
      out.write("    <div class=\"form_table\">\r\n");
      out.write("        <form id=\"form2\" name=\"form2\" method=\"post\" action=\"\">\r\n");
      out.write("            <table cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <th width=\"5%\"></th>\r\n");
      out.write("                    <th width=\"8%\">id</th>\r\n");
      out.write("                    <th width=\"40%\">分类名称</th>\r\n");
      out.write("                     <th width=\"12%\">排序</th>\t\r\n");
      out.write("                    <th width=\"12%\">添加时间</th>\r\n");
      out.write("                    <th width=\"\">操作</th>\r\n");
      out.write("                </tr>\r\n");
      out.write("\r\n");
      out.write("                ");

                    List sqllist = new ArrayList();
               		sqllist.add(parent_id);
                    String wheres = " isdel=0 and parent_id=? ";
                    int pages = ru.getInt("page");
                    if (pages == 0) {
                        pages = 1;
                    }
                    int pn = 25;
                    int n = 1;
                    n = pn * pages;
                    String table = "hy_coach_common_language_class";
                    String file = "id,class_name,parent_id,order_num,create_time";
                    String order = " order by id desc";
                    String idd = "id";
                    int counts = utildb.Get_count(idd, table, wheres, "", sqllist);
                    List list = utildb.Get_mssqlList(pages, pn, counts, table, wheres, file, order, idd, "", sqllist);
                    if (list != null) {
                        for (Iterator its = list.listIterator(); its.hasNext(); ) {
                            Doc doc = (Doc) its.next();

                
      out.write("\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td><input name=\"id\" type=\"checkbox\" id=\"id\" value=\"");
      out.print(doc.get("id"));
      out.write("\"/></td>\r\n");
      out.write("                    <td>");
      out.print(doc.get("id"));
      out.write("\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td>");
      out.print(doc.get("class_name"));
      out.write("\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td>");
      out.print(doc.get("order_num"));
      out.write("\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td>");
      out.print(AjaxXml.timeStamp2Date(doc.getIn("create_time"), "YY04-MM-DD"));
      out.write("\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td>\r\n");
      out.write("                     ");
      out.write("\r\n");
      out.write("                        <a href=\"common_language_class.jsp?parent_id=");
      out.print(doc.get("id"));
      out.write("\">查看分类</a>\r\n");
      out.write("                        ");
      out.write("\r\n");
      out.write("                       ");
      out.write("\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                ");

                        }
                    }
                
      out.write("\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td colspan=\"2\" style=\"text-align:right\">\r\n");
      out.write("                        <input type=\"checkbox\" name=\"chkall\" id=\"chkall\" value=\"checkbox\"\r\n");
      out.write("                               onclick=\"CheckAll(this.form);\"/>选中/取消所有\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td colspan=\"6\" style=\"text-align:right\">\r\n");
      out.write("                        <input name=\"tjdel \" type=\"button\" onclick=\"batchDel()\" value=\"批量删除\"/>\r\n");
      out.write("                        ");
out.print(AjaxXml.getPage(pages, 10, pn, counts, "", "", "", request));
      out.write("\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("        </form>\r\n");
      out.write("    </div>\r\n");
      out.write("</div><!--r_iframe END-->\r\n");
      out.write("\r\n");
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
