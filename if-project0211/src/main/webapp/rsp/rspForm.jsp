<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = "";
	if(request.getParameter("msg") != null) {
		msg = request.getParameter("msg");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rspForm</title>
</head>
<body>
	<h1>가위바위보 게임</h1>
	<!-- 유효성 메세지 출력 공간 -->
	<div>
		<%= msg %>
	</div>
	<form method = "post" action = "./rspAction.jsp">
		<fieldset>
			<legend>[가위 / 바위 / 보] 중 하나를 선택하세요</legend>
			<select name = "userRsp">
				<option value = ""> 선택하세요 </option>
				<option value = "가위"> 가위 </option>
				<option value = "바위"> 바위 </option>
				<option value = "보"> 보 </option>
			</select>
		</fieldset>
		<button type = "submit"> play </button>
	</form>
</body>
</html>