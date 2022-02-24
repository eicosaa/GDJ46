<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertBoardForm</title>
<style>
	table, td {border : 1px solid #6B9900;}
</style>
</head>
<body>
	<!-- board 테이블에 board_title, board_content, board_pw 입력 폼 -->
	<h1> board 입력 폼 </h1>
	<!-- 
		form태그 사용 시
		1) post방식의 데이터 전송이 가능 (get도 사용 가능)
		2) 사용자에게 입력받은 데이터 전송 가능
		
		a태그 사용 시
		1) get방식만 허용
		2) 주소 뒤에 미리 입력된 데이터만 전송 가능
	 -->
	<form method="post" action="./insertBoardAction.jsp">
		<table>
			<tr>
				<td>boardTitle</td>
				<td>
					<input name="boardTitle" type="text">
				</td>
			</tr>
			<tr>
				<td>boardContent</td>
				<td>
					<textarea name="boardContent" rows="5" cols="80"></textarea>
				</td>
			</tr>
			<tr>
				<td>boardPw</td>
				<td>
					<input name="boardPw" type="password">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">board 입력</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>