<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.baje.sz.ajax.AjaxXml" %>
<%@ page import="com.baje.sz.util.Doc" %>
<%@ page import="com.baje.sz.util.RequestUtil" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ include file="../ini_sys.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    if (current_flags.indexOf(",3002,") < 0) {
        response.sendRedirect("../error.jsp?left=xinxi");
        return;
    }
    RequestUtil ru = new RequestUtil(request);
    String action=ru.getString("action");
    if (action.equals("save")) {
    	InfoApi infoApi=new InfoApi();
        JSONObject result = infoApi.editBannerPics(request, user_id, user_name);
        out.print(result);
        return;
    }
   	String banner1="";
   	String banner_little1="";
   	String banner2="";
   	String banner_little2="";
   	String banner3="";
   	String banner_little3="";
   	String banner4="";
   	String banner_little4="";
    Doc doc=utildb.Get_Doc("id,banner_pics", "bs_info", "","mysqlss");
    if(doc!=null&&doc.get("banner_pics")!=null&&!"".equals(doc.get("banner_pics"))){
    	JSONArray picArray=JSONArray.fromObject(doc.get("banner_pics"));
    	if(picArray!=null){
    		for(int i=0;i<picArray.size();i++){
    			JSONObject picJson=picArray.getJSONObject(i);
    			switch(i){
    			case 0:
    				banner1=picJson.optString("pic");
    				banner_little1=picJson.optString("pic_lit");
    				break;
    			case 1:
    				banner2=picJson.optString("pic");
    				banner_little2=picJson.optString("pic_lit");
    				break;
    			case 2:
    				banner3=picJson.optString("pic");
    				banner_little3=picJson.optString("pic_lit");
    				break;
    			case 3:
    				banner4=picJson.optString("pic");
    				banner_little4=picJson.optString("pic_lit");
    				break;
    			default:
    				break;
    			}
    		}
    	}
    }
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>table</title>
    <link href="../css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="../css/base.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script language="javascript" src='../js/sys.js'></script>
    <script type='text/javascript' src='/public/js/global.js'></script>
    <link type="text/css" rel="stylesheet" href="/public/js/jquery.alerts.css"/>
    <script type="text/javascript" src="/public/js/jquery.alerts.js"></script>
    <link href='/public/js/operamasks/operamasks-ui.css' rel='stylesheet' type='text/css'/>
    <script type='text/javascript' src='/public/js/operamasks/operamasks-ui.min.js'></script>
    <style type="text/css">
        .del {
            bottom: 0;
            height: 22px;
            width: 100px;
            line-height: 22px;
            text-align: center;
            background: #000;
            color: #fff;
            filter: alpha(opacity=70);
            -moz-opacity: 0.7;
            -khtml-opacity: 0.7;
            opacity: 0.7;
            cursor: pointer;
        }
    </style>
    <script type="text/javascript">
        function usersave() {
        	var bigfile1=$('input[name=bigfile1]').val();
        	if(bigfile1==""){
        		 window.parent.art.dialog.alert("请上传第一张大图");
        		 return;
        	}
        	var smallfile1=$('input[name=smallfile1]').val();
        	if(smallfile1==""){
       		 window.parent.art.dialog.alert("请上传第一张小图");
       		 return;
       		}
        	var bigfile2=$('input[name=bigfile2]').val();
        	if(bigfile2==""){
          		 window.parent.art.dialog.alert("请上传第二张大图");
          		 return;
          	}
        	var smallfile2=$('input[name=smallfile2]').val();
        	if(smallfile2==""){
         		 window.parent.art.dialog.alert("请上传第二张小图");
         		 return;
         	}
        	var bigfile3=$('input[name=bigfile3]').val();
        	if(bigfile3==""){
        		 window.parent.art.dialog.alert("请上传第三张大图");
        		 return;
        	}
        	var smallfile3=$('input[name=smallfile3]').val();
        	if(smallfile3==""){
       		 	window.parent.art.dialog.alert("请上传第三张小图");
       		 	return;
       		}
        	var bigfile4=$('input[name=bigfile4]').val();
        	if(bigfile4==""){
       		 	window.parent.art.dialog.alert("请上传第四张大图");
       		 	return;
       		}
        	var smallfile4=$('input[name=smallfile4]').val();
        	if(smallfile4==""){
       		 	window.parent.art.dialog.alert("请上传第四张小图");
       		 	return;
       		}
            $("#tjbutton").attr("disabled", true);
            $("#tisspan").html("<img src='../images/loading.gif' />提交中，请稍候……");
            $.ajax({
                type: "post",
                dataType: "json",
                url: "banner.jsp",
                data: $("#form1").serialize(),
                success: function (msg) {
                    if (msg.type) {
                        window.parent.art.dialog({
                            id: 'tisID',
                            content:msg.msg,
                            lock: true,
                            icon: "succeed",
                            cancelVal: '确定',
                            cancel: function () {
                                $("#tjbutton").attr("disabled", false);
                                $("#tisspan").html("");
                                window.parent.art.dialog({id: "tisID"}).close();
                                window.parent.tabclose("首页banner图");
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
    </script>
</head>
<body class="ifr" >
<%@ include file="../left.jsp" %><!--End Sidebar-->
<div class="iframe_box" >
    <div class="box_input" style="text-align: center;">
        <form id="form1" action="">
            <input name="action" id="action" type="hidden" value="save"/>
            <div style="margin-bottom: 10px;font-size: 14px;"><span style="color: red;">推荐大小：大图：1349x550像素&nbsp;&nbsp;&nbsp;小图：121x54像素</span></div>
            <ul class="row2 clearfix">
                <li>
                    第一张大图：
    <span class="input"><span class="upload_file"><div>
        <div class="up_input">
            <input name="FileUpload" id="bigfileUpload1" type="file"/>
        </div>
        <div class="tips">

        </div>
        <div class="clear"></div>
        <input type="hidden" name="bigfile1" value="<%=banner1%>"/>
    </div>
									<div class="img" id="bigfileDetail1">
                                    </div>
							</span>
							</span>

                </li>
                <li>第一张小图：
   				 <span class="input"><span class="upload_file"><div>
      		  <div class="up_input">
           			 <input name="FileUpload" id="smallfileUpload1" type="file"/>
        		</div>
        		<div class="tips">
       			 </div>
        		<div class="clear"></div>
        			<input type="hidden" name="smallfile1" value="<%=banner_little1%>"/>
    							</div>
									<div class="img" id="smallfileDetail1">
                                    </div>
							</span>
							</span>
                </li>
            </ul>
            <script>
                if ($('#bigfileUpload1').size()) {
                    global_obj.file_upload($('#bigfileUpload1'), $('#form1 input[name=bigfile1]'), $('#bigfileDetail1'), 'web_column', '', '', '', '', '', 200);
                    $('#bigfileDetail1').html(global_obj.img_linkheight($('#form1 input[name=bigfile1]').val()), '200');
                    if ($('#form1 input[name=bigfile1]').val() != '') {
                        $('#bigfileDetail1').append('<div class="del">删除</div>');
                    }
                    $('#bigfileDetail1 div').click(function () {
                        $('#form1 input[name=bigfile1]').val('');
                        $(this).parent().html('');
                    });
                }
                if ($('#smallfileUpload1').size()) {
                    global_obj.file_upload($('#smallfileUpload1'), $('#form1 input[name=smallfile1]'), $('#smallfileDetail1'), 'web_column');
                    $('#smallfileDetail1').html(global_obj.img_link($('#form1 input[name=smallfile1]').val()));
                    if ($('#form1 input[name=smallfile1]').val() != '') {
                        $('#smallfileDetail1').append('<div class="del">删除</div>');
                    }
                    $('#smallfileDetail1 div').click(function () {
                        $('#form1 input[name=smallfile1]').val('');
                        $(this).parent().html('');
                    });
                }
            </script>
            <ul class="row2 clearfix">
                <li>
                    第二张大图：
    <span class="input"><span class="upload_file"><div>
        <div class="up_input">
            <input name="FileUpload" id="bigfileUpload2" type="file"/>
        </div>
        <div class="tips">

        </div>
        <div class="clear"></div>
        <input type="hidden" name="bigfile2" value="<%=banner2%>"/>
    </div>
									<div class="img" id="bigfileDetail2">
                                    </div>
							</span>
							</span>

                </li>
                <li>第二张小图：
   				 <span class="input"><span class="upload_file"><div>
      		  <div class="up_input">
           			 <input name="FileUpload" id="smallfileUpload2" type="file"/>
        		</div>
        		<div class="tips">
       			 </div>
        		<div class="clear"></div>
        			<input type="hidden" name="smallfile2" value="<%=banner_little2%>"/>
    							</div>
									<div class="img" id="smallfileDetail2">
                                    </div>
							</span>
							</span>
                </li>
            </ul>
            <script>
                if ($('#bigfileUpload2').size()) {
                    global_obj.file_upload($('#bigfileUpload2'), $('#form1 input[name=bigfile2]'), $('#bigfileDetail2'), 'web_column', '', '', '', '', '', 200);
                    $('#bigfileDetail2').html(global_obj.img_linkheight($('#form1 input[name=bigfile2]').val()), '200');
                    if ($('#form1 input[name=bigfile2]').val() != '') {
                        $('#bigfileDetail2').append('<div class="del">删除</div>');
                    }
                    $('#bigfileDetail2 div').click(function () {
                        $('#form1 input[name=bigfile2]').val('');
                        $(this).parent().html('');
                    });
                }
                if ($('#smallfileUpload2').size()) {
                    global_obj.file_upload($('#smallfileUpload2'), $('#form1 input[name=smallfile2]'), $('#smallfileDetail2'), 'web_column');
                    $('#smallfileDetail2').html(global_obj.img_link($('#form1 input[name=smallfile2]').val()));
                    if ($('#form1 input[name=smallfile2]').val() != '') {
                        $('#smallfileDetail2').append('<div class="del">删除</div>');
                    }
                    $('#smallfileDetail2 div').click(function () {
                        $('#form1 input[name=smallfile2]').val('');
                        $(this).parent().html('');
                    });
                }
            </script>
            <ul class="row2 clearfix">
                <li>
                    第三张大图：
    <span class="input"><span class="upload_file"><div>
        <div class="up_input">
            <input name="FileUpload" id="bigfileUpload3" type="file"/>
        </div>
        <div class="tips">

        </div>
        <div class="clear"></div>
        <input type="hidden" name="bigfile3" value="<%=banner3%>"/>
    </div>
									<div class="img" id="bigfileDetail3">
                                    </div>
							</span>
							</span>

                </li>
                <li>第三张小图：
   				 <span class="input"><span class="upload_file"><div>
      		  <div class="up_input">
           			 <input name="FileUpload" id="smallfileUpload3" type="file"/>
        		</div>
        		<div class="tips">
       			 </div>
        		<div class="clear"></div>
        			<input type="hidden" name="smallfile3" value="<%=banner_little3%>"/>
    							</div>
									<div class="img" id="smallfileDetail3">
                                    </div>
							</span>
							</span>
                </li>
            </ul>
            <script>
                if ($('#bigfileUpload3').size()) {
                    global_obj.file_upload($('#bigfileUpload3'), $('#form1 input[name=bigfile3]'), $('#bigfileDetail3'), 'web_column', '', '', '', '', '', 200);
                    $('#bigfileDetail3').html(global_obj.img_linkheight($('#form1 input[name=bigfile3]').val()), '200');
                    if ($('#form1 input[name=bigfile3]').val() != '') {
                        $('#bigfileDetail3').append('<div class="del">删除</div>');
                    }
                    $('#bigfileDetail3 div').click(function () {
                        $('#form1 input[name=bigfile3]').val('');
                        $(this).parent().html('');
                    });
                }
                if ($('#smallfileUpload3').size()) {
                    global_obj.file_upload($('#smallfileUpload3'), $('#form1 input[name=smallfile3]'), $('#smallfileDetail3'), 'web_column');
                    $('#smallfileDetail3').html(global_obj.img_link($('#form1 input[name=smallfile3]').val()));
                    if ($('#form1 input[name=smallfile3]').val() != '') {
                        $('#smallfileDetail3').append('<div class="del">删除</div>');
                    }
                    $('#smallfileDetail3 div').click(function () {
                        $('#form1 input[name=smallfile3]').val('');
                        $(this).parent().html('');
                    });
                }
            </script>
            <ul class="row2 clearfix">
                <li>
                    第四张大图：
    <span class="input"><span class="upload_file"><div>
        <div class="up_input">
            <input name="FileUpload" id="bigfileUpload4" type="file"/>
        </div>
        <div class="tips">

        </div>
        <div class="clear"></div>
        <input type="hidden" name="bigfile4" value="<%=banner4%>"/>
    </div>
									<div class="img" id="bigfileDetail4">
                                    </div>
							</span>
							</span>

                </li>
                <li>第四张小图：
   				 <span class="input"><span class="upload_file"><div>
      		  <div class="up_input">
           			 <input name="FileUpload" id="smallfileUpload4" type="file"/>
        		</div>
        		<div class="tips">
       			 </div>
        		<div class="clear"></div>
        			<input type="hidden" name="smallfile4" value="<%=banner_little4%>"/>
    							</div>
									<div class="img" id="smallfileDetail4">
                                    </div>
							</span>
							</span>
                </li>
            </ul>
            <script>
                if ($('#bigfileUpload4').size()) {
                    global_obj.file_upload($('#bigfileUpload4'), $('#form1 input[name=bigfile4]'), $('#bigfileDetail4'), 'web_column', '', '', '', '', '', 200);
                    $('#bigfileDetail4').html(global_obj.img_linkheight($('#form1 input[name=bigfile4]').val()), '200');
                    if ($('#form1 input[name=bigfile4]').val() != '') {
                        $('#bigfileDetail4').append('<div class="del">删除</div>');
                    }
                    $('#bigfileDetail4 div').click(function () {
                        $('#form1 input[name=bigfile4]').val('');
                        $(this).parent().html('');
                    });
                }
                if ($('#smallfileUpload4').size()) {
                    global_obj.file_upload($('#smallfileUpload4'), $('#form1 input[name=smallfile4]'), $('#smallfileDetail4'), 'web_column');
                    $('#smallfileDetail4').html(global_obj.img_link($('#form1 input[name=smallfile4]').val()));
                    if ($('#form1 input[name=smallfile4]').val() != '') {
                        $('#smallfileDetail4').append('<div class="del">删除</div>');
                    }
                    $('#smallfileDetail4 div').click(function () {
                        $('#form1 input[name=smallfile4]').val('');
                        $(this).parent().html('');
                    });
                }
            </script>
            <div class="row_btn">
                <button type="button" class="btn_formA" onclick="usersave()" name="tjbutton" id="tjbutton">确定保存</button>
                <span id="tisspan"></span>
            </div>
        </form>
    </div>
</div><!--r_iframe END-->

<%@ include file="../end.jsp" %><!--End Sidebar-->
</body>
</html>