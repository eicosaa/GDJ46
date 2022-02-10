<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String errorCode = request.getParameter("errorCode");
	String errorMsg = "";
	if(errorCode.equals("999")) {
		errorMsg = "점수 관련 에러입니다. [에러코드 : " + errorCode + "]";
	} else if(errorCode.equals("888")) {
		errorMsg = "이름을 입력하세요. [에러코드 : " + errorCode + "]";
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error</title>
</head>
<body>
	<h1>error page</h1>
	<div>
		<!-- 에러 코드 : <%=request.getParameter("errorCode") %> -->
		<%=errorMsg %>
	</div>
</body>
</html>