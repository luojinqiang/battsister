/*global Qiniu */
/*global plupload */
/*global FileProgress */
/*global hljs */


$(function() {
    var uploader = Qiniu.uploader({
        runtimes: 'html5,flash,html4',
        browse_button: 'pickfiles',
        container: 'container',
        drop_element: 'container',
        max_file_size: '100mb',
        flash_swf_url: 'js/qiniu_js/demo/js/plupload/Moxie.swf',
        dragdrop: true,
        chunk_size: '4mb',
        get_new_uptoken: true,//是否每次上传的时候都获取新端token
        uptoken_url: '/uptoken.jsp',
        domain: 'http://7xrnsw.com2.z0.glb.qiniucdn.com/',
        // downtoken_url: '/downtoken',
        // unique_names: true,
        // save_key: true,
        // x_vars: {
        //     'id': '1234',
        //     'time': function(up, file) {
        //         var time = (new Date()).getTime();
        //         // do something with 'time'
        //         return time;
        //     },
        // },
        auto_start: true,
        init: {
            'FilesAdded': function(up, files) {
              /*  $('table').show();
                $('#success').hide();*/
                plupload.each(files, function(file) {
                   /* var progress = new FileProgress(file, 'fsUploadProgress');*/
                   /* progress.setStatus("等待...");*/
                    /*progress.bindUploadCancel(up);*/
                });
            },
            'BeforeUpload': function(up, file) {
              /*  var progress = new FileProgress(file, 'fsUploadProgress');
                var chunk_size = plupload.parseSize(this.getOption('chunk_size'));
                if (up.runtime === 'html5' && chunk_size) {
                    progress.setChunkProgess(chunk_size);
                }*/
            },
            'UploadProgress': function(up, file) {
              /*  var progress = new FileProgress(file, 'fsUploadProgress');
                var chunk_size = plupload.parseSize(this.getOption('chunk_size'));
                progress.setProgress(file.percent + "%", file.speed, chunk_size);*/
            	$('#fsUploadProgress').html(file.percent+"%");
            	$('#fsUploadProgress').css("width",file.percent);
            	$('#fsUploadProgress').css("height","20px");
            },
            'UploadComplete': function() {
               /* $('#success').show();*/
            	$('#fsUploadProgress').html("上传成功!");
            },
            'FileUploaded': function(up, file, info) {
            	/*console.log('info-->'+info);*/
            	var json=JSON.parse(info);
            	/* console.log("video_path->"+$('input[name=video_path]').val());*/
            	
            	if($('input[name=video_path]').val()==undefined){
            		 /*console.log('undefined');*/
            		$('#container').append("<input type=\"hidden\" name=\"video_path\" value=\""+("http://7xrnsw.com2.z0.glb.qiniucdn.com/"+json.key)+"\"/><span id=\"show_path\">"+("http://7xrnsw.com2.z0.glb.qiniucdn.com/"+json.key)+"</span>");
            		
            	}else{/*
            		 console.log('不是undefined');*/
            		$('input[name=video_path]').val("http://7xrnsw.com2.z0.glb.qiniucdn.com/"+json.key);
            		$("#show_path").html("http://7xrnsw.com2.z0.glb.qiniucdn.com/"+json.key);
            	}
                /*var progress = new FileProgress(file, 'fsUploadProgress');

                $.ajax('./uptoken',{
                    async: false
                }).done(function(data){
                    $.extend(info, data);
                    progress.setComplete(up, info);
                }).error(function(){
                    console.log('获取下载token失败');
                });*/
            /*	//调用接口生成缩略图
            	 $.post('/manage/ajax/sysajax.jsp', 'action=getPic&file_name='+json.key, function(data) {
 		          if(data.type){
 		        	 console.log('获取缩略图成功:');
 		        	 if($('input[name=little_url]').val()==undefined){
 	            		 console.log('undefined');
 	            		$('#container').append("<input type=\"hidden\" name=\"little_url\" value=\""+("http://7xouve.com2.z0.glb.qiniucdn.com/"+data.pic_name)+"\"/>");
 	            		
 	            	}else{
 	            		 console.log('不是undefined');
 	            		$('input[name=little_url]').val(("http://7xouve.com2.z0.glb.qiniucdn.com/"+data.pic_name));
 	            	}
 		          }else{
 		        	 console.log('获取缩略图失败:'+data.msg);
 		          }
 		        }, 'json');*/
            	//设置图片
            	var show="<video id=\"really-cool-video\" class=\"video-js vjs-default-skin vjs-big-play-centered\" controls"+
            			"preload=\"auto\" width=\"640\" height=\"264\" poster=\"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png\""+
            					"data-setup='{}'>"+
            		"<source src=\""+("http://7xrnsw.com2.z0.glb.qiniucdn.com/"+json.key)+"\" type='video/mp4' />"+
            			"<p class=\"vjs-no-js\">"+
            				"To view this video please enable JavaScript, and consider upgrading to a web browser"+
            					"that <a href=\"http://videojs.com/html5-video-support/\" target=\"_blank\">supports HTML5 video</a>"+
            							"</p>"+
            								"</video>";
            	$('#container').append(show);
            },
            'Error': function(up, err, errTip) {
               /* $('table').show();*/
              /*  var progress = new FileProgress(err.file, 'fsUploadProgress');
                progress.setError();
                progress.setStatus(errTip);*/
            	 console.log("errTip--->"+errTip);
            },
                'Key': function(up, file) {
                     var key = "";
                     var mydate = new Date();
                     var file_name=file.name;
                     var strs=file_name.split("."); 
                     key=mydate.getTime()+"."+strs[strs.length-1];
                     return key;
                 }
        }
    });
/*
    uploader.bind('FileUploaded', function() {
        console.log('hello man,a file is uploaded');
    });
    $('#container').on(
        'dragenter',
        function(e) {
            e.preventDefault();
            $('#container').addClass('draging');
            e.stopPropagation();
        }
    ).on('drop', function(e) {
        e.preventDefault();
        $('#container').removeClass('draging');
        e.stopPropagation();
    }).on('dragleave', function(e) {
        e.preventDefault();
        $('#container').removeClass('draging');
        e.stopPropagation();
    }).on('dragover', function(e) {
        e.preventDefault();
        $('#container').addClass('draging');
        e.stopPropagation();
    });



    $('#show_code').on('click', function() {
        $('#myModal-code').modal();
        $('pre code').each(function(i, e) {
            hljs.highlightBlock(e);
        });
    });


    $('body').on('click', 'table button.btn', function() {
        $(this).parents('tr').next().toggle();
    });


    var getRotate = function(url) {
        if (!url) {
            return 0;
        }
        var arr = url.split('/');
        for (var i = 0, len = arr.length; i < len; i++) {
            if (arr[i] === 'rotate') {
                return parseInt(arr[i + 1], 10);
            }
        }
        return 0;
    };

    $('#myModal-img .modal-body-footer').find('a').on('click', function() {
        var img = $('#myModal-img').find('.modal-body img');
        var key = img.data('key');
        var oldUrl = img.attr('src');
        var originHeight = parseInt(img.data('h'), 10);
        var fopArr = [];
        var rotate = getRotate(oldUrl);
        if (!$(this).hasClass('no-disable-click')) {
            $(this).addClass('disabled').siblings().removeClass('disabled');
            if ($(this).data('imagemogr') !== 'no-rotate') {
                fopArr.push({
                    'fop': 'imageMogr2',
                    'auto-orient': true,
                    'strip': true,
                    'rotate': rotate,
                    'format': 'png'
                });
            }
        } else {
            $(this).siblings().removeClass('disabled');
            var imageMogr = $(this).data('imagemogr');
            if (imageMogr === 'left') {
                rotate = rotate - 90 < 0 ? rotate + 270 : rotate - 90;
            } else if (imageMogr === 'right') {
                rotate = rotate + 90 > 360 ? rotate - 270 : rotate + 90;
            }
            fopArr.push({
                'fop': 'imageMogr2',
                'auto-orient': true,
                'strip': true,
                'rotate': rotate,
                'format': 'png'
            });
        }

        $('#myModal-img .modal-body-footer').find('a.disabled').each(function() {

            var watermark = $(this).data('watermark');
            var imageView = $(this).data('imageview');
            var imageMogr = $(this).data('imagemogr');

            if (watermark) {
                fopArr.push({
                    fop: 'watermark',
                    mode: 1,
                    image: 'http://www.b1.qiniudn.com/images/logo-2.png',
                    dissolve: 100,
                    gravity: watermark,
                    dx: 100,
                    dy: 100
                });
            }

            if (imageView) {
                var height;
                switch (imageView) {
                    case 'large':
                        height = originHeight;
                        break;
                    case 'middle':
                        height = originHeight * 0.5;
                        break;
                    case 'small':
                        height = originHeight * 0.1;
                        break;
                    default:
                        height = originHeight;
                        break;
                }
                fopArr.push({
                    fop: 'imageView2',
                    mode: 3,
                    h: parseInt(height, 10),
                    q: 100,
                    format: 'png'
                });
            }

            if (imageMogr === 'no-rotate') {
                fopArr.push({
                    'fop': 'imageMogr2',
                    'auto-orient': true,
                    'strip': true,
                    'rotate': 0,
                    'format': 'png'
                });
            }
        });

        var newUrl = Qiniu.pipeline(fopArr, key);

        var newImg = new Image();
        img.attr('src', 'loading.gif');
        newImg.onload = function() {
            img.attr('src', newUrl);
            img.parent('a').attr('href', newUrl);
        };
        newImg.src = newUrl;
        return false;
    });
*/
});
