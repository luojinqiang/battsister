// JavaScript Document
$(document).keydown(function (e) {
    var doPrevent;
    if (e.keyCode == 8) {
        var d = e.srcElement || e.target;
        if (d.tagName.toUpperCase() == 'INPUT' || d.tagName.toUpperCase() == 'TEXTAREA') {
            if (d.type.toUpperCase() != 'TEXT' && d.type.toUpperCase() != 'TEXTAREA' && d.type.toUpperCase() != 'PASSWORD') {
                doPrevent = true;
            } else {
                doPrevent = d.readOnly || d.disabled;
            }

        } else {
            doPrevent = true;
        }
    } else {
        doPrevent = false;
    }
    if (doPrevent) {
        e.preventDefault();
    }
});
function tableMove(obj) {
    obj.bgColor = '#FFFFFF';
}
function tableOut(obj) {
    obj.bgColor = '#FCFDEE';
}
function CheckAll(form) {
    for (var i = 0; i < form.elements.length; i++) {
        var e = form.elements[i];
        if (e.name != 'chkall')
            e.checked = form.chkall.checked;
    }
}
function getcheckbox(checkname) {
    var flag = "";
    $("[name='" + checkname + "']:checkbox").each(function () {
        if (this.checked == true) {
            if (flag == "") {
                flag = this.value;
            } else {
                flag = flag + "," + this.value;
            }

        }
    });
    return flag;
}
function getradiobox(radioname) {
    var ret = $('input[name="' + radioname + '"][@type=radio][checked]').val();
    if (ret == null) {
        ret = "";
    }
    return ret;
}
function getloupanSelect(str1, str2, otherid, showtype, function_name) {
    var waibao_id = $("#" + str1).val();
    $.ajax({
        type: "post",
        url: "../ajax/loupan.jsp",
        data: "action=getloupan&waibao_id=" + waibao_id + "&otherid=" + otherid + "&ShowType=" + showtype + "&function_name=" + function_name + "",
        success: function (msg) {
            $("#" + str2).empty();
            $("#" + str2).append($.trim(msg));
            if (function_name != "") {
                eval(function_name + "()")
            }
            //getyuangongSelect();
        }
    });
}
function getCPJLloupanSelect(str1, str2, str3, otherid, showtype, function_name) {
    var waibao_id = $("#" + str1).val();
    var cpjl = $("#" + str3).val();
    $.ajax({
        type: "post",
        url: "../ajax/loupan.jsp",
        data: "action=getCPJLloupan&waibao_id=" + waibao_id + "&cpjl=" + cpjl + "&otherid=" + otherid + "&ShowType=" + showtype + "&function_name=" + function_name + "",
        success: function (msg) {
            $("#" + str2).empty();
            $("#" + str2).append($.trim(msg));
            if (function_name != "") {
                eval(function_name + "()")
            }
            //getyuangongSelect();
        }
    });
}
function getfangxingSelect(str1, str2, otherid) {
    var loupan_id = $("#" + str1).val();
    $.ajax({
        type: "post",
        url: "../ajax/loupan.jsp",
        data: "action=getfangxing&loupan_id=" + loupan_id + "&otherid=" + otherid + "",
        success: function (msg) {
            $("#" + str2).empty();
            $("#" + str2).append($.trim(msg));
        }
    });
}
function gethouseSelect(str0, str1, str2, otherid, str4) {
    var fangxing_id = "";
    var loupan_id = $("#" + str0).val();
    if (str1 != "") {
        fangxing_id = $("#" + str1).val();
    }
    $.ajax({
        type: "post",
        url: "../ajax/loupan.jsp",
        data: "action=gethouse&loupan_id=" + loupan_id + "&fangxing_id=" + fangxing_id + "&otherid=" + otherid + "&str4=" + str4 + "",
        success: function (msg) {
            $("#" + str2).empty();
            $("#" + str2).append($.trim(msg));
        }
    });
}
function gethouseNoFangxingSelect(str0, str1, str2, otherid, str4) {
    var fangxing_id = "";
    var loupan_id = $("#" + str0).val();
    if (str1 != "") {
        fangxing_id = $("#" + str1).val();
    }
    $.ajax({
        type: "post",
        url: "../ajax/loupan.jsp",
        data: "action=gethouseNoFangxing&loupan_id=" + loupan_id + "&fangxing_id=" + fangxing_id + "&otherid=" + otherid + "&str4=" + str4 + "",
        success: function (msg) {
            $("#" + str2).empty();
            $("#" + str2).append($.trim(msg));
        }
    });
}
function getkongfangSelect(str0, str1, str2, otherid) {
    var fangxing_id = "";
    if (str1 != "") {
        fangxing_id = $("#" + str1).val();
    }
    var loupan_id = $("#" + str0).val();
    var yuji_ruzhu_time = $("#yuji_ruzhu_time").val();
    var yuji_tuifang_time = $("#yuji_tuifang_time").val();
    $.ajax({
        type: "post",
        url: "../ajax/loupan.jsp",
        data: "action=getkongfang&loupan_id=" + loupan_id + "&fangxing_id=" + fangxing_id + "&otherid=" + otherid + "&yuji_ruzhu_time=" + yuji_ruzhu_time + "&yuji_tuifang_time=" + yuji_tuifang_time + "",
        success: function (msg) {
            $("#" + str2).empty();
            $("#" + str2).append($.trim(msg));
        }
    });
}
function addLoupanCookies(str) {
    var loupan_id = $("#" + str).val();
    $.ajax({
        cache: false,
        async: false,
        type: "post",
        url: "../ajax/loupan.jsp",
        data: "action=addLCookies&loupan_id=" + loupan_id + "",
        success: function (msg) {
        },
        error: function () {
        }
    });
}
function rerul() {
    location.href = location.href;
}
function openurl(url, ifrnameid, titles, w, h, l, t, locks) {
    if (l > 0) {
        art.dialog({
            id: ifrnameid,
            padding: 0,
            content: '<iframe name="w_' + ifrnameid + '" id="w_' + ifrnameid + '" src="' + url + '" width="' + w + '" height="' + h + '" style="overflow-x:hidden" frameborder="0" scrolling="auto" ></iframe>',
            title: titles,
            width: w,
            left: l,
            top: t,
            fixed: true,
            esc: true,
            height: h,
            lock: locks,
            background: '#fff', // 背景色

            opacity: 0.27,	// 透明度

            dblclick_hide: false

        });
    } else {
        art.dialog({
            id: ifrnameid,
            padding: 0,
            content: '<iframe name="w_' + ifrnameid + '" id="w_' + ifrnameid + '" src="' + url + '" width="' + w + '" height="' + h + '" style="overflow-x:hidden" frameborder="0" scrolling="auto" ></iframe>',
            title: titles,
            width: w,
            top: t,
            fixed: true,
            lock: locks,
            esc: true,
            height: h,
            background: '#fff', // 背景色

            opacity: 0.27,	// 透明度

            dblclick_hide: false

        });
    }
//art.dialog.open(url, {title: titles,width:w,height:h,left:l,top:t,lock:true});	
}
function checkInte(str) {
    var re = /^\d+$/;
    if (re.test(str)) {
        return true;
    } else {
        return false;
    }
}
function checkMobile(str) {
    if (str == "" || !str.match(/^(1[3|4|5|8][0-9]\d{8})|(0)$/)) {
        return false;
    } else {
        return true;
    }
}
function checkDate(str, format) {
    var ereg = "";
    if (format == "M") {
        ereg = /^(\d{4}-\d{2})$/;
    } else if (format == "D") {
        ereg = /^(\d{1,4})(-|\/)(\d{1,2})(-|\/)(\d{1,2})$/;
    } else if (format == "h") {
        ereg = /^(\d{1,4})(-|\/)(\d{1,2})(-|\/)(\d{1,2})( )(\d{1,2})$/;
    } else if (format == "m") {
        ereg = /^(\d{1,4}-\d{1,2}-\d{1,2} \d{1,2}:\d{1,2})$/;
    }
    if (str == "" || !str.match(ereg)) {
        return false;
    } else {
        return true;
    }

}
function isChinaIDCard(StrNo) {
    StrNo = StrNo.toString()
    if (StrNo.length == 18) {
        var a, b, c
        if (!checkInte(StrNo.substr(0, 17))) {
            return false
        }
        /*
         a=parseInt(StrNo.substr(0,1))*7+parseInt(StrNo.substr(1,1))*9+parseInt(StrNo.substr(2,1))*10;
         a=a+parseInt(StrNo.substr(3,1))*5+parseInt(StrNo.substr(4,1))*8+parseInt(StrNo.substr(5,1))*4;
         a=a+parseInt(StrNo.substr(6,1))*2+parseInt(StrNo.substr(7,1))*1+parseInt(StrNo.substr(8,1))*6;
         a=a+parseInt(StrNo.substr(9,1))*3+parseInt(StrNo.substr(10,1))*7+parseInt(StrNo.substr(11,1))*9;
         a=a+parseInt(StrNo.substr(12,1))*10+parseInt(StrNo.substr(13,1))*5+parseInt(StrNo.substr(14,1))*8;
         a=a+parseInt(StrNo.substr(15,1))*4+parseInt(StrNo.substr(16,1))*2;
         b=a%11;
         if    (b==2)    //最后一位为校验位
         {
         c=StrNo.substr(17,1).toUpperCase();    //转为大写X
         }else{
         c=parseInt(StrNo.substr(17,1));
         }
         switch(b){
         case    0:    if    (    c!=1    )    {return    false;}break;
         case    1:    if    (    c!=0    )    {return    false;}break;
         case    2:    if    (    c!="X")    {return    false;}break;
         case    3:    if    (    c!=9    )    {return    false;}break;
         case    4:    if    (    c!=8    )    {return    false;}break;
         case    5:    if    (    c!=7    )    {return    false;}break;
         case    6:    if    (    c!=6    )    {return    false;}break;
         case    7:    if    (    c!=5    )    {return    false;}break;
         case    8:    if    (    c!=4    )    {return    false;}break;
         case    9:    if    (    c!=3    )    {return    false;}break;
         case    10:    if    (    c!=2    )   {return    false}
         }   
         */
    } else    //15位身份证号
    {
        if (!checkInte(StrNo)) {
            return false
        }
    }
    switch (StrNo.length) {
        case    15:
            if (isValidDate("19" + StrNo.substr(6, 2), StrNo.substr(8, 2), StrNo.substr(10, 2))) {
                return true;
            }
            else {
                return false;
            }
        case    18:
            if (isValidDate(StrNo.substr(6, 4), StrNo.substr(10, 2), StrNo.substr(12, 2))) {
                return true;
            }
            else {
                return false;
            }
    }
    return false
}
function isValidDate(iY, iM, iD) {
    var a = new Date(iY + "/" + iM + "/" + iD);
    var y = a.getFullYear();
    var m = a.getMonth() + 1;
    if (m < 10) {
        m = "0" + m;
    }
    var d = a.getDate();
    if (d < 10) {
        d = "0" + d;
    }
    if (y != iY || m != iM || d != iD) {
        return false;
    }
    return true
}