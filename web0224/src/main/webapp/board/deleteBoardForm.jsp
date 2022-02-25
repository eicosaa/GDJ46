<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글삭제</h1>
	<!--
		액션으로 넘어가는 boardNo를 사용자가 수정하지 못하도록 하는 방법
		1) action="./deleteBoardAction.jsp?boardNo=값
		2) input type="hidden" name="boardNo" value=값
		3) input type="text" name="boardNo" readonly="readonly" value=값
	-->
	
	<form method="post" action="./deleteBoardAction.jsp">
		<input type="text" name="boardNo" value="<%=boardNo%>" readonly="readonly">
		<div>
			비밀번호 : 
			<input type="password" name="boardPw">
		</div>
		<div>
			<button type="submit">삭제</button>
		</div>
	</form>
</body>
</html>
