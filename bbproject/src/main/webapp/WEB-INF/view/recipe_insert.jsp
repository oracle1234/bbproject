<%@page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<style>
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function() {

		$("#btn_order")
				.on(
						"click",
						function() {

							$("#add_order")
									.append(
											"<tr><td><input type='file' name='order_file'"+
					"/> <textarea name='order_text'"
					+"class='form-control step_cont' placeholder='워 둡니다.'></textarea></td>"
													+ "</tr>");

						});

	});
</script>

</head>
<body>

	<form id="recipe_form" action="recipeins.do" method="post"
		enctype="multipart/form-data">

		<div>
			<table>

				<tr>
					<th>테마 구분</th>
					<td><select name="theme_no">
							<option value="0">선택</option>
							<option value="1">영양식</option>
							<option value="2">간식</option>
							<option value="3">도시락</option>
							<option value="4">다이어트</option>
							<option value="5">야식</option>
					</select>
				</tr>
				<tr>
					<th>레시피 이름</th>
					<td><input type="text" id="recipe_name" name="recipe_name" /></td>
				</tr>
				<tr>
					<th>레시피 재료</th>
					<td><input type="text" id="recipe_material"
						name="recipe_material" /></td>
				</tr>
				<tr>
					<th>레시피 설명</th>
					<td><textarea rows="5" cols="30" form="recipe_form"
							name="recipe_explaination"></textarea></td>
				</tr>
				<tr>
					<th>조리시간</th>
					<td><input type="text" id="recipe_time" name="recipe_time" /></td>
				</tr>
				<tr>
					<th>조리 난이도</th>
					<td><input type="text" id="difficulty" name="difficulty" /></td>
				</tr>
				<tr>
					<th>인원</th>
					<td><input type="text" id="portion" name="portion" /></td>
				</tr>
				<tbody id="add_order">
					<tr>
						<th rowspan="10" width="100">레시피 순서</th>
						<td><input type="file" name="order_file" />
							<textarea name="order_text" class="form-control step_cont"
								placeholder="워 둡니다."></textarea></td>
					</tr>
				</tbody>

				<tr>
					<th></th>
					<td><input id="btn_order" type="button" value="+"></td>
				</tr>

				<tr>
					<th>레시피 완성 사진</th>
					<td><input type="file" id="complete_file" name="complete_file"
						multiple="multiple" /></td>
				</tr>
			</table>
		</div>

		<input type="submit" value="등록">

	</form>
</body>
</html>



