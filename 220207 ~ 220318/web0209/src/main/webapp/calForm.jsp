<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calForm</title>
</head>
<body>
	<h1>간단한 5칙연산 정수 계산기</h1>
	<form method="post" action="./calAction.jsp">
		<input type=number name="x">
		<select name="op">
			<option value="">연산자를 선택하세요</option>
			<option value="add">+</option>
			<option value="sub">-</option>
			<option value="mul">*</option>
			<option value="div">/</option>	
			<option value="rest">%</option>
		</select>
		<input type=number name="y">
		<button type="submit">계산</button>
	</form>
	<!-- 
		이슈
		1. x, y, op 값 중 공백("")값이 넘어 갈 수도 있다.
		2. 숫자가 넘어가야하는데 숫자를 넘기는 방법은 존재하지 않는다. 글자만 넘긴다.
	 -->
</body>
</html>