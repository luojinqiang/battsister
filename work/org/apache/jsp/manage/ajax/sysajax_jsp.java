/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.28
 * Generated at: 2016-01-18 07:18:58 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.manage.ajax;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.hanyou.util.BasicType;
import com.hanyou.admin.sys.PlaceOperation;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import java.util.List;
import com.baje.sz.util.*;
import com.baje.sz.ajax.*;
import com.hanyou.admin.sys.*;

public final class sysajax_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/manage/ajax/../ini_sys.jsp", Long.valueOf(1448868343606L));
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
    _jspx_imports_classes.add("com.hanyou.admin.sys.PlaceOperation");
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
    String action = ru.getString("action");
    if ("getCitysOfProvince".equals(action)) {
        PlaceOperation po = new PlaceOperation();
        out.print(po.getCitysOfProvinces(request).toString().trim());
        return;
    }
    if ("getAreasOfCity".equals(action)) {
        PlaceOperation pa = new PlaceOperation();
        out.print(pa.getAreasByCityId(request));
    }

    if ("getGymsOfGymGroup".equals(action)) {
        int gymGroupId = ru.getInt("gymGroupId");
        JSONArray ja = new JSONArray();
        List<Doc> list = utildb.Get_List("id,gym_name", "hy_gym", " where isdel=0 and gym_group_id=?", "", new Object[]{gymGroupId});
        if (list != null) {
            for (Doc doc : list) {
                JSONObject json = new JSONObject();
                json.put("id", doc.get("id", ""));
                json.put("gym_name", doc.get("gym_name", ""));
                ja.add(json);
            }
        }
        JSONObject backjson = new JSONObject();
        backjson.put("type", true);
        backjson.put("dataJson", ja);
        out.print(backjson);
        return;
    }
    if ("getGymsOfUnitType".equals(action)) {
        int unit_type = ru.getInt("unit_type");
        JSONArray ja = new JSONArray();
        List<Doc> list = utildb.Get_List("unit_value", "hy_unit_value", " where isdel=0 and unit_type=? order by unit_value asc", "", new Object[]{unit_type});
        if (list != null) {
            for (Doc doc : list) {
                JSONObject json = new JSONObject();
                json.put("unit_value", doc.getIn("unit_value"));
                ja.add(json);
            }
        }
        JSONObject backjson = new JSONObject();
        backjson.put("type", true);
        backjson.put("dataJson", ja);
        out.print(backjson);
        return;
    }
    if ("getCoachsOGym".equals(action)) {
        int gymId = ru.getInt("gymId");
        JSONArray ja = new JSONArray();
        List<Doc> list = utildb.Get_List("id,coach_name", "hy_coach", " where isdel=0 and gym_id=?", "", new Object[]{gymId});
        if (list != null) {
            for (Doc doc : list) {
                JSONObject json = new JSONObject();
                json.put("id", doc.get("id", ""));
                json.put("coach_name", doc.get("coach_name", ""));
                ja.add(json);
            }
        }
        JSONObject backjson = new JSONObject();
        backjson.put("type", true);
        backjson.put("dataJson", ja);
        out.print(backjson);
        return;
    }
    if ("getActionByType".equals(action)) {//动作类型id获取动作
        int type_id = ru.getInt("type_id");
        JSONArray array = new JSONArray();
        List<Doc> list = utildb.Get_List("id,title,kal,action_device,train_position,train_time", "hy_member_plan_action", "where isdel=0 and plan_id=0 and action_type=? ", "mysqlss", new Object[]{type_id});
        //LogUtility.log("type_id=="+type_id);
        //LogUtility.log("list=="+list);
        if (list != null && !list.isEmpty()) {
            for (Doc doc : list) {
                JSONObject json = new JSONObject();
                json.put("id", doc.getIn("id"));
                json.put("title", doc.get("title", ""));
                json.put("kal", doc.getIn("kal"));
                json.put("action_device", doc.get("action_device"));
                json.put("train_position", doc.get("train_position"));
                json.put("train_time", doc.get("train_time"));
                array.add(json);
            }
        }
        JSONObject backjson = new JSONObject();
        backjson.put("type", true);
        backjson.put("array", array);
        out.print(backjson);
        return;
    }
    //获取七牛上传的token
    if("getUploadToken".equals(action)){
    	out.print(BasicType.getUploadToken());
    	return;
    }

      out.write('\r');
      out.write('\n');
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
