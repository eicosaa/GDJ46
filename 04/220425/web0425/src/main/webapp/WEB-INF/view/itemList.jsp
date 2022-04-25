<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>itemList</title>
</head>
<body>
	<div>
		<a href = "${ pageContext.request.contextPath }/cartListController">장바구니</a>
	</div>
	<h1>itemList</h1>
	<table border = "1">
		<tr>
			<th>id</th>
			<th>name</th>
			<th>price</th>
			<th>장바구니담기</th>
		</tr>
		<!-- for(Item item : request.getAttribute("list")) -->
		<c:forEach var = "item" items = "${ list }"> 
			<tr>
				<td>${ item.id }</td> <!-- item.getId() -->
				<td>${ item.name }</td>
				<td>${ item.price }</td>
				<th><a href = "${ pageContext.request.contextPath }/addCartController?id=${ item.id }&name=${ item.name }&price=${ item.price }">장바구니담기</a></th>
			</tr>
		</c:forEach>
	</table>
</body>
</html>