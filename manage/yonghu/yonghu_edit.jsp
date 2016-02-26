<%@page import="java.net.URLDecoder" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.baje.sz.util.*" %>
<%@ page import="com.baje.sz.ajax.*" %>
<%@ page import="com.hanyou.admin.sys.*" %>
<%@ include file="../ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    if (!(current_flags.indexOf(",1001,") > -1)) {
        out.print("<script>alert('没有对应的权限');</script>");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    String action = ru.getString("action");
    int id = ru.getInt("id");
    if (action.equals("save")) {//更新
        UserMember um = new UserMember();
        out.print(um.addOrEditmember(request, user_id, user_name, gym_group_id, gym_id));
        return;
    }
    String mem_name = "", mem_username = "", mem_mobile = "", mem_weixin = "", mem_email = "", mem_headpic = "";
    int mem_sex = 0, mem_birth = 0, men_shengao = 0, men_tizhong = 0, men_bufu = 0, mem_province = 0, mem_city = 0, mem_area = 0;

    if (id > 0) {
        Doc doc = utildb.Get_Doc("mem_name,mem_username,mem_mobile,mem_email,mem_weixin," +
                "mem_headpic,mem_sex,mem_birth,men_shengao,men_tizhong,men_bufu,mem_province,mem_city,mem_area", "hy_member", " where id=? and isdel=0", "mysqlss", new Object[]{id});
        if (doc == null) {
            out.print("信息不存在");
            return;
        } else {
            mem_name = URLDecoder.decode(doc.get("mem_name"), "utf-8");
            mem_username = doc.get("mem_username");
            mem_mobile = doc.get("mem_mobile");
            mem_weixin = doc.get("mem_weixin");
            mem_email = doc.get("mem_email");
            mem_headpic = doc.get("mem_headpic");
            mem_sex = doc.getIn("mem_sex");
            mem_birth = doc.getIn("mem_birth");
            men_shengao = doc.getIn("men_shengao");
            men_tizhong = doc.getIn("men_tizhong");
            men_bufu = doc.getIn("men_bufu");
            mem_province = doc.getIn("mem_province");
            mem_city = doc.getIn("mem_city");
            mem_area = doc.getIn("mem_area");
        }
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>table</title>
    <link href="../css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="../css/base.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script language="javascript" src='../js/sys.js'></script>
    <script language="javascript" src='../js/webcalendar.js'></script>
    <script type='text/javascript' src='/public/js/global.js'></script>
    <script type='text/javascript' src='/public/js/operamasks/operamasks-ui.min.js'></script>
    <script type="text/javascript">
        function usersave() {

            $("#tjbutton").attr("disabled", true);
            $("#tisspan").html("<img src='../images/loading.gif' />提交中，请稍候……");
            $.ajax({
                dataType: "json",
                type: "post",
                url: "yonghu_edit.jsp",
                data: $("#form1").serialize(),
                success: function (msg) {
                    if (msg.type) {
                        window.parent.art.dialog({
                            id: 'tisID',
                            content: msg.msg,
                            lock: true,
                            icon: "succeed",
                            cancelVal: '确定',
                            cancel: function () {
                                window.parent.location.reload();
                                window.parent.art.dialog({id: "tisID"}).close();
                                window.parent.art.dialog({id: "user"}).close();
                            }
                        });
                    } else {
                        window.parent.art.dialog.alert(msg.msg);
                        $("#tjbutton").attr("disabled", false);
                        $("#tisspan").html("");
                    }

                }
            });
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
<div id="dd" style="padding:5px;">
    <div class="box_input">
        <form id="form1" name="form1" method="post" action="">
            <input name="id" id="id" type="hidden" value="<%=id%>"/>
            <input name="action" id="action" type="hidden" value="save"/>

            <ul class="row3 clearfix">
                <li>帐号：<input type="text" name="mem_username" value="<%=mem_username%>" <%
                    if (id > 0) {
                        out.print("readonly=\"readonly\"");
                    }
                %>/></li>
                <li>会员名称:<input type="text" value="<%=mem_name%>" name="mem_name"/></li>
                <li>手机号码:<input type="text" value="<%=mem_mobile%>" name="mem_mobile"/></li>
            </ul>
            <ul class="row3 clearfix">
                <li>性别:
                    <select name="mem_sex">
                        <option value="0" <%
                            if (mem_sex == 0) {
                                out.print("selected=\"selected\"");
                            }
                        %>>未设置
                        </option>
                        <option value="1" <%
                            if (mem_sex == 1) {
                                out.print("selected=\"selected\"");
                            }
                        %>>男
                        </option>
                        <option value="2" <%
                            if (mem_sex == 2) {
                                out.print("selected=\"selected\"");
                            }
                        %>>女
                        </option>
                    </select>
                </li>
                <li>邮箱：<input type="text" value="<%=mem_email%>" name="mem_email"/></li>
                <%-- <li>微信:<input type="text" value="<%=mem_weixin%>" name="mem_weixin"/></li>--%>
                <li></li>
            </ul>
            <ul class="row1 clearfix">
                <li>头像图：
							<span class="input"> <span class="upload_file">
									<div>
                                        <div class="up_input">
                                            <input name="FileUpload" id="smallfileUpload1" type="file"/>
                                        </div>
                                        <div class="tips">
                                            图片尺寸建议：600*230px
                                        </div>
                                        <div class="clear"></div>
                                        <input type="hidden" name="mem_headpic"
                                               value="<%=mem_headpic%>"/>
                                    </div>
									<div class="img" id="smallfileDetail1" style="width: 100px;"></div>
							</span> </span>
                </li>
            </ul>
            <script type="text/javascript">
                if ($('#smallfileUpload1').size()) {
                    global_obj.file_upload($('#smallfileUpload1'),
                            $('#form1 input[name=mem_headpic]'), $('#smallfileDetail1'),
                            'web_column');
                    $('#smallfileDetail1').html(
                            global_obj.img_link($('#form1 input[name=mem_headpic]').val()));
                    if ($('#form1 input[name=mem_headpic]').val() != '') {
                        $('#smallfileDetail1').append('<div class="del">删除</div>');
                    }
                    $('#smallfileDetail1 div').click(function () {
                        $('#form1 input[name=mem_headpic]').val('');
                        $(this).parent().html('');
                    });
                }
            </script>
            <ul class="row3 clearfix">
                <%-- <li>头像：<%=(!mem_headpic.equals(""))?"<img src=\""+mem_headpic+"\" width=\"50px\">":"" %></li>--%>
                <li>生日:<input name="mem_birth" type="text" id="mem_birth"
                              value="<%if(mem_birth>0){out.print(AjaxXml.timeStamp2Date(mem_birth, "YY04-MM-DD HH:MI:SS"));} %>"
                              style="width:65px;" onclick="SelectDate(this,'yyyy-MM-dd',0,0)"/></li>
                <%--<li>性别：<%
                if(mem_sex==1){
                    out.print("男");
                }else if (mem_sex==2){
                    out.print("女");
                }else {
                    out.print("未设置");
                }
                %></li>--%>
            </ul>
            <ul class="row3 clearfix">
                <li>步幅：<input type="text" name="men_bufu" value="<%=men_bufu%>"/> cm</li>
                <li>身高：<input type="text" name="men_shengao" value="<%=men_shengao%>"/> cm</li>
                <li>体重:<input type="text" name="men_tizhong" value="<%=men_tizhong%>"/> kg</li>
            </ul>
            <ul class="row3 clearfix">
                <li>
                    省份:<select name="provinceId" onchange="getCitys(this)">
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
                                if (mem_province == doc.getIn("provinceid")) {
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
                <li>
                    城市:<%
                    List<Doc> cityList = null;
                    if (mem_province != 0) {
                        cityList = utildb.Get_List("cityid,city", "g_city", "where isdel=0 and province_id=" + mem_province, "mysqlss");
                    }
                %>
                    <select name="cityId" id="city" onchange="getAreas(this)">
                        <option value="0">--所在城市--</option>
                        <%
                            if (cityList != null) {
                                for (Doc doc : cityList) {
                                    if (doc != null) {
                        %>
                        <option value="<%=doc.get("cityid")%>"<%
                            if (mem_city == doc.getIn("cityid")) {
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
                <li>区县:
                    <%
                        List<Doc> areaList = null;
                        if (mem_city != 0) {
                            areaList = utildb.Get_List("areaid,area", "g_area", "where isdel=0 and city_id=" + mem_city, "mysqlss");
                        }
                    %>
                    <select name="areaId" id="areaId">
                        <option value="0">--所在区县--</option>
                        <%
                            if (areaList != null) {
                                for (Doc doc : areaList) {
                                    if (doc != null) {
                        %>
                        <option value="<%=doc.get("areaid")%>"<%
                            if (mem_area == doc.getIn("areaid")) {
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
            </ul>
            <div class="row_btn">
                <button type="button" id="tjbutton" onclick="usersave()">确定提交</button>
                <span id="tisspan"></span>
            </div>
        </form>
    </div>

</div>
<!--End Sidebar--> </body>
</html>