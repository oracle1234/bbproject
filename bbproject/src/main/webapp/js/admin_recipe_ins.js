/**
 * 
 */

$(function() {

	$("#btn_order")
			.on(
					"click",
					function() {
						$("#add_order")
								.append(
										"<tr><td><div class='holder'></div><input type='file' name='order_file'"
												+ " class='upload'/> <textarea class='order_text' name='order_text' "
												+ "placeholder='조리 순서'></textarea></td></tr>");
					});

	$(document).on("change", ".upload", function() {
		imgOne(this);
	});

	$(document).on("change", "#complete_file", function() {
		imgArr(this);
	});

	// $("#recipe_form").submit(function(){

	// if($("#theme_no").val() == 0){
	// alert("테마를 선택해 주세요");
	// return false;
	// }else if($("#recipe_name").val().trim() == ""){
	// alert("레시피 이름을 입력해 주세요.");
	// return false;
	// }else if($("#recipe_material").val().trim() == ""){
	// alert("레시피 재료을 입력해 주세요.");
	// return false;
	// }else if($("#recipe_explaination").val().trim() == ""){
	// alert("레시피 설명을 입력해 주세요.");
	// return false;
	// }else if($("#recipe_time").val().trim() == ""){
	// alert("조리시간을 입력해 주세요.");
	// return false;
	// }else if($("#difficulty").val().trim() == ""){
	// alert("조리 난이도를 입력해 주세요.");
	// return false;
	// }else if($("#portion").val().trim() == ""){
	// alert("인원을 입력해 주세요.");
	// return false;
	// }else if($(".order_text").length > 0){
	// $(".order_text").each(function(index, value) {
	// if($(value).val().trim() == ""){
	// alert("조리 내용을 입력해 주세요.");
	// return false;
	// }
	// });
	// } else if($(".upload").length > 0){
	// $.each($(".upload"), function(index, value) {
	// if($(value)[0].files[0] == undefined){
	// alert("조리 사진을 올려주세요.");
	// return false;
	// }
	// });
	// }else if($("#complete_file")[0].files.length <= 0){
	// alert("음식 사진을 올려주세요");
	// return false;
	// }

	// return false;
	// });

});

function imgOne(input) {
	var file = input.files[0];

	if (file == undefined) {
		$(input).prev().empty();
		return false;
	}

	if (!/\.(jpe?g|png|gif|jpg)$/i.test(file.name)) {
		alert("이미지 파일을 넣어주세요.");
		$(input).val("");
		return false;
	}

	var reader = new FileReader();
	reader.onload = function(event) {
		var img = new Image();
		img.src = event.target.result;
		if (img.width > 100) {
			img.width = 100;
		}
		$(input).prev().empty();
		$(input).prev().append(img);
	};
	reader.readAsDataURL(file);
	return false;
}

function imgArr(input) {
	var file = input.files;

	if (file.length == 0) {
		$(input).next().empty();
		return false;
	} else {
		$(input).next().empty();
	}

	for (var i = 0; i < file.length; i++) {
		if (!/\.(jpe?g|png|gif|jpg)$/i.test(file[i].name)) {
			alert("이미지 파일을 넣어주세요.");
			$(input).val("");
			return false;
		}
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = new Image();
			img.src = event.target.result;
			if (img.width > 100) {
				img.width = 100;
			}
			$(input).next().append(img);
		};
		reader.readAsDataURL(file[i]);
	}

	return false;
}
