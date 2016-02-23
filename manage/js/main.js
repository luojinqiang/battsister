$(document).ready(function () {
    var xScroll, yScroll;
    if (window.innerHeight && window.scrollMaxY) {
        xScroll = window.innerWidth + window.scrollMaxX;
        yScroll = window.innerHeight + window.scrollMaxY;
    } else {
        if (document.body.scrollHeight > document.body.offsetHeight) { // all but Explorer Mac    
            xScroll = document.body.scrollWidth;
            yScroll = document.body.scrollHeight;
        } else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari    
            xScroll = document.body.offsetWidth;
            yScroll = document.body.offsetHeight;
        }
    }
    var windowWidth, windowHeight;
    if (self.innerHeight) { // all except Explorer    
        if (document.documentElement.clientWidth) {
            windowWidth = document.documentElement.clientWidth;
        } else {
            windowWidth = self.innerWidth;
        }
        windowHeight = self.innerHeight;
    } else {
        if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode    
            windowWidth = document.documentElement.clientWidth;
            windowHeight = document.documentElement.clientHeight;
        } else {
            if (document.body) { // other Explorers    
                windowWidth = document.body.clientWidth;
                windowHeight = document.body.clientHeight;
            }
        }
    }
    // for small pages with total height less then height of the viewport    
    if (yScroll < windowHeight) {
        pageHeight = windowHeight;
    } else {
        pageHeight = yScroll;
    }
    // for small pages with total width less then width of the viewport    
    if (xScroll < windowWidth) {
        pageWidth = xScroll;
    } else {
        pageWidth = windowWidth;
    }
    arrayPageSize = new Array(pageWidth, pageHeight, windowWidth, windowHeight);

    var mainHeight = pageHeight - 30 - 9 - 31;
    $(".tabs-panels .panel-body").height(mainHeight);
    $(".tabs-panels .panel").height(mainHeight);
    $(".tabs-panels").height(mainHeight);
    var kkk = Number(mainHeight) + 30;
    $("#tabsN").height(kkk);
    $(".panel-body").find("iframe").height(mainHeight);

})//刷新内容高度

function SetCwinHeight() {
    var bobo = document.getElementById("iframeid"); //iframe id
    if (document.getElementById) {
        if (bobo && !window.opera) {
            if (bobo.contentDocument && bobo.contentDocument.body.offsetHeight) {
                bobo.height = bobo.contentDocument.body.offsetHeight;
            } else if (bobo.Document && bobo.Document.body.scrollHeight) {
                bobo.height = bobo.Document.body.scrollHeight + 30;
                //alert(document.getElementById("amdright").style.width);
            }
        }
    }
}


$(document).ready(function () {
    var rl_box = $(".r_list li div").find("a").click(function () {
        $(this).addClass("select").parent().parent().siblings().find("a").removeClass("select");
    })
});//选取房间


$(document).ready(function () {
    //var li_last = $(".sidebar ul li:last-child");
    //var li_lastl = $(".sidebar ul li:last");
    //li_last.css("border-bottom","1px solid #66aa3a");
    //li_lastl.css("border-bottom","none")
});//修改导航LI最后一个样式

$(document).ready(function () {
    $(".dropdown img.flag").addClass("flagvisibility");

    $(".dropdown dt a").click(function () {
        $(".dropdown dd ul").toggle();
    });

    $(".dropdown dd ul li a").click(function () {
        var text = $(this).html();
        $(".dropdown dt a span").html(text);
        $(".dropdown dd ul").hide();
        $("#result").html("Selected value is: " + getSelectedValue("sample"));
    });

    function getSelectedValue(id) {
        return $("#" + id).find("dt a span.value").html();
    }

    $(document).bind('click', function (e) {
        var $clicked = $(e.target);
        if (!$clicked.parents().hasClass("dropdown"))
            $(".dropdown dd ul").hide();
    });

    $("#flagSwitcher").click(function () {
        $(".dropdown img.flag").toggleClass("flagvisibility");
    });
});//模拟SELECT

$(document).ready(function () {
    $(".r_tips").hover(function () {
        var x_position = $(this).position();
        var xScroll = (document.documentElement.scrollWidth > document.documentElement.clientWidth) ? document.documentElement.scrollWidth : document.documentElement.scrollWidth;
        var prtScn = xScroll / 2;
        //alert(x_position);
        //alert(xxxxx);
        var cont_width = $(this).parent().next(".t_cont").width();
        if (x_position.left > prtScn) {
            $(this).parent().next(".t_cont").css({
                "left": x_position.left - cont_width + 100,
                "top": x_position.top + 93
            });
            $(this).parent().next(".t_cont").show();
        } else {
            $(this).parent().next(".t_cont").css({"left": x_position.left + 0, "top": x_position.top + 93});
            $(this).parent().next(".t_cont").show();
        }
    }, function () {
        $(this).parent().next(".t_cont").hover(function () {
            $(this).show();
        }, function () {
            $(this).hide();
        })
        $(this).parent().next(".t_cont").hide();
    });
    $(".t_cont .wenzhi").click(function () {
        $(".r_list li .t_cont").hide();
        return;
        //setTimeout(function() { self.location.reload(); }, 10);
    })


});//TIPS效果

$(document).ready(function () {
    $(".time_list td").hover(function () {
        var x_position = $(this).offset();
        var xScroll = (document.documentElement.scrollWidth > document.documentElement.clientWidth) ? document.documentElement.scrollWidth : document.documentElement.scrollWidth;
        var prtScn = xScroll / 2;
        //alert(x_position);
        var cont_width = $(".pop_timelist").width();
        if (x_position.left > prtScn) {
            $(".pop_timelist").css({"left": x_position.left - cont_width + 100, "top": x_position.top + 43});
            $(".pop_timelist").show();
        } else {
            $(".pop_timelist").css({"left": x_position.left + 0, "top": x_position.top + 43});
            $(".pop_timelist").show();
        }
    }, function () {
        $(".pop_timelist").hover(function () {
            $(this).show();
        }, function () {
            $(this).hide();
        })
        $(".pop_timelist").hide();
    });
    $(".pop_timelist .wenzhi").click(function () {
        $(".pop_timelist").hide();
        return;
        //setTimeout(function() { self.location.reload(); }, 10);
    })


});//TIPS效果


$(document).ready(function () {

    $(".kj_tabs_title ul li").find("a").click(function () {
        $(this).parent().addClass("selected").siblings().removeClass("selected");
        var li_num = $(".kj_tabs_title ul li a");
        var index = li_num.index(this);
        $(".kj_tabs_cont .k_t_c_item").eq(index).show().siblings().hide();
    })

    $(".ftall_box").hover(function () {
        $(".t_cont").hide();
        $(this).css("background", "#fff");
        var nextpop = $(this).next(".t_cont");
        var x_position = $(this).offset();
        var xScroll = (document.documentElement.scrollWidth > document.documentElement.clientWidth) ? document.documentElement.scrollWidth : document.documentElement.scrollWidth;
        var cont_width = nextpop.width();
        var prtScn = xScroll / 2;
        if (x_position.left > prtScn) {
            nextpop.css({"left": x_position.left - cont_width + 0, "top": x_position.top - 40});
            nextpop.show();
        } else {
            nextpop.css({"left": x_position.left + 90, "top": x_position.top - 40});
            nextpop.show();
        }
    }, function () {
        var nextpop = $(this).next(".t_cont");
        $(this).removeAttr("style");
        nextpop.hover(function () {
            $(this).show();
        }, function () {
            $(this).hide();
        })
        nextpop.hide();
        $(".t_cont").hide();
    })


})//快捷页

