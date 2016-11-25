/**
 * 
 */

$(function() {
	
	/*퀵 메뉴*/
	if(member_no != ""){
		$("#quick_menu").css("display", "block");
		var defaultTop = parseInt($("#quick_menu").css("top"));
		var defaultRigth = parseInt($("#quick_menu").css("right"));
		$(window).on("scroll", function() {
			var scv = $(window).scrollTop();
			var sb = $(window).scrollLeft();

			$("#quick_menu").stop().animate({
				top : scv + defaultTop + "px",
				right : defaultRigth - sb + "px"
			}, 500);
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
	
	
	
	
	
	
