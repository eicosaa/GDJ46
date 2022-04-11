<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// -select option
	String[] opExpression = {"선택","달러", "엔화", "위안","파운드","유로"};
	
	// -인코딩
	request.setCharacterEncoding("utf-8");	
	// -요청값
	int won = 0;	
	if(request.getParameter("won") != null) { 
		won = Integer.parseInt(request.getParameter("won"));
	}	
	String opSelection = null;
	if(request.getParameter("operator") != null) { 
		opSelection = request.getParameter("operator");
	}	
	String result = null;
	if(request.getParameter("result") != null) { 
		result = request.getParameter("result");
	}	
	// -디버깅 코드
	System.out.println("[rateForm.jsp] won : " + won);
	System.out.println("[rateForm.jsp] opSelection : " + opSelection);
	System.out.println("[rateForm.jsp] result : " + result);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>rateForm</title>
</head>
<body>
	<form method="post" action="<%= request.getContextPath() %>/rateAction.jsp">
		<!-- 입력한 원화 -->
		<input name = "won" type = "number" value = <%= won %>> 
		
		<!-- 환전을 위한 선택 -->
		<select name="opSelection">
			<%
				for(String operator : opExpression) {
			%>
					<option value="<%= operator %>"><%= operator %></option>
			<%
				}
			%>
		</select>
		
		<!-- 선택에 의한 결과 -->
		<input name = "result" type = "number" value = <%= result %>>
		
		<input type = "submit" value = "입력">
		<!-- <input type = "reset" value = "다시 입력">  -->
		
	</form>
</body>
</html>