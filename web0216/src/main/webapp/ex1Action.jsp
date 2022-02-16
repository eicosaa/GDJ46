<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 숫자 모양의 문자를 숫자로 변경 Integer.parseInt()
	// boolean모양의 문자를 boolean값으로 변경 Boolean.parseBoolean()
	boolean one = Boolean.parseBoolean(request.getParameter("one"));
	boolean two = Boolean.parseBoolean(request.getParameter("two"));
	boolean three = Boolean.parseBoolean(request.getParameter("three"));
	
	System.out.println(one + " <-- one");
	System.out.println(two + " <-- two");
	System.out.println(three + " <-- three");
%>