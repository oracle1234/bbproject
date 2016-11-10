$(function() {
	/* 로그인 버튼 */
	$(".login_wrap>a").on("click", function() {
		$("#login_f").animate({
			top : "20px"
		}, 500);
		return false;
	});

	$(".login_wrap .login_close_btn, input[alt='로그인버튼']").on("click",
			function() {
				$("#login_f").animate({
					top : "-500px"
				}, 500);
				// $("#login_f").css({'display':'none'});
				return false;
			});

	$("#user_id, #user_pw").on("focus", function() {
		$(this).prev().css("left", "-9999px");
	});

	$("#user_id, #user_pw").on("blur", function() {
		if ($(this).val() == "")
			$(this).prev().css("left", "2px");
	});

	/* zoom 버튼 */
	var base = 100;
	var mybody = $("body");
	$("#zoom a").on(
			"click",
			function() {
				var zNum = $("#zoom a").index(this); // 클릭한 <a>의 인덱스 반환
				if (zNum == 0) {// 확대
					base += 10;
				} else if (zNum == 1) {// 100%
					base = 100;
				} else {// 축소
					base -= 10;
				}
				mybody.css("overflow-x", "auto").css("transform-origin", "0 0")
						.css("transform", "scale(" + base / 100 + ")").css(
								"zoom", base + "%");

				return false; // 클릭한 <a>의 이동을 막습니다.
			});

	/* 인쇄 버튼 */
	$(".print_btn").on("click", function() {
		window.print();
		return false;
	});

	/* 검색 창 안내 가이드 */
	$("#keyword").on("focus", function() {// 포커스 발생했을 때
		$(this).css("background-position", "0 -500px");
	}).on("blur", function() {// 포커스 아웃되었을 때
		if ($(this).val() == "")
			$(this).css("background-position", "0 0");
	});

	/* GNB 메뉴 */
	var beforeEl;
	$("#gnb>li>a").on(
			"mouseover focus",
			function() {
				if (beforeEl)
					beforeEl.children("img").attr(
							"src",
							beforeEl.children("img").attr("src").replace(
									"over.gif", "out.gif"));
				
				$("#gnb ul:visible").slideUp("fast");

				$("img", this).attr(
						"src",
						$("img", this).attr("src").replace("out.gif",
								"over.gif"));

				$(this).next().stop().slideDown("normal");
				beforeEl = $(this);
			});
	$("#gnb").on(
			"mouseleave",
			function() {
				$("#gnb ul:visible").slideUp("fast");

				if (beforeEl)
					beforeEl.children("img").attr(
							"src",
							beforeEl.children("img").attr("src").replace(
									"over.gif", "out.gif"));
			});
	
	 /*전체메뉴*/
	 /* $("#total_btn a").on("click",function(){
	   $("#total_menu").slideDown("normal");

	   $("img",this).attr("src",$("img",this).attr("src").replace("out.gif","over.gif"));
	   return false;
	  });*/
	  
	  $('#total_close').on('click',function(){
		  $("#total_menu").slideUp("normal");
		  
		  $("img",'#total_btn a').attr("src",$("img",'#total_btn a').attr("src").replace("over.gif","out.gif"));
		   return false;
	  });
	  var menu=true;
	  $("#total_btn a").on("click",function(){
		  if(menu){
		  $("#total_menu").slideDown("normal");

		  $("img",this).attr("src",$("img",this).attr("src").replace("out.gif","over.gif"));
		  menu=false;
		   return false;
		  }else{
			  $("#total_menu").slideUp("normal");

			  $("img",this).attr("src",$("img",this).attr("src").replace("over.gif","out.gif"));
			  menu=true;
			  return false;
		  }		  
		  
	  });

});