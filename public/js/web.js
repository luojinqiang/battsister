var web_obj = {
    web_config_init: function () {
        global_obj.file_upload($('#musicUpload'), '', '', '', false, 1, function (filepath) {
            $('#config_form input[name=music_mp3]').val(filepath);
        }, '*.mp3', 500);
    },
    skinedit_init: function () {

        global_obj.file_upload($('#ReplyImgUpload'), $('#skin_form input[name=moban_pic]'), $('#ReplyImgDetail'));
        $('#ReplyImgDetail').html(global_obj.img_link($('#skin_form input[name=moban_pic]').val()));


        $('a[href=#add]').click(function () {
            $(this).blur();
            if ($('.r_con_wrap .list').size() >= 19) {
                alert('你最多只可以加入20条图文消息！');
                return false;
            }
            $('.r_con_wrap .list, a[href*=#mod], a[href*=#del]').off();
            $('<div class="list" id="id_' + Math.floor(Math.random() * 1000000) + '">' + $('.r_con_wrap .list:last').html() + '</div>').insertAfter($('.r_con_wrap .list:last'));
            //$('.r_con_wrap .list:last').children('.info').children('.title').html('标题').siblings('.img').html('缩略图');
            $('.r_con_wrap .list:last input').filter('[name=id]').val('').end().filter('[name=postion]').val('').end().filter('[name=title]').val('').end().filter('[name=url]').val('').end().filter('[name=num]').val('');
            //material_multi_list_even();
        });

        //$('#skin_form').submit(function(){
        //if(global_obj.check_form($('*[notnull]'))){return false};
        //$('#skin_form input:submit').attr('disabled', true);
        //return true;

        //$(this).attr('disabled', true);
        //$.post('?', $('#skin_form').serialize(), function(data){
        //	if(data.status==1){
        //		window.location='?m=web&a=products&d=category';
        //	}else{
        //		alert(data.msg);
        //		$('#web_category_form input:submit').attr('disabled', false);
        //	}
        //}, 'json');


        //});


    },
    skin_init: function () {
        $('#skin li .img').click(function () {
            if (!confirm('您确定要选择此风格吗？')) {
                return false
            }
            ;
            $.post('?', "action=skin&weixin_id=" + $(this).attr('weixin_id') + '&SId=' + $(this).attr('SId') + '&TradeId=' + $(this).attr('TradeId'), function (data) {
                if (data.status == 1) {
                    window.location.reload();
                }
            }, 'json');
        });
    },


    home_init: function () {
        //加载上传按钮
        global_obj.file_upload($('#HomeFileUpload'), $('#home_form input[name=ImgPath]'), $('#home .web_skin_index_list').eq($('#home_form input[name=no]')).find('.img'));
        for (var i = 0; i < 5; i++) {
            global_obj.file_upload($('#HomeFileUpload_' + i), $('#home_form input[name=ImgPathList\\[\\]]').eq(i), $('#home_form .b_r').eq(i));
        }

        $('.m_lefter a').attr('href', '#').css({'cursor': 'default', 'text-decoration': 'none'}).click(function () {
            $(this).blur();
            return false;
        });
        //加载版面内容
        for (i = 0; i < web_skin_data.length; i++) {
            var obj = $("#web_skin_index div").filter('[rel=edit-' + web_skin_data[i]['Postion'] + ']');
            obj.attr('no', i);
            if (web_skin_data[i]['ContentsType'] == 1) {
                var dataObj = eval("(" + web_skin_data[i]['ImgPath'] + ")");
                obj.find('.img').html('<img src="' + dataObj[0] + '" />');
            } else {
                if (web_skin_data[i]['NeedLink'] == 1) {
                    obj.find('.text').html('<a href="">' + web_skin_data[i]['Title'] + '</a>');
                } else {
                    obj.find('.text').html(web_skin_data[i]['Title']);
                }
                obj.find('.img').html('<img src="' + web_skin_data[i]['ImgPath'] + '" />');
            }
        }

        $('.web_skin_index_list div').after('<div class="mod">&nbsp;</div>');	//追加编辑按钮
        $('#web_skin_index .web_skin_index_list').hover(function () {
            $(this).find('.mod').show();
        }, function () {
            $(this).find('.mod').hide();
        });

        //点击图标切换编辑内容
        //$('#web_skin_index .web_skin_index_list .mod').html('&nbsp;<img src="static/images/ico/mod.gif" action="mod" />&nbsp;');
        //$('img[action=mod]').click(function(){
        $('#web_skin_index .web_skin_index_list .mod').click(function () {
            var parent = $(this).parent();
            var no = parent.attr('no');

            $('#SetHomeCurrentBox').remove();
            parent.append("<div id='SetHomeCurrentBox'></div>");
            $('#SetHomeCurrentBox').css({'height': parent.height() - 10, 'width': parent.width() - 10})
            $("#setbanner, #setimages").hide();
            $('.url_select').css('display', web_skin_data[no]['NeedLink'] == 1 ? 'block' : 'none');

            if (web_skin_data[no]['ContentsType'] == 1) {
                $("#setbanner").show();
                var dataImgPath = eval("(" + web_skin_data[no]['ImgPath'] + ")");
                var dataUrl = eval("(" + web_skin_data[no]['Url'] + ")");
                var dataTitle = eval("(" + web_skin_data[no]['Title'] + ")");
                $('#home_form #setbanner .tips label').html(web_skin_data[no]['Width'] + '*' + web_skin_data[no]['Height']);
                for (var i = 0; i < 5; i++) {
                    $('#home_form input[name=ImgPathList\\[\\]]').eq(i).val(dataImgPath[i])
                    $('#home_form input[name=UrlList\\[\\]]').eq(i).val(dataUrl[i]);
                    $('#home_form input[name=TitleList\\[\\]]').eq(i).val(dataTitle[i]);
                    dataImgPath[i] && $("#home_form .b_r").eq(i).html('<a href="' + dataImgPath[i] + '" target="_blank"><img src="' + dataImgPath[i] + '" /></a>');
                    if (dataUrl[i]) {
                        $("#home_form select[name=UrlList\\[\\]]").eq(i).find("option[value='" + dataUrl[i] + "']").attr("selected", true);
                    } else {
                        $("#home_form select[name=UrlList\\[\\]]").eq(i).find("option").eq(0).attr("selected", true);
                    }
                }
            } else {
                if (parent.find('.text').length) {
                    $("#setimages div[value=title]").show();
                } else {
                    $("#setimages div[value=title]").hide();
                }
                if (parent.find('.img').length) {
                    $("#setimages div[value=images]").show();
                } else {
                    $("#setimages div[value=images]").hide();
                }
                $("#setimages").show();
                $('#home_form input').filter('[name=Title]').val(web_skin_data[no]['Title'])
                    .end().filter('[name=ImgPath]').val(web_skin_data[no]['ImgPath'])
                    .end().filter('[name=Title]').focus();
                $('#home_form #setimages .tips label').html(web_skin_data[no]['Width'] + '*' + web_skin_data[no]['Height']);
                if (web_skin_data[no]['Url']) {
                    $("#home_form select[name=Url] option[value='" + web_skin_data[no]['Url'] + "']").attr("selected", true);
                } else {
                    $("#home_form select[name=Url] option").eq(0).attr("selected", true);
                }
            }

            $('#home_form input').filter('[name=PId]').val(web_skin_data[no]['PId'])
                .end().filter('[name=SId]').val(web_skin_data[no]['SId'])
                .end().filter('[name=ContentsType]').val(web_skin_data[no]['ContentsType'])
                .end().filter('[name=no]').val(no);
        });

        //加载默认内容
        //$('img[action=mod]').eq(0).click();
        $('#web_skin_index .web_skin_index_list .mod').eq(0).click();

        //ajax提交更新，返回
        $('#home_form').submit(function () {
            return false;
        });
        $('#home_form input:submit').click(function () {
            $(this).attr('disabled', true);
            $.post('?', $('#home_form').serialize() + '', function (data) {
                $('#home_form input:submit').attr('disabled', false);
                if (data.status == 1) {
                    $('#home_mod_tips .tips').html('首页设置成功！');
                    $('#home_mod_tips').leanModal();

                    var _no = $('#home_form input[name=no]').val();
                    var _v = $("div[no=" + _no + "]");
                    web_skin_data[_no]['ImgPath'] = data.ImgPath;
                    web_skin_data[_no]['Title'] = data.Title;
                    web_skin_data[_no]['Url'] = data.Url;
                    var dataImgPath = web_skin_data[_no]['ImgPath'];
                    if (web_skin_data[_no]['ContentsType'] != 1) {
                        _v.find('.text').html('<a href="">' + web_skin_data[_no]['Title'] + '</a>');
                    }
                    _v.find('.img').html('<img src="' + dataImgPath + '" />');
                } else {
                    $('#home_mod_tips .tips').html('首页设置失败，请重试！');
                    $('#home_mod_tips').leanModal();
                }
                ;
            }, 'json');
        });

        $('#home_form .item .rows .b_l a[href=#web_home_img_del]').click(function () {
            var _no = $(this).attr('value');
            $('#home_form .b_r').eq(_no).html('');
            $('#home_form input[name=ImgPathList\\[\\]]').eq(_no).val('');
            this.blur();
            return false;
        });
    },

    column_init: function () {
        $('#column dl').dragsort({
            dragSelector: 'dd.item',
            dragEnd: function () {
                var data = $('#column dl dd.item').map(function () {
                    return $(this).attr('CId');
                }).get();
                $.get('/member/web/column', {do_action: 'web.column_order', sort_order: data.join('|')});
            },
            dragSelectorExclude: 'ul, a',
            placeHolderTemplate: '<dd class="item placeHolder"></dd>',
            scrollSpeed: 5
        });
        $('#column ul').dragsort({
            dragSelector: 'li',
            dragEnd: function () {
                var data = $('#column ul li').map(function () {
                    return $(this).attr('AId');
                }).get();
                $.get('/member/web/column', {do_action: 'web.column_article_order', sort_order: data.join('|')});
            },
            dragSelectorExclude: 'a',
            placeHolderTemplate: '<li class="placeHolder"></li>',
            scrollSpeed: 5
        });

        $('#column .item ul li').hover(function () {
            $(this).children('.opt').show();
        }, function () {
            $(this).children('.opt').hide();
        });
    },

    column_edit_init: function () {
        if ($('#ColumnFileUpload').size()) {
            global_obj.file_upload($('#ColumnFileUpload'), $('#column_form input[name=pic_url_column]'), $('#ColumnImgDetail'), 'web_column');
            $('#ColumnImgDetail').html(global_obj.img_link($('#column_form input[name=pic_url_column]').val()));
        }

        var ext_link_fun = function () {
            if ($('#column_form input[name=ExtLink]:checked').size()) {
                $('#Description_rows, #ListType_rows').hide();
                $('#LinkUrl_span').show();
            } else {
                $('#Description_rows, #ListType_rows').show();
                $('#LinkUrl_span').hide();
                form_init_fun();
            }
        }
        var form_init_fun = function () {
            if ($('#column_form input[Name=CId]').val() != 0) {	//修改栏目
                if ($('#column_form input[name=ArticleCount]').val() == 0) {
                    //$('#Option_rows .pop_sub_menu').hide();
                    $('#Description_rows').show();
                    $('#ListType_rows').css({visibility: 'hidden', display: 'none'});
                } else {
                    //$('#Option_rows .pop_sub_menu').show();
                    $('#Description_rows').hide();
                    $('#ListType_rows').css({visibility: 'visible', display: 'block'});
                }
            }
            $('#column-article-list-type .item').removeClass('item_on').each(function () {
                $(this).click(function () {
                    $('#column-article-list-type .item').removeClass('item_on');
                    $(this).addClass('item_on');
                    $('#column_form input[name=ListTypeId]').val($(this).attr('ListTypeId'));
                });
            }).filter('[ListTypeId=' + $('#column_form input[name=ListTypeId]').val() + ']').addClass('item_on');
        }

        ext_link_fun();
        $('#column_form input[name=ExtLink]').click(ext_link_fun);

        $('#column_form').submit(function () {
            if (global_obj.check_form($('*[notnull]'))) {
                return false
            }
            ;
            $('#column_form input:submit').attr('disabled', true);
            return true;
        });
    },

    column_article_init: function () {
        if ($('#ColumnAtricleFileUpload').size()) {
            global_obj.file_upload($('#ColumnAtricleFileUpload'), $('#column_article_form input[name=pic_url_column]'), $('#ColumnAtricleImgDetail'), 'web_column_article');
            $('#ColumnAtricleImgDetail').html(global_obj.img_link($('#column_article_form input[name=pic_url_column]').val()));
        }

        $('#column_article_form .back').click(function () {
            window.location = '/member/web/column';
        });
        var ext_link_fun = function () {
            if ($('#column_article_form input[name=ExtLink]:checked').size()) {
                $('#Description_rows').hide();
                $('#LinkUrl_span').show();
            } else {
                $('#Description_rows').show();
                $('#LinkUrl_span').hide();
            }
        }
        ext_link_fun();
        $('#column_article_form input[name=ExtLink]').click(ext_link_fun);

        $('#column_article_form').submit(function () {
            var status = $("#parentid").val();
            //alert(status);
            if (status == '0') {
                $("#parentid").css('border', '1px solid red');
                //alert('请选择隶属栏目！');
                return false
            }
            ;
            if (global_obj.check_form($('*[notnull]'))) {
                return false
            }
            ;
            $('#column_article_form input:submit').attr('disabled', true);
            return true;
        });
    },

    products_init: function () {
        $('#PicDetail div span').on('click', function () {
            $(this).parent().remove();
        });
        var pic_count = parseInt($('#pic_count').html());

        var callback = function (imgpath) {
            if ($('#PicDetail div').size() >= pic_count) {
                alert('您上传的图片数量已经超过5张，不能再上传！');
                return;
            }
            $('#PicDetail').append('<div>' + global_obj.img_link(imgpath) + '<span>删除</span><input type="hidden" name="PicPath[]" value="' + imgpath + '" /></div>');
            $('#PicDetail div span').off('click').on('click', function () {
                $(this).parent().remove();
            });
        };

        global_obj.file_upload($('#PicUpload'), '', '', 'web_products', true, pic_count, callback);
        $('#products_form').submit(function () {
            if (global_obj.check_form($('*[notnull]'))) {
                return false
            }
            ;
            $('#products_form .submit').attr('disabled', true);
            return true;
        });
    },

    products_list_init: function () {
        $('a[href=#search]').click(function () {
            $('form.search').slideDown();
            return false;
        });
    },

    products_category_init: function () {
        if ($('#CategoryFileUpload').size()) {
            global_obj.file_upload($('#CategoryFileUpload'), $('#web_category_form input[name=PicPath]'), $('#CategoryImgDetail'), 'web_category');
            $('#CategoryImgDetail').html(global_obj.img_link($('#web_category_form input[name=PicPath]').val()));
        }

        $('#products .category .m_lefter dl').dragsort({
            dragSelector: 'dd',
            dragEnd: function () {
                var data = $(this).parent().children('dd').map(function () {
                    return $(this).attr('CateId');
                }).get();
                $.get('?m=web&a=products', {do_action: 'web.products_category_order', sort_order: data.join('|')});
            },
            dragSelectorExclude: 'ul, a',
            placeHolderTemplate: '<dd class="placeHolder"></dd>',
            scrollSpeed: 5
        });

        $('#products .category .m_lefter ul').dragsort({
            dragSelector: 'li',
            dragEnd: function () {
                var data = $(this).parent().children('li').map(function () {
                    return $(this).attr('CateId');
                }).get();
                $.get('?m=web&a=products', {do_action: 'web.products_category_order', sort_order: data.join('|')});
            },
            dragSelectorExclude: 'a',
            placeHolderTemplate: '<li class="placeHolder"></li>',
            scrollSpeed: 5
        });

        $('#products .category .m_lefter ul li').hover(function () {
            $(this).children('.opt').show();
        }, function () {
            $(this).children('.opt').hide();
        });

        $('#web_category_form').submit(function () {
            return false;
        });
        $('#web_category_form input:submit').click(function () {
            if (global_obj.check_form($('*[notnull]'))) {
                return false
            }
            ;
            $(this).attr('disabled', true);
            $.post('?', $('#web_category_form').serialize(), function (data) {
                if (data.status == 1) {
                    window.location = '?m=web&a=products&d=category';
                } else {
                    alert(data.msg);
                    $('#web_category_form input:submit').attr('disabled', false);
                }
            }, 'json');
        });
    },

    lbs_init: function () {
        global_obj.file_upload($('#LbsFileUpload'), $('#lbs_form input[name=ShopImg]'), $('#ShopImgDetail'));
        $('#ShopImgDetail').html(global_obj.img_link($('#lbs_form input[name=ShopImg]').val()));
        global_obj.map_init();

        var LbsLinkToStores = function () {
            if ($('#lbs_form input[name=LbsLinkToStores]').is(':checked')) {
                $('#lbs_form .not_lbs').hide();
            } else {
                $('#lbs_form .not_lbs').show();
            }
        };
        $('#lbs_form input[name=LbsLinkToStores]').click(LbsLinkToStores);
        LbsLinkToStores();

        $('#lbs_form').submit(function () {
            if (global_obj.check_form($('*[notnull]'))) {
                return false
            }
            ;
            $('#lbs_form input:submit').attr('disabled', true);
            return true;
        });
    }
}