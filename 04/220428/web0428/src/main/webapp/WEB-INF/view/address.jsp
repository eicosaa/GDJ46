<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>address</title>
</head>
<body>
	<h1>상세 주소 입력 폼</h1>
	<form method = "post" action = "${ pageContext.request.contextPath }/SearchAddressController">
		<input type = "text" name = "searchAddr">
		<button type = "submit">주소검색</button>
	</form>
	<hr>
	
	<c:if test = "${ searchList != null }">
		<h2>검색결과</h2>
		<form method = "post" action = "${ pageContext.request.contextPath }/AddressController">
			<div>
				<select name = "id">
					<option value = "">::: 주소 선택 :::</option>
					<c:forEach var = "m" items = "${ searchList }">
						<option value = "${ m.id }"> ${ m.addr } </option>
					</c:forEach>
				</select>
			</div>
			<div>
				상세주소 : 
				<input type = "text" name = "detailAddr">
			</div>
				<button type = "submit">주소입력</button>
		</form>
	</c:if>
</body>
</html>