<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="frm" method="get" action="write.sb">
		<input type="submit" id="btnWrite" value="글쓰기"/>
	</form>
<div id="bodywrap">
	<!-- 리스트 출력 -->
	<table>
		<tr>
			<th width="5%">번호</th>
			<th width="70%">제목</th>
			<th width="20%">글쓴이</th>
			<th width="15%">조회수</th>
		</tr>
		
		<c:forEach var="dto" items="${aList}">
			<tr>
				<td>${dto.num}</td>
				<td>
				<c:url var="content" value="view.sb">
					<c:param name="currentPage" value="${pv.currentPage}"/>
					<c:param name="num" value="${dto.num}"/>
				</c:url>
				<c:if test="${dto.re_level!=0}">
					<img src="images/level.gif" width="${20*dto.re_level}" height="15"/>
					<img src="images/re.gif" />
				</c:if><a href="${content}">${dto.subject}</a>	</td>
				<td>${dto.writer}</td>
				<td>${dto.readcount}</td>
				
			</tr>
		</c:forEach>
	</table>
	
	<!-- 이전 출력 시작 -->
	<c:if test="${pv.startPage>1}">
		<a href="list.sb?currentPage=${pv.startPage-pv.blockPage}">이전</a>
	</c:if>

	<!-- 페이지 출력 시작 -->
	<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
		<c:url var="currPage" value="list.sb">
			<c:param name="currentPage" value="${i}"/>
		</c:url>
		<a href="${currPage}"><c:out value="${i}"/></a>
	</c:forEach>
	
	<!-- 페이지 출력 끝 -->
	<c:if test="${pv.totalPage>pv.endPage}">
		<a href="list.sb?currentPage=${pv.startPage+pv.blockPage}">다음</a>
	</c:if>
<%-- 	
	<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}" step="1">
		<span>${i}</span>
	</c:forEach>
--%>
</div>
</body>
</html>