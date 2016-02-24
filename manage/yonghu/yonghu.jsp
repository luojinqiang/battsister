<%@page import="java.net.URLEncoder" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.baje.sz.ajax.*" %>
<%@ page import="com.baje.sz.util.*" %>
<%@ page import="com.hanyou.admin.sys.*" %>
<%@ page import="java.net.URLDecoder" %>
<%@ include file="../ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    request.setCharacterEncoding("utf-8");
    if (current_flags.indexOf(",1001,") < 0) {
        response.sendRedirect("../error.jsp?left=yonghu");
        return;
    }
    UserMember um = new UserMember();
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    if (action.equals("del")) {
        out.print(um.memDel(request, userid, user_name, gym_group_id, gym_id).toString());
        return;
    }
    if (action.equals("batchdel")) {
        out.print(um.memDelBatch(request, userid, user_name, gym_group_id, gym_id).toString());
        return;
    }
    int pages = ru.getInt("page");
    if (pages == 0) {
        pages = 1;
    }
    int pn = ru.getInt("pn");
    if (pn == 0) {
        pn = 20;
    }

    String mem_name = ru.getString("mem_name", "");
    String mem_username = ru.getString("mem_username", "");
    String mem_mobile = ru.getString("mem_mobile", "");
    int province_id = ru.getInt("province_id");
    int city_id = ru.getInt("city_id");
    int area_id = ru.getInt("area_id");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>table</title>
    <link href="../css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="../css/base.css" rel="stylesheet" type="text/css"/>
    <link href="../css/page.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="../js/artDialog4.1.6/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="../js/artDialog4.1.6/plugins/iframeTools.source.js"></script>
    <script language="javascript" src='../js/sys.js'></script>
    <script language="javascript" src='/manage/js/webcalendar.js'></script>
    <script type="text/javascript">
        function del(id) {
            art.dialog({
                id: 'delID',
                content: '是否确定删除选中项？',
                lock: true,
                button: [
                    {
                        name: '确定',
                        callback: function () {
                            if (id == "") {
                                art.dialog({id: 'delID'}).close();
                                art.dialog.alert('请选择操作项');
                                return false;
                            }
                            $.ajax({
                                beforeSend: function () {
                                    art.dialog({id: 'delID'}).close();
                                    art.dialog({
                                        id: 'tisID',
                                        lock: true,
                                        title: '提交中，请稍候……'
                                    });
                                },
                                dataType: "json",
                                type: "post",
                                url: "yonghu.jsp",
                                data: "action=del&id=" + id + "",
                                success: function (msg) {
                                    art.dialog({id: 'tisID'}).close();
                                    if (msg.type == true) {
                                        art.dialog({
                                            id: 'tisID',
                                            content: msg.msg,
                                            lock: true,
                                            icon: "succeed",
                                            cancelVal: '确定',
                                            cancel: function () {
                                                window.location.reload();
                                                art.dialog({id: "tisID"}).close();
                                            }
                                        });
                                    } else {
                                        art.dialog.alert(msg.msg);
                                    }
                                }
                            });
                            return false;
                        },
                        focus: true
                    },
                    {
                        name: '取消'
                    }
                ]
            });
        }
        function batchdel(id) {
            var ids = getcheckbox("id");
            if (ids == "") {
                alert("请选择删除项？");
                return;
            }
            art.dialog({
                id: 'delID',
                content: '是否确定删除选中项？',
                lock: true,
                button: [
                    {
                        name: '确定',
                        callback: function () {
                            $.ajax({
                                beforeSend: function () {
                                    art.dialog({id: 'delID'}).close();
                                    art.dialog({
                                        id: 'tisID',
                                        lock: true,
                                        title: '提交中，请稍候……'
                                    });
                                },
                                dataType: "json",
                                type: "post",
                                url: "yonghu.jsp",
                                data: "action=batchdel&ids=" + ids + "",
                                success: function (msg) {
                                    art.dialog({id: 'tisID'}).close();
                                    if (msg.type == true) {
                                        art.dialog({
                                            id: 'tisID',
                                            content: msg.msg,
                                            lock: true,
                                            icon: "succeed",
                                            cancelVal: '确定',
                                            cancel: function () {
                                                window.location.reload();
                                                art.dialog({id: "tisID"}).close();
                                            }
                                        });
                                    } else {
                                        art.dialog.alert(msg.msg);
                                    }
                                }
                            });
                            return false;
                        },
                        focus: true
                    },
                    {
                        name: '取消'
                    }
                ]
            });
        }
        function addyonghu(id, title) {
            openurl('yonghu_edit.jsp?id=' + id + '', 'user', title, 700, 380, 0, 10, true);
        }

        function getCitys(object) {
            var provinceId = $(object).val();
            if (provinceId == 0) {
                return false;
            } else {
                $.ajax({
                    dataType: "json",
                    type: "post",
                    url: "/manage/ajax/sysajax.jsp",
                    data: "action=getCitysOfProvince&provinceId= " + provinceId + " ",
                    success: function (backJson) {
                        if (backJson.type) {
                            var citys = backJson.dataJson;
                            $("#city").empty();
                            $("#city").append("<option value=\"0\">--所在城市--</option>");
                            for (var i = 0; i < citys.length; i++) {
                                var option = $("<option value=" + citys[i].cityId + ">" + citys[i].city + "</option>");
                                $("#city").append(option);
                            }
                        }
                    }
                });

            }
        }
        function getAreas(object) {
            var city_id = $(object).val();
            if (city_id == 0) {
                return false;
            } else {
                $.ajax({
                    dataType: "json",
                    type: "post",
                    url: "/manage/ajax/sysajax.jsp",
                    data: "action=getAreasOfCity&city_id= " + city_id + " ",
                    success: function (backJson) {
                        if (backJson.type) {
                            var areas = backJson.dataJson;
                            $("#areaId").empty();
                            for (var i = 0; i < areas.length; i++) {
                                var option = $("<option value=" + areas[i].areaId + ">" + areas[i].area + "</option>");
                                $("#areaId").append(option);
                            }
                        }
                    }
                });

            }
        }


    </script>
</head>
<body class="ifr">
<%@ include file="../left.jsp" %><!--End Sidebar-->
<div class="iframe_box">
    <div class="form_info"><strong>会员列表</strong></div>
    <div class="form_cont mb10">
        <form id="form1" name="form1" method="get" action="">
            <ul class="row3">
                <li>会员名称：<input name="mem_name" type="text" id="mem_name" value="<%=mem_name%>" style="width:100px;"/>
                </li>
                <li>会员账号：<input name="mem_username" type="text" id="mem_username" value="<%=mem_username%>"
                                style="width:100px;"/></li>
                <li>手机号码：<input name="mem_mobile" type="text" id="mem_mobile" value="<%=mem_mobile%>"
                                style="width:100px;"/></li>
            </ul>
            <ul class="row3" style="margin-top:3px;">
                <li>所在省份：
                    <select name="province_id" onchange="getCitys(this)">
                        <option value="0">--所在省份--</option>
                        <%
                            List<Doc> provinceList = utildb
                                    .Get_List("provinceid,province", "g_province",
                                            " where isdel=0 and country_id=41", "mysqlss");
                            if (provinceList != null) {
                                for (Doc doc : provinceList) {
                                    if (doc != null) {
                        %>
                        <option value="<%=doc.get("provinceid")%>"
                                <%
                                    if (province_id == doc.getIn("provinceid")) {
                                        out.print("selected=\"selected\"");
                                    }
                                %>><%=doc.get("province")%>
                        </option>
                        <%
                                    }
                                }
                            } else {
                                out.print("<option  value=\"0\">--所在省份--</option>");
                            }
                        %>
                    </select>
                </li>
                <li>所在城市：
                    <%
                        List<Doc> cityList = null;
                        if (province_id != 0) {
                            cityList = utildb.Get_List("cityid,city", "g_city", "where isdel=0 and province_id=" + province_id, "mysqlss");
                        }
                    %>
                    <select name="city_id" id="city" onchange="getAreas(this)">
                        <option value="0">--所在城市--</option>
                        <%
                            if (cityList != null) {
                                for (Doc doc : cityList) {
                                    if (doc != null) {
                        %>
                        <option value="<%=doc.get("cityid")%>"<%
                            if (city_id == doc.getIn("cityid")) {
                                out.print("selected=\"selected\"");
                            }
                        %> ><%=doc.get("city")%>
                        </option>
                        <%
                                    }
                                }
                            } else {
                                out.print("<option  value=\"0\">--所在城市--</option>");
                            }
                        %>
                    </select>
                </li>
                <li>所在区县:
                    <%
                        List<Doc> areaList = null;
                        if (city_id != 0) {
                            areaList = utildb.Get_List("areaid,area", "g_area", "where isdel=0 and city_id=" + city_id, "mysqlss");
                        }
                    %>
                    <select name="area_id" id="areaId">
                        <option value="0">--所在区县--</option>
                        <%
                            if (areaList != null) {
                                for (Doc doc : areaList) {
                                    if (doc != null) {
                        %>
                        <option value="<%=doc.get("areaid")%>"<%
                            if (area_id == doc.getIn("areaid")) {
                                out.print("selected=\"selected\"");
                            }
                        %> ><%=doc.get("area")%>
                        </option>
                        <%
                                    }
                                }
                            } else {
                                out.print("<option  value=\"0\">--所在区县--</option>");
                            }
                        %>
                    </select>


                </li>

                <li class="btn_line" style="margin-top:3px;">
                    <button type="button" class="btn_formA" onclick="$('#form1').submit()">查&nbsp;&nbsp;询</button>
                </li>
            </ul>

        </form>
    </div>
    <div class="btnitem mb10 clearfix">
        <ul class="s_btn">
            <li><a href="javascript:addyonghu(0,'新增用户')">新增用户</a></li>
        </ul>
    </div>
    <div class="form_table">
        <form id="form2" name="form2" method="post" action="" autocomplete="off">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <th width="4%">&nbsp;</th>
                    <th width="8%">帐号</th>
                    <th width="8%">姓名</th>
                    <th width="8%">手机</th>
                    <th width="10%">邮箱</th>
                    <th width="4%">性别</th>
                    <th width="12%">头像</th>
                    <th width="10%">所在地区</th>
                    <th width="12%">注册时间</th>
                    <%-- <th width="12%">微信号</th>--%>
                    <th width="7%">操作</th>
                </tr>
                <%

                    String table = "hy_member a left join g_province b on a.mem_province=b.provinceid left join g_city c on a.mem_city=c.cityid left join g_area d on a.mem_area=d.areaid";
                    String wheres = "a.isdel=0 ";
                    List sqllist = new ArrayList();
                    if (!"".equals(mem_name)) {
                        wheres = wheres + " and a.mem_name like ?";
                        sqllist.add("%" + URLEncoder.encode(mem_name, "utf-8") + "%");
                    }
                    if (!mem_username.equals("")) {
                        wheres = wheres + " and a.mem_username like ?";
                        sqllist.add("%" + mem_username + "%");
                    }
                    if (!mem_mobile.equals("")) {
                        wheres = wheres + " and a.mem_mobile like ?";
                        sqllist.add("%" + mem_mobile + "%");
                    }
                    if (province_id > 0) {
                        wheres = wheres + " and a.mem_province=? ";
                        sqllist.add(province_id);
                    }
                    if (city_id > 0) {
                        wheres = wheres + " and a.mem_city=? ";
                        sqllist.add(city_id);
                    }
                    if (area_id > 0) {
                        wheres = wheres + " and a.mem_area=? ";
                        sqllist.add(area_id);
                    }
                    int i = 1;
                    String file = "a.id,a.mem_name,a.mem_username,a.mem_mobile,a.mem_headpic,a.mem_email,a.mem_weixin,b.province,c.city,d.area,a.mem_sex ," +
                            " a.mem_addtime,a.last_login_time,a.login_times ";
                    String order = " order by a.id desc";
                    String idd = "a.id";
                    i = pages * pn - pn + i;
                    String src = "";
                    int counts = utildb.Get_count(idd, table, wheres, "mysqlss", sqllist);
                    List list = utildb.Get_List(pages, pn, counts, table, wheres, file, order, "mysqlss", sqllist);
                    if (list != null) {
                        for (Iterator its = list.listIterator(); its.hasNext(); ) {
                            Doc doc = (Doc) its.next();
                %>
                <tr onmousemove="tableMove(this);" onmouseout="tableOut(this)">
                    <td><input name="id" type="checkbox" id="id" value="<%=doc.get("id")%>"/></td>
                    <td><%=doc.get("mem_username", "")%>
                    </td>
                    <td><%=(doc.get("mem_name", "") != null) ? URLDecoder.decode(doc.get("mem_name"), "utf-8") : ""%>
                    </td>
                    <td><%=(doc.get("mem_mobile", "") != null) ? doc.get("mem_mobile") : ""%>
                    </td>
                    <td><%=(doc.get("mem_email", "") != null) ? doc.get("mem_email") : ""%>
                    </td>
                    <td><%
                        if (doc.getIn("mem_sex") == 1) {
                            out.print("男");
                        } else if (doc.getIn("mem_sex") == 2) {
                            out.print("女");
                        } else {
                            out.print("未设置");
                        }
                    %></td>
                    <td><%=(doc.get("mem_headpic") != null && !doc.get("mem_headpic").equals("")) ? "<img src=\"" + doc.get("mem_headpic") + "\" width=\"30\">" : "" %>
                    </td>
                    <td><%=doc.get("province") + "-" + doc.get("city") + "-" + doc.get("area")%>
                    </td>
                    <td><%
                        if (doc.getIn("mem_addtime") > 0) {
                            out.print(AjaxXml.timeStamp2Date(doc.getIn("mem_addtime"), "YY04-MM-DD HH:MI:SS"));
                        }
                    %></td>
                    <%-- <td><%=doc.get("mem_weixin","") %></td>--%>
                    <td><a href="javascript:addyonghu(<%=doc.get("id")%>,'编辑用户')">编辑</a> <a
                            href="javascript:del(<%=doc.get("id") %>)">删除</a></td>
                </tr>

                <%
                        }
                    }
                %>
                <tr>
                    <td colspan="2" style="text-align:center"><input type="checkbox" name="chkall" id="chkall"
                                                                     value="checkbox" onclick="CheckAll(this.form);"/>
                        选中/取消所有
                    </td>
                    <td colspan="9" style="text-align:right"><input name="tjczft" type="button" onclick="batchdel()"
                                                                    value="批量删除"/><%out.print(AjaxXml.getPage(pages, 10, pn, counts, "", "", "", request));%>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div><!--r_iframe END-->

<%@ include file="../end.jsp" %><!--End Sidebar--></body>
</html>