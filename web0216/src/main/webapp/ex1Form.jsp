<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex1Form</title>
</head>
<body>
	<!-- form 태그를 사용하여 boolean 값 넘기기 -->
	<!-- 문자열만 넘어간다. 모양이 같은 문자열을 넘겨서 형 변경 -->
	<form method="post" action="./ex1Action.jsp">
		논리값 1 : <input type="text" name="one"> <br>
		논리값 2 :
		<input type="radio" value="true" name="two"> O 
		<input type="radio" value="false" name="two"> X <br>
		논리값 3 : 
		<select name="three">
			<option value="true"> O </option>
			<option value="false"> X </option>
		</select>
		<br>
		<button type="submit">논리값 전송</button>
	</form>

</body>
</html>