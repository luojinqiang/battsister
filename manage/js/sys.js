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
function checkFloat(str) {
    if (isNaN(str)) {
        return false;
    } else {
        return true;
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

function getGyms(object, gymId) {
    var gymGroupId = $(object).val();
    if (gymGroupId == 0 || gymGroupId == undefined) {
        return false;
    } else {
        $.ajax({
            dataType: "json",
            type: "post",
            url: "/manage/ajax/sysajax.jsp",
            data: "action=getGymsOfGymGroup&gymGroupId= " + gymGroupId + " ",
            success: function (backJson) {
                if (backJson.type) {
                    var gyms = backJson.dataJson;
                    $("#gymId").empty();
                    $("#gymId").append("<option value=\"0\">--请选择健身房--</option>");
                    var option = '';
                    for (var i = 0; i < gyms.length; i++) {
                        if (gymId == gyms[i].id) {
                            option = $("<option value=" + gyms[i].id + " selected>" + gyms[i].gym_name + "</option>");
                        } else {
                            option = $("<option value=" + gyms[i].id + ">" + gyms[i].gym_name + "</option>");
                        }
                        $("#gymId").append(option);
                    }
                }
            }
        });
    }
}

function getCoachs(object, coach_id) {
    var gymId = $(object).val();
    if (gymId == 0 || gymId == undefined) {
        return false;
    } else {
        $.ajax({
            dataType: "json",
            type: "post",
            url: "/manage/ajax/sysajax.jsp",
            data: "action=getCoachsOGym&gymId= " + gymId + " ",
            success: function (backJson) {
                if (backJson.type) {
                    var coachs = backJson.dataJson;
                    $("#coach_id").empty();
                    $("#coach_id").append("<option value=\"0\">--请选择教练--</option>");
                    var option = '';
                    for (var i = 0; i < coachs.length; i++) {
                        if (coach_id == coachs[i].id) {
                            option = $("<option value=" + coachs[i].id + " selected>" + coachs[i].coach_name + "</option>");
                        } else {
                            option = $("<option value=" + coachs[i].id + ">" + coachs[i].coach_name + "</option>");
                        }

                        $("#coach_id").append(option);
                    }
                }
            }
        });
    }
}