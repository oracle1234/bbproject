<%@page contentType="text/html; charset=UTF-8"%>
<style>

.holder{
	float: left;
}

.holder_arr img{
	margin: 2px;
}

</style>

	<form id="foods_form" action="adminfoodsins.do" method="post"
		enctype="multipart/form-data">

		<div>
			<table>

				<tr>
					<th>반찬 구분</th>
					<td><select id="category_no" name="category_no">
							<option value="0">선택</option>
							<option value="1">요리</option>
							<option value="2">반찬</option>
							<option value="3">국, 찌개</option>
					</select>
				</tr>
				<tr>
					<th>반찬 이름</th>
					<td><input type="text" id="foods_name" name="foods_name" /></td>
				</tr>
				<tr>
					<th>반찬 가격</th>
					<td><input type="text" id="price"
						name="price" /></td>
				</tr>
				<tr>
					<th>반찬 무게</th>
					<td><input type="text" id="weight"
						name="weight" /></td>
				</tr>
				
				<tr>
					<th>반찬 보관방법</th>
					<td><input type="text" id="way"
						name="way" /></td>
				</tr>
				<tr>
					<th>반찬 유통기한</th>
					<td><input type="text" id="shelfLife"
						name="shelfLife" /></td>
				</tr>
				
				<tr>
					<th>반찬 설명</th>
					<td><textarea rows="5" cols="30" form="foods_form"
							id="foods_explaination" name="foods_explaination"></textarea></td>
				</tr>
				
				<tr>
					<th>반찬 재료설명</th>
					<td>
					<textarea rows="5" cols="30" form="foods_form"
							id="foods_material" name="foods_material"></textarea>
					</td>
				</tr>
				<tr>
					<th>반찬 사진</th>
					<td>
						<div class="holder"></div>
						<input type="file" name="foods_file" class="upload" /> 
					</td>
				</tr>

			</table>
		</div>

		<input type="submit" value="등록">

	</form>

