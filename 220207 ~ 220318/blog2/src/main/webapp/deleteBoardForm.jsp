<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//-----------------------------------boardOne 페이지에서 보낸 파라미터 값 변수에 저장
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
%>   
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteBoardForm</title>
</head>
<body>
	<h1>글삭제</h1>

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