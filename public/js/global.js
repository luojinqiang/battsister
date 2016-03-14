var edit_options = {
    autoHeightEnabled: false,
    catchRemoteImageEnable: false,
    imagePopup: false,
    toolbars: [['fontfamily', 'fontsize', 'forecolor', 'backcolor',
        '|', 'bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript',
        '|', 'indent', '|', 'justifyleft', 'justifycenter', 'justifyright',
        '|', "undo", "redo",
        '|', 'link', 'unlink', '|', 'insertimage', '|', 'insertvideo', '|', 'source']]
};
String.prototype.replaceAll = function (reallyDo, replaceWith, ignoreCase) {
    if (!RegExp.prototype.isPrototypeOf(reallyDo)) {
        return this.replace(new RegExp(reallyDo, (ignoreCase ? "gi" : "g")), replaceWith);
    } else {
        return this.replace(reallyDo, replaceWith);
    }
};
var global_obj = {
    file_upload: function (file_input_obj, filepath_input_obj, img_detail_obj, size) {
        var multi = (typeof(arguments[4]) == 'undefined') ? false : arguments[4];
        var queueSizeLimit = (typeof(arguments[5]) == 'undefined') ? 5 : arguments[5];
        var callback = arguments[6];
        var fileExt = (typeof(arguments[7]) == 'undefined') ? '*.jpg;*.png;*.gif;*.jpeg;*.bmp;*.pptx;*.ppt;*.doc;*.docx' : arguments[7];
        var fileSize = (typeof(arguments[8]) == 'undefined') ? 20480: arguments[8];
        var imgSize = (typeof(arguments[9]) == 'undefined') ? 100 : arguments[9];
        file_input_obj.omFileUpload({
            action: 'http://bd.battsister.com/manage/upfile.jsp',
            actionData: {
                do_action: 'action.file_upload',
                size: size
            },
            fileExt: fileExt,
            fileDesc: 'Files',
            sizeLimit: fileSize * 1024,
            onError: function (ID, fileObj, errorObj, event) {
                if (errorObj.type == 'File Size') {
                    alert('上传的文件大小不能超过' + fileSize + 'KB！');
                }
            },
            autoUpload: true,
            multi: multi,
            queueSizeLimit: queueSizeLimit,
            swf: '/public/swf/fileupload.swf?r=' + Math.random(),
            method: 'post',
            onComplete: function (ID, fileObj, response, data, event) {
                //alert(response);
                var jsonData = eval('(' + response + ')');
                //alert(jsonData);
                if (jsonData.status == 1) {
                    if ($.isFunction(callback)) {
                    	//alert(jsonData.imgpath+"  "+jsonData.little_url);
                        callback(jsonData.imgpath,jsonData.num);
                    } else {
                        filepath_input_obj.val(jsonData.imgpath);
                        img_detail_obj.html(global_obj.img_link(jsonData.imgpath, imgSize));
                        img_detail_obj.append('<div class="del">删除</div>');
                        $(img_detail_obj).find("div").click(function () {
                            filepath_input_obj.val('');
                            $(this).parent().html('');
                        });
                    }
                } else {
                    alert('图片上传失败，出现未知错误！');
                }
                ;
            }
        });
    },

    img_link: function (img) {
        var imgSize = (typeof(arguments[1]) == 'undefined') ? 100 : arguments[1];
        if (img) {
            return '<a href="' + img + '" target="_blank"><img src="' + img + '" height="' + imgSize + '"></a>';
        }
    },
    img_linkheight: function (img, height) {
        if (img) {
            return '<a href="' + img + '" target="_blank"><img src="' + img + '" height="' + height + '"></a>';
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

