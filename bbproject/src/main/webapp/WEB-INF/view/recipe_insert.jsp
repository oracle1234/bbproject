<%@page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<style>

table {
	width: 900px;
}

</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function() {
	});
</script>

</head>
<body>

	<form id="recipe_form" action="/recipe_ins.do" method="post"
		enctype="multipart/form-data">

		<div>
			<table>
				<tr>
					<th>테마 구분</th>
					<td><select name="theme">
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
					<td><input type="text" id="recipe_name" name="recipe_name" /></td>
				</tr>
				<tr>
					<th>레시피 설명</th>
					<td><textarea rows="5" cols="50" form="recipe_form"
							name="explan"></textarea></td>
				</tr>
				<tr>
					<th>조리시간</th>
					<td><input type="text" id="recipe_name" name="recipe_name" /></td>
				</tr>
				<tr>
					<th>조리 난이도</th>
					<td><input type="text" id="recipe_name" name="recipe_name" /></td>
				</tr>
				<tr>
					<th>인원</th>
					<td><input type="text" id="recipe_name" name="recipe_name" /></td>
				</tr>
				<tr>
					<th>레시피 사진</th>
					<td><input type="file" id="recipe_files" name="recipe_files[]"
						multiple="multiple" /></td>
				</tr>
			</table>
		</div>

	</form>
</body>
</html>



