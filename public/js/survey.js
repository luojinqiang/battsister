
var survey_obj={
	survey_set_init:function(){
		//鼠标移上答案效果
		$('#survey_list .topic .answer .list').hover(function(){
			$(this).children('.opt').show();
		}, function(){
			$(this).children('.opt').hide();
		});
	}
};