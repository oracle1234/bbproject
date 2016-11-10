/**
 * 
 */
// header
$(function() {

	/* GNB 메뉴 */
	$("#util_menu #menu_main #gnb>li:last").css({
		"border-right" : "1px solid orange"
	});
	$("#util_menu #menu_main #gnb li ul li:last-child").css({
		"border-right" : "0px"
	});

	$("#gnb>li>a").on("mouseover focus", function() {
		$("#gnb ul:visible").slideUp(10);
		$(this).next().stop().slideDown("normal");

		var list = $(this).next();
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

// footer
$(function() {
	$('.aa').click(function() {
		alert('coming soon!')
	});
	$('#face').click(function() {

		window.open("http://www.facebook.com");
	});
	$('#twit').click(function() {
		window.open("http://www.twitter.com");
	});

});
// main
$(function() {

	var mySlider = $("#main_banner").bxSlider({
		mode : "horizontal", // 가로 수평으로 슬라이드 됩니다.
		speed : 500, // 이동 속도를 설정합니다.
		pager : false, // 현재 위치 페이징 표시 여부 설정.
		moveSlides : 1, // 슬라이드 이동시 갯수 설정.
		slideWidth : 540, // 슬라이드 마다 너비 설정.
		minSlides : 1, // 최소 노출 개수를 설정합니다.
		maxSlides : 1, // 최대 노출 개수를 설정합니다.
		slideMargin : 10, // 슬라이드간의 간격을 설정합니다.
		auto : true, // 자동으로 흐를지 설정합니다.
		autoHover : true, // 마우스 오버시 정시킬지 설정합니다.
		controls : false
	// 이전 다음 버튼 노출 여부 설정합니다.
	});
	// 이전 버튼을 클릭하면 이전 슬라이드로 전환됩니다.
	$("#prevBtn").on("click", function() {
		mySlider.goToPrevSlide(); // 이전 슬라이드 배너로 이동됩니다.
		return false; // <a>에 링크를 차단합니다.
	});
	// 다음 버튼을 클릭하면 다음 슬라이드로 전환됩니다.
	$("#nextBtn").on("click", function() {
		mySlider.goToNextSlide(); // 다음 슬라이드 배너로 이동됩니다.
		return false;
	});

	var mySlider2 = $("#sponsor_banner").bxSlider({
		mode : "horizontal", // 가로 수평으로 슬라이드 됩니다.
		speed : 500, // 이동 속도를 설정합니다.
		pager : false, // 현재 위치 페이징 표시 여부 설정.
		moveSlides : 1, // 슬라이드 이동시 갯수 설정.
		slideWidth : 190, // 슬라이드 마다 너비 설정.
		minSlides : 5, // 최소 노출 개수를 설정합니다.
		maxSlides : 5, // 최대 노출 개수를 설정합니다.
		slideMargin : 10, // 슬라이드간의 간격을 설정합니다.
		auto : true, // 자동으로 흐를지 설정합니다.
		autoHover : true, // 마우스 오버시 정시킬지 설정합니다.
		controls : false
	// 이전 다음 버튼 노출 여부 설정합니다.
	});

	var width1 = 554; // 큰 div 너비
	var width2 = 447; // 작은 div 너비
	var width3 = 447; // 작은 div 너비
	var height1 = 504; // 큰 div 높이
	var height2 = 302; // 작은 div 높이
	var height3 = 202; // 작은 div 높이

	var pos1 = 0; // 위치저장

	// 크기저장
	var size = function() {
		for (var i = 0; i < 3; i++) {
			switch (i) {
			case 0:
				height1 = $(".mainWrap").eq(i).height();
				width1 = $(".mainWrap").eq(i).width();
				break;
			case 1:
				height2 = $(".mainWrap").eq(i).height();
				width2 = $(".mainWrap").eq(i).width();
				break;
			case 2:
				height3 = $(".mainWrap").eq(i).height();
				width3 = $(".mainWrap").eq(i).width();
				break;
			}
		}
	}
	// 처음에 모든 div에 버튼 추가
	var btn_show = function() {
		for (var i = 0; i < 3; i++) {
			$(".mainWrap").eq(i).append(
					"<a href='#' class='zoom_btn' id='zoom_btn" + i
							+ "'><img src='images/btn_zoom_L.png'/></a>")
		}
	}

	// div중 가장 넓은 div의 버튼 숨김
	var btn_hide = function() {
		for (var i = 0; i < 3; i++) {
			if ($(".mainWrap").eq(i).width() == width1)
				$(".mainWrap .zoom_btn").eq(i).css({
					'display' : 'none'
				});
		}
	}

	btn_show();
	btn_hide();

	$("#mainwrap1 .bx-viewport").css({
		"border-width" : "5px"
	});

	$('#zoom_btn0').click(function() {
		size();
		var index_btn = $(this).parents().index(".mainWrap"); // 선택한 버튼의 부모
		// 인덱스
		if (pos1 == 1) {
			// 키울거
			$("#main_banner li img").removeClass('small1');
			$("#main_banner li img").removeClass('small2');
			$(".mainWrap").eq(index_btn).animate({
				left : 0,
				top : 0,
				width : width2 + 'px',
				height : height2 + 'px'
			});
			$("#mainwrap1 .bx-viewport").css({
				"height" : 506 + 'px'
			});

			// 줄일거
			if (height1 == 202) {
				$("#mainwrap2").animate({
					left : width2 + 'px',
					top : 302 + 'px',
					width : width1 + 'px',
					height : height1 + 'px'
				});
			} else {
				$("#mainwrap2").animate({
					left : width2 + 'px',
					top : 0,
					width : width1 + 'px',
					height : height1 + 'px'
				});
			}
			pos1 = 0;

		}

		if (pos1 == 2) {
			// 키울거
			$("#main_banner li img").removeClass('small1');
			$("#main_banner li img").removeClass('small2');
			$(".mainWrap").eq(index_btn).animate({
				left : 0,
				top : 0,
				width : width3 + 'px',
				height : height3 + 'px'
			});
			$("#mainwrap1 .bx-viewport").css({
				// "margin" : "auto",
				// "width" : "100%",
				"height" : 506 + 'px'
			});

			// 줄일거
			if (height1 == 202) {
				$("#mainwrap3").animate({
					left : width3 + 'px',
					top : 302 + 'px',
					width : width1 + 'px',
					height : height1 + 'px'
				});
			} else {
				$("#mainwrap3").animate({
					left : width3 + 'px',
					top : 0,
					width : width1 + 'px',
					height : height1 + 'px'
				});
			}

			pos1 = 0;
		}

		// div 위치, 크기 변화 후 버튼 삭제, 생성
		$(".mainWrap .zoom_btn").css({
			'display' : 'block'
		});
		$(".mainWrap:eq(" + index_btn + ") #zoom_btn" + index_btn).css({
			'display' : 'none'
		});

	});// end #zoom_btn0

	$('#zoom_btn1').on('click', function() {

		size();

		var index_btn = $(this).parents().index(".mainWrap"); // 선택한 버튼의 부모
		// 인덱스
		if (pos1 == 0) {
			size();
			// 키울거
			$("#main_banner li img").removeClass('small1');
			$("#main_banner li img").removeClass('small2');
			$(".mainWrap").eq(index_btn).animate({
				left : 0,
				top : 0,
				width : width1 + 'px',
				height : height1 + 'px'
			});
			$("#mainwrap1 .bx-viewport").css({
				"height" : 506 + 'px'
			});

			// 줄일거
			if (height2 == 202) {
				$("#mainwrap1").animate({
					left : width1 + 'px',
					top : 302 + 'px',
					width : width2 + 'px',
					height : height2 + 'px'
				});
				$("#main_banner li img").addClass('small1');
				$("#mainwrap1 .bx-viewport").css({
					"height" : 182 + "px"
				});
			} else {
				$("#mainwrap1").animate({
					left : width1 + 'px',
					top : 0,
					width : width2 + 'px',
					height : height2 + 'px'
				});
				$("#main_banner li img").addClass('small2');
				$("#mainwrap1 .bx-viewport").css({
					"height" : 290 + "px",
					"width" : "98.8%",
				});
			}
			pos1 = 1;
		}

		if (pos1 == 2) {
			size();
			// 키울거
			$(".mainWrap").eq(index_btn).animate({
				left : 0,
				top : 0,
				width : width3 + 'px',
				height : height3 + 'px'
			});

			// 줄일거
			if (height2 == 202) {
				$("#mainwrap3").animate({
					left : width3 + 'px',
					top : 302 + 'px',
					width : width2 + 'px',
					height : height2 + 'px'
				});
			} else {
				$("#mainwrap3").animate({
					left : width3 + 'px',
					top : 0,
					width : width2 + 'px',
					height : height2 + 'px'
				});
			}
			pos1 = 1;
		}

		// div 위치, 크기 변화 후 버튼 삭제, 생성
		$(".mainWrap .zoom_btn").css({
			'display' : 'block'
		});
		$(".mainWrap:eq(" + index_btn + ") #zoom_btn" + index_btn).css({
			'display' : 'none'
		});

	}); // end #zoom_btn1

	$('#zoom_btn2').click(function() {

		size();
		var index_btn = $(this).parents().index(".mainWrap"); // 선택한 버튼의 부모
		// 인덱스
		if (pos1 == 0) {
			size();
			// 키울거
			$("#main_banner li img").removeClass('small1');
			$("#main_banner li img").removeClass('small2');
			$(".mainWrap").eq(index_btn).animate({
				left : 0,
				top : 0,
				width : width1 + 'px',
				height : height1 + 'px'
			});
			$("#mainwrap1 .bx-viewport").css({
				"height" : 506 + 'px'
			});

			// 줄일거
			if (height3 == 202) {
				$("#mainwrap1").animate({
					left : width1 + 'px',
					top : 302 + 'px',
					width : width3 + 'px',
					height : height3 + 'px'
				});
				$("#main_banner li img").addClass('small1');
				$("#mainwrap1 .bx-viewport").css({
					"height" : 182 + "px"
				});
			} else {
				$("#mainwrap1").animate({
					left : width1 + 'px',
					top : 0,
					width : width3 + 'px',
					height : height3 + 'px'
				});
				$("#main_banner li img").addClass('small2');
				$("#mainwrap1 .bx-viewport").css({
					"height" : 290 + "px"
				});
			}
			pos1 = 2;
		}

		if (pos1 == 1) {
			size();
			// 키울거
			$(".mainWrap").eq(index_btn).animate({
				left : 0,
				top : 0,
				width : width2 + 'px',
				height : height2 + 'px'
			});

			// 줄일거
			if (height3 == 202) {
				$("#mainwrap2").animate({
					left : width2 + 'px',
					top : 302 + 'px',
					width : width3 + 'px',
					height : height3 + 'px'
				});
			} else {
				$("#mainwrap2").animate({
					left : width2 + 'px',
					top : 0,
					width : width3 + 'px',
					height : height3 + 'px'
				});
			}
			pos1 = 2;
		}

		// div 위치, 크기 변화 후 버튼 삭제, 생성
		$(".mainWrap .zoom_btn").css({
			'display' : 'block'
		});
		$(".mainWrap:eq(" + index_btn + ") #zoom_btn" + index_btn).css({
			'display' : 'none'
		});
	}); // end #zoom_btn2

});
