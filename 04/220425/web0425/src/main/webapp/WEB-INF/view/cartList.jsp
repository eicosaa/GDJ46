<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cartList</title>
</head>
<body>
	<h1>장바구니 리스트 cartList</h1>
	<div>${ cartList }</div>
	<table border = "1">
		<tr>
			<th>id</th>
			<th>name</th>
			<th>price</th>
			<th>삭제</th>
		</tr>
		
		<!-- for(Item item : request.getAttribute("list")) -->
		<c:forEach var = "item" items = "${ cartList }"> 
			<tr>
				<td>${ item.id }</td> <!-- item.getId() -->
				<td>${ item.name }</td>
				<td>${ item.price }</td>
				<th>
					<a href = "${ pageContext.request.contextPath }/removeCartController?id=${ item.id }">삭제</a>
				</th>
			</tr>
		</c:forEach>
	</table>
</body>
</html>