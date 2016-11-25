/**
 * 
 */

$(function() {
	/*퀵 메뉴*/
	if(member_no != ""){
		quick_left();
		$("#quick_menu").css("display", "block");
		var defaultTop = parseInt($("#quick_menu").css("top"));
		var bodyHeight = $("#mainbody").height();
		$(window).on("scroll resize", function() {
			var scv = $(window).scrollTop() + defaultTop;
			if(scv >= bodyHeight){
				scv = bodyHeight;
				if(scv <= 450){
					scv = 450;
				}
			}
			$("#quick_menu").stop().animate({
				top : scv + "px",
			}, 500);
			quick_left();
		});

		$.ajax({
			type : 'POST',
			dataType : 'json',
			url : 'lately.do',
			data : 'member_no='+member_no,
			success : function(data) {
				$(".quick_ul").empty();
				$.each(data, function(index, value) {
					$(".quick_ul").append('<li class="quick_li"><a href="#"><img class="quick_img" src="image.do?filename='+value.picture+'"><span>'+value.foods_name+'</span></a></li>');
				});
					
			},
			error: function(xhr, textStatus, error) {
				alert(error);
			}
		});
	}
});

function quick_left() {
	var wi = $(window).width();
	if(wi >= 1420){
		var a = (wi - 1350) / 2;
		var b = a + 1350 - 75;
		$("#quick_menu").css({
			left : b + "px"
		});
	}else{
		$("#quick_menu").css({
			left : 1310 + "px"
		});
	}
}
	
	
	
	
	
	
