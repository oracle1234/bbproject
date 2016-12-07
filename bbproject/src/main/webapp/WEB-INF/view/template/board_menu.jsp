<%@page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	$(".board").bind("mouseover", function(){
		$(this).attr("src", "./images/board_board2.png")
		}); 
	$(".board").bind("mouseout", function(){
		$(this).attr("src", "./images/board_board.png")
		}); 
	
	$(".qa").bind("mouseover", function(){
		$(this).attr("src", "./images/board_qa2.png")
		}); 
	$(".qa").bind("mouseout", function(){
		$(this).attr("src", "./images/board_qa.png")
		}); 
	
	$(".photo").bind("mouseover", function(){
		$(this).attr("src", "./images/board_photo2.png")
		}); 
	$(".photo").bind("mouseout", function(){
		$(this).attr("src", "./images/board_photo.png")
		}); 

});
</script>
<div class="menubar">
	<div class="menu_title">
		<img alt="" src="./images/menubar_board.png">
	</div>
	<ul class="detailmenu">
		<li><a href="board_list.do"><img class="board"
				src="./images/board_board.png"></a></li>
		<li><a href="qa_list.do"><img class="qa"
				src="./images/board_qa.png"></a></li>
		<li><a href="photo_list.do"><img class="photo"
				src="./images/board_photo.png"></a></li>
	</ul>
</div>
