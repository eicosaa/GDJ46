<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// getParameterValues -> String[](배열)로 넘어온다. 
	String[] hobby = request.getParameterValues("hobby");
	String[] sn =request.getParameterValues("sn"); // text는 공백이 넘어 올 수 있다.
	if(hobby==null || hobby.length == 0) { // 선택을 하지 않았을 때 Form 페이지로 넘어간다
		response.sendRedirect("./ex9Form.jsp?errorCode=zeroHobby");
		return;
	}
	for(String s : sn) {
		if(s.equals("")) {
			response.sendRedirect("./ex9Form.jsp?errorCode=blanksn");
			return;
		}
	}
	
	for(String h : hobby) {
		System.out.println(h);
	}
	
	for(String s : sn) {
		System.out.println(s);
	}
%>