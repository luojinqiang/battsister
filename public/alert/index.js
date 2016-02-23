var alert_obj = {
    is_alert: function (title, tips, button1, button2, handle1, handle2) {
        $('body').prepend(
            '<div id="box">' +
            '<div class="alert_backg" style="width: 100%; height: 100%; opacity: 0.44; z-index:10100;"></div>' +
            '<div class="alert_frame" style="top: 30%; margin-top: 0px; opacity: 0.94;">' +
            '<div class="top_l"></div>' +
            '<div class="top_c"></div>' +
            '<div class="top_r"></div>' +

            '<div class="con">' +
            '<div class="con_l"></div>' +
            '<div class="con_c">' +
            '<div class="alert_tit">' +
            '<h2>' + title + '</h2>' +
            '<em id="alert_close"></em>' +
            '</div>' +
            '<div class="alert_con">' +
            '<div class="size">' + tips + '</div>' +
            '<div class="but">' +
            '<button class="alertButton" id="button_confirm">' + button1 + '</button>' +
            '<button class="alertButton" id="button_cancle">' + button2 + '</button>' +
            '</div>' +
            '</div>' +
            '</div>' +
            '<div class="con_r"></div>' +
            '</div>' +

            '<div class="bot_l"></div>' +
            '<div class="bot_c"></div>' +
            '<div class="bot_r"></div>' +
            '</div>' +
            '</div>');
        $('#alert_close').click(function () {
            $('#box').remove();
        });
        if ($.isFunction(handle1)) {
            $('#button_confirm').click(handle1);
        }
        if ($.isFunction(handle2)) {
            $('#button_cancle').click(handle2);
        }
    },
    is_tips: function (title, tips, handle) {
        $('body').append('<div id="box" >' +
            '<div class="alert_backg" style="width: 100%; height: 100%; opacity: 0.44;z-index:15000;"></div>' +
            '<div class="alert_frame" style="top: 30%; margin-top: 0px; opacity: 0.94;">' +
            '<div class="top_l"></div>' +
            '<div class="top_c"></div>' +
            '<div class="top_r"></div>' +
            '<div class="con">' +
            '<div class="con_l"></div>' +
            '<div class="con_c">' +
            '<div class="alert_tit">' +
            '<h2>' + title + '</h2>' +
            '<em id="alert_close2"></em>' +
            '</div>' +
            '<div class="alert_con">' +
            '<div class="size">' + tips + '</div>' +
            '<div class="but">' +
            '<button class="alertButton" id="button_confirm2">确定</button>' +
            '</div>' +
            '</div>' +
            '</div>' +
            '<div class="con_r"></div>' +
            '</div>' +
            '<div class="bot_l"></div>' +
            '<div class="bot_c"></div>' +
            '<div class="bot_r"></div>' +
            '</div>' +
            '</div>');
        $('#button_confirm2').click(function () {
            $('#box').remove();
        });
        $('#alert_close2').click(function () {
            $('#box').remove();
        });
        if ($.isFunction(handle)) {
            $('#button_confirm2').click(handle);
        }
    },
    check_form: function (obj) {
        var flag = false;
        obj.each(function () {
            if ($(this).val() == '') {
                $(this).css('border', '1px solid red');
                flag == false && ($(this).focus());
                flag = true;
            } else {
                $(this).removeAttr('style');
            }
        });
        return flag;
    }
};