/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.28
 * Generated at: 2015-12-10 01:22:36 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.manage.jianshenfang;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
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

public final class device_005fedit_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("java.util.Iterator");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("com.hanyou.util.BasicType");
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
    if (!(current_flags.indexOf(",3045,") > -1)) {
        out.print("<script>alert('没有对应的权限');</script>");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    int id = ru.getInt("id");
    //int device_type=ru.getInt("device_type");
	/*if(device_type<=0){
	 out.print("设备类型不存在");
	 return;
	 }*/
    if (action.equals("save")) {//更新
        DeviceAPI deviceApi = new DeviceAPI();
        out.print(deviceApi.addOrEditDevice(request, userid, user_name, gym_group_id, gym_id));
        return;
    }

    int gymGroupId = 0, gymId = 0, is_use = 0, device_data_type = 0, create_time = 0, device_type = 0;
    String device_name = "", device_mac = "", device_coding = "";
    String suohao = "", liushuihao = "", miyao = "", zhu_miyao = "";
    if (id > 0) {
        Doc doc = utildb.Get_Doc("gym_group_id,gym_id,device_name,device_type,device_data_type,device_coding, "
                        + "device_mac,is_use,create_time,suohao,liushuihao,miyao,zhu_miyao", "hy_device", "where isdel=0 and id=? ",
                "mysqlss", new Object[]{id});
        if (doc == null) {
            out.print("信息不存在");
            return;
        } else {
            device_name = doc.get("device_name", "");
            device_type = doc.getIn("device_type");
            device_data_type = doc.getIn("device_data_type");
            device_coding = doc.get("device_coding", "");
            device_mac = doc.get("device_mac", "");
            gymGroupId = doc.getIn("gym_group_id");
            gymId = doc.getIn("gym_id");
            is_use = doc.getIn("is_use");
            suohao = doc.get("suohao", "");
            liushuihao = doc.get("liushuihao", "");
            miyao = doc.get("miyao", "");
            zhu_miyao = doc.get("zhu_miyao", "");
            create_time = doc.getIn("create_time");
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
      out.write("    <script language=\"javascript\" src='../js/sys.js'></script>\r\n");
      out.write("    <script language=\"javascript\" src='../js/webcalendar.js'></script>\r\n");
      out.write("    <link href='/public/js/operamasks/operamasks-ui.css' rel='stylesheet' type='text/css'/>\r\n");
      out.write("    <script type='text/javascript' src='/public/js/operamasks/operamasks-ui.min.js'></script>\r\n");
      out.write("    <script type='text/javascript' src='/public/js/global.js'></script>\r\n");
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
      out.write("    <script type=\"text/javascript\">\r\n");
      out.write("        function usersave() {\r\n");
      out.write("            if ($('#device_type').val() == 0) {\r\n");
      out.write("                window.parent.art.dialog.alert(\"请选择设备的类型\");\r\n");
      out.write("                return;\r\n");
      out.write("            }\r\n");
      out.write("            if ($('#gymGroupId').val() == 0) {\r\n");
      out.write("                window.parent.art.dialog.alert(\"请选择连锁\");\r\n");
      out.write("                return;\r\n");
      out.write("            }\r\n");
      out.write("            if ($('#gymId').val() == 0) {\r\n");
      out.write("                window.parent.art.dialog.alert(\"请选择健身房\");\r\n");
      out.write("                return;\r\n");
      out.write("            }\r\n");
      out.write("            if ($('#device_name').val() == '') {\r\n");
      out.write("                window.parent.art.dialog.alert(\"请输入设备名称\");\r\n");
      out.write("                return;\r\n");
      out.write("            }\r\n");
      out.write("            if ($('#device_data_type').val() == 0) {\r\n");
      out.write("                window.parent.art.dialog.alert(\"请选择设备上传数据类型\");\r\n");
      out.write("                return;\r\n");
      out.write("            }\r\n");
      out.write("            if ($('#device_coding').val() == '') {\r\n");
      out.write("                window.parent.art.dialog.alert(\"请输入设备ID\");\r\n");
      out.write("                return;\r\n");
      out.write("            }\r\n");
      out.write("            if ($('#device_mac').val() == '') {\r\n");
      out.write("                window.parent.art.dialog.alert(\"请输入设备MAC地址\");\r\n");
      out.write("                return;\r\n");
      out.write("            }\r\n");
      out.write("            if ($('#device_type').val() == 1) {\r\n");
      out.write("                if ($('#suohao').val() == '') {\r\n");
      out.write("                    window.parent.art.dialog.alert(\"请输入门锁锁号\");\r\n");
      out.write("                    return;\r\n");
      out.write("                }\r\n");
      out.write("                if ($('#zhu_miyao').val() == '') {\r\n");
      out.write("                    window.parent.art.dialog.alert(\"请输入门锁主密钥\");\r\n");
      out.write("                    return;\r\n");
      out.write("                }\r\n");
      out.write("                if ($('#miyao').val() == '') {\r\n");
      out.write("                    window.parent.art.dialog.alert(\"请输入门锁密钥\");\r\n");
      out.write("                    return;\r\n");
      out.write("                }\r\n");
      out.write("                if ($('#liushuihao').val() == '') {\r\n");
      out.write("                    window.parent.art.dialog.alert(\"请输入门锁流水号\");\r\n");
      out.write("                    return;\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("            $(\"#tjbutton\").attr(\"disabled\", true);\r\n");
      out.write("            $(\"#tisspan\").html(\"<img src='../images/loading.gif' />提交中，请稍候……\");\r\n");
      out.write("            $.ajax({\r\n");
      out.write("                dataType: \"json\",\r\n");
      out.write("                type: \"post\",\r\n");
      out.write("                url: \"device_edit.jsp\",\r\n");
      out.write("                data: $(\"#form1\").serialize(),\r\n");
      out.write("                success: function (msg) {\r\n");
      out.write("                    if (msg.type) {\r\n");
      out.write("                        window.parent.art.dialog({\r\n");
      out.write("                            id: 'tisID',\r\n");
      out.write("                            content: msg.msg,\r\n");
      out.write("                            lock: true,\r\n");
      out.write("                            icon: \"succeed\",\r\n");
      out.write("                            cancelVal: '确定',\r\n");
      out.write("                            cancel: function () {\r\n");
      out.write("                                window.parent.location.reload();\r\n");
      out.write("                                window.parent.art.dialog({\r\n");
      out.write("                                    id: \"tisID\"\r\n");
      out.write("                                }).close();\r\n");
      out.write("                                window.parent.art.dialog({\r\n");
      out.write("                                    id: \"user\"\r\n");
      out.write("                                }).close();\r\n");
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
      out.write("        function change(obj) {\r\n");
      out.write("            if ($(obj).val() == 1) {\r\n");
      out.write("                $('#suoDiv').show();\r\n");
      out.write("            } else {\r\n");
      out.write("                $('#suoDiv').hide();\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("    </script>\r\n");
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
      out.write("                <li>设备类型：\r\n");
      out.write("                    <select name=\"device_type\" onchange=\"change(this)\" id=\"device_type\">\r\n");
      out.write("                        <option value=\"0\">--请选择设备类型--</option>\r\n");
      out.write("                        <option value=\"1\"");

                            if (device_type == 1) {
                                out.print("selected=\"selected\"");
                            }
                        
      out.write(">门锁\r\n");
      out.write("                        </option>\r\n");
      out.write("                        <option value=\"2\"");

                            if (device_type == 2) {
                                out.print("selected=\"selected\"");
                            }
                        
      out.write(">监控\r\n");
      out.write("                        </option>\r\n");
      out.write("                        <option value=\"3\"");

                            if (device_type == 3) {
                                out.print("selected=\"selected\"");
                            }
                        
      out.write(">跑步机\r\n");
      out.write("                        </option>\r\n");
      out.write("                        <option value=\"4\"");

                            if (device_type == 4) {
                                out.print("selected=\"selected\"");
                            }
                        
      out.write(">电车\r\n");
      out.write("                        </option>\r\n");
      out.write("                        <option value=\"5\"");

                            if (device_type == 5) {
                                out.print("selected=\"selected\"");
                            }
                        
      out.write(">体质秤\r\n");
      out.write("                        </option>\r\n");
      out.write("                    </select>\r\n");
      out.write("                </li>\r\n");
      out.write("                ");

                    if (gym_group_id == 0) {
                
      out.write("\r\n");
      out.write("                <li>所属连锁：\r\n");
      out.write("                    <select name=\"gymGroupId\" onchange=\"getGyms(this)\">\r\n");
      out.write("                        <option value=\"0\">--请选择连锁--</option>\r\n");
      out.write("                        ");
      out.print(BasicType.getLianSuo(gymGroupId, gym_group_id));
      out.write("\r\n");
      out.write("                    </select>\r\n");
      out.write("                </li>\r\n");
      out.write("                ");

                } else {
                
      out.write("\r\n");
      out.write("                <input name=\"gymGroupId\" id=\"gymGroupId\" type=\"hidden\" value=\"");
      out.print(gym_group_id);
      out.write("\"/>\r\n");
      out.write("                ");

                    }
                    if (gym_id == 0) {
                
      out.write("\r\n");
      out.write("                <li>健身房：\r\n");
      out.write("                    <select name=\"gymId\" id=\"gymId\">\r\n");
      out.write("                        <option value=\"0\">--请选择健身房--</option>\r\n");
      out.write("                        ");
      out.print(BasicType.getJianShenFang(gymId, gym_group_id, gym_id));
      out.write("\r\n");
      out.write("                    </select>\r\n");
      out.write("                </li>\r\n");
      out.write("                ");

                } else {
                
      out.write("\r\n");
      out.write("                <input name=\"gymId\" id=\"gymId\" type=\"hidden\" value=\"");
      out.print(gym_id);
      out.write("\"/>\r\n");
      out.write("                ");

                    }
                
      out.write("\r\n");
      out.write("            </ul>\r\n");
      out.write("            <ul class=\"row3 clearfix\">\r\n");
      out.write("                <li>设备名称：<input type=\"text\" name=\"device_name\" value=\"");
      out.print(device_name);
      out.write("\" id=\"device_name\"/></li>\r\n");
      out.write("                <li>上传数据类型：\r\n");
      out.write("                    <select name=\"device_data_type\" id=\"device_data_type\">\r\n");
      out.write("                        <option value=\"0\">--上传数据类型--</option>\r\n");
      out.write("                        ");

                            for (int i = 1; i <= BasicType.getDevicedatatype(); i++) {
                                if (i == device_data_type) {
                        
      out.write("\r\n");
      out.write("                        <option value=\"");
      out.print(device_data_type);
      out.write("\"\r\n");
      out.write("                                selected=\"selected\">");
      out.print(BasicType.getDateType(device_data_type));
      out.write("\r\n");
      out.write("                        </option>\r\n");
      out.write("                        ");

                        } else {
                        
      out.write("\r\n");
      out.write("                        <option value=\"");
      out.print(i);
      out.write('"');
      out.write('>');
      out.print(BasicType.getDateType(i));
      out.write("\r\n");
      out.write("                        </option>\r\n");
      out.write("                        ");

                                }
                            }
                        
      out.write("\r\n");
      out.write("                    </select>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li>设备ID：<input type=\"text\" name=\"device_coding\" value=\"");
      out.print(device_coding);
      out.write("\" id=\"device_coding\"/></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("            <ul class=\"row2 clearfix\">\r\n");
      out.write("                <li>设备MAC地址：<input type=\"text\" name=\"device_mac\" value=\"");
      out.print(device_mac);
      out.write("\" id=\"device_mac\"/></li>\r\n");
      out.write("                <li>是否在用：\r\n");
      out.write("                    <select name=\"is_use\">\r\n");
      out.write("                        <option value=\"0\"");

                            if (is_use == 0) {
                                out.print("selected=\"selected\"");
                            }
                        
      out.write(">在用\r\n");
      out.write("                        </option>\r\n");
      out.write("                        <option value=\"1\"");

                            if (is_use == 1) {
                                out.print("selected=\"selected\"");
                            }
                        
      out.write(">不在用\r\n");
      out.write("                        </option>\r\n");
      out.write("                    </select>\r\n");
      out.write("                </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("\r\n");
      out.write("            <div style=\"display: ");
if (device_type == 1) {out.print("black");} else {out.print("none");}
      out.write(";\"\r\n");
      out.write("                 id=\"suoDiv\">\r\n");
      out.write("                <ul class=\"row3 clearfix\">\r\n");
      out.write("                    <li>锁号：<input type=\"text\" name=\"suohao\" value=\"");
      out.print(suohao);
      out.write("\" id=\"suohao\"/></li>\r\n");
      out.write("                    <li>主密钥：<input type=\"text\" name=\"zhu_miyao\" value=\"");
      out.print(zhu_miyao);
      out.write("\" id=\"zhu_miyao\"/>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li>密钥：<input type=\"text\" name=\"miyao\" value=\"");
      out.print(miyao);
      out.write("\" id=\"miyao\"/></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("                <ul class=\"row1 clearfix\">\r\n");
      out.write("                    <li>流水号：<input type=\"number\" name=\"liushuihao\" value=\"");
      out.print(liushuihao);
      out.write("\" id=\"liushuihao\"/></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"row_btn\">\r\n");
      out.write("                <button type=\"button\" id=\"tjbutton\" onclick=\"usersave()\">确定提交</button>\r\n");
      out.write("                <span id=\"tisspan\"></span>\r\n");
      out.write("            </div>\r\n");
      out.write("        </form>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<!--End Sidebar-->\r\n");
      out.write("<script>\r\n");
      out.write("    $(document).ready(getGyms('select[name=gymGroupId]', '");
      out.print(gymId);
      out.write("'));\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
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
