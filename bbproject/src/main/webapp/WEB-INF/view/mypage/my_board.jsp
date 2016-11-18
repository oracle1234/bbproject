<%@page contentType="text/html; charset=UTF-8"%>


	<div class="mypage_body">
	<div class="link">
	<a href="mypage.do">HOME</a> > <a href="mypage.do">마이페이지</a> > 내가 쓴 글
	</div>
		<div class="board_button">
		<input type="button" id="button_free" value="자유게시판">
		<input type="button" id="button_review" value="포토후기">
		<input type="button" id="button_qa" value="Q&A">
		</div>
		
		<table class="myboard_table">
		<tr>
				<th width="5%">번호</th>
				<th width="15%">분류</th>
				<th width="40%">제목</th>
				<th width="20%">작성일</th>
				<th width="10%">수정</th>
				<th width="10%">삭제</th>
			</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
		</table>
		<div class="myboard_write">
		<input type="button" id="button_write" value="글쓰기">
		</div>
		<div class="myboard_find">
		<input type="radio" name="board">제목
		<input type="radio" name="board">내용
		<input type="text" id="text_find" placeholder="검색">
		<input type="button" id="button_fint" value="검색">
		</div>
	</div>
