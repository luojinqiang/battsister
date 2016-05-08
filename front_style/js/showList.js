// JavaScript Document
function navList(id) {
    var slideupTime = 300;
    var $obj = $("#juheweb"), $item = $("#J_nav_" + id);
    $item.addClass("on").parent().removeClass("none").parent().addClass("selected");
    $obj.find("h4").hover(function () {
        $(this).addClass("hover");
    }, function () {
        $(this).removeClass("hover");
    });
    $obj.find("p").hover(function () {
        if ($(this).hasClass("on")) {
            return;
        }
        $(this).addClass("hover");
    }, function () {
        if ($(this).hasClass("on")) {
            return;
        }
        $(this).removeClass("hover");
    });
    $obj.find("h4").click(function () {
        var $div = $(this).siblings(".list-item");
        if ($(this).parent().hasClass("selected")) {
            $div.slideUp(slideupTime);
            $(this).parent().removeClass("selected");
        }
        if ($div.is(":hidden")) {
            $("#juheweb li").find(".list-item").slideUp(slideupTime);
            $("#juheweb li").removeClass("selected");
            $(this).parent().addClass("selected");
            $div.slideDown(slideupTime);

        } else {
            $div.slideUp(slideupTime);
        }
    });
}