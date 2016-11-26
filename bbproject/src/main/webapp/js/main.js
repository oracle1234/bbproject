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
	
	/* GNB 메뉴 */
	$("#util_menu #menu_main #gnb>li:last").css({
		"border-right" : "1px solid orange"
	});
//	$("#util_menu #menu_main #gnb li ul li:last-child").css({
//		"border-right" : "0px"
//	});

	$("#gnb>li").on("mouseover focus", function() {
		$("#gnb ul:visible").slideUp(10);
		$(this).children().next().stop().slideDown("normal");

		var list = $(this).children().next();
		if ($("li", list).size() <= 3) {
			$("li:last-child", list).css({
				"border-right" : "1px solid orange"
			});
		}
	});
	$("#gnb").on("mouseleave", function() {
		$("#gnb ul:visible").slideUp(10);
	});

	$("#login_btn").click(function() {
		if ($("#login_f").is(":visible")) {
			$("#login_f").fadeOut(100);
		} else {
			$("#login_f").fadeIn(1000);
		}
		return false;
	});

	$("#loginBtn").click(function() {
		$("#login_f").fadeOut(100);
		return false;
	});
	
	
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
	
	
	
	
	
	
