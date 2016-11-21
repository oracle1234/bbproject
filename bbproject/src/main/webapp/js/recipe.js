/**
 * 
 */

$(function() {
	
	$(".recipebox").mouseover(function() {
		$(".imgbox .recipe_img2", this).removeClass("recipe_out");
		$(".imgbox .recipe_img2", this).addClass("recipe_over");
	});

	$(".recipebox").mouseout(function() {
		$(".imgbox .recipe_img2", this).removeClass("recipe_over");
		$(".imgbox .recipe_img2", this).addClass("recipe_out");
	});

	var mySlider = $(".bxslider").bxSlider({
		mode : "horizontal", // 가로 수평으로 슬라이드 됩니다.
		speed : 500, // 이동 속도를 설정합니다.
		pager : false, // 현재 위치 페이징 표시 여부 설정.
		moveSlides : 1, // 슬라이드 이동시 갯수 설정.
		slideWidth : 500, // 슬라이드 마다 너비 설정.
		minSlides : 1, // 최소 노출 개수를 설정합니다.
		maxSlides : 1, // 최대 노출 개수를 설정합니다.
		slideMargin : 10, // 슬라이드간의 간격을 설정합니다.
		auto : true, // 자동으로 흐를지 설정합니다.
		autoHover : true, // 마우스 오버시 정시킬지 설정합니다.
		controls : false // 이전 다음 버튼 노출 여부 설정합니다.
	});
		
});

function themeTitle(theme_no) {
	switch (theme_no) {
	case "1":
		$("#list_title").text("영양식");
		break;
	case "2":
		$("#list_title").text("간식");
		break;
	case "3":
		$("#list_title").text("도시락");
		break;
	case "4":
		$("#list_title").text("다이어트");
		break;
	case "5":
		$("#list_title").text("야식");
		break;
	default:
		$("#list_title").text("RECIPE");
		break;
	}
}
	
	
	
	
	
	
