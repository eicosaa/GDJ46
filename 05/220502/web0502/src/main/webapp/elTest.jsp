<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// servlet 포워딩 되는 데이터
	request.setAttribute("reqName", "자바1");
	session.setAttribute("sessName", "자바2");
	application.setAttribute("appName", "자바3");
	User pageU = new User();
	pageU.setId("guest");
	pageU.setPw("1234");
	request.setAttribute("reqU", pageU);
	
	ArrayList<String> list = new ArrayList<>();
	
	HashMap<String, Object> map1 = new HashMap<>();
	map1.put("1번", "김유진");
	HashMap<String, Object> map2 = new HashMap<>();
	map2.put("2번", "김득환");
	list.add(map1); list.add(map2);
	request.setAttribute("list", list);
%>
	
	<c:set var = "y" value = "10"></c:set>
	
	<h1>EL and JSTL Core</h1>
	
	y : ${ y }
	
	<div>${ list == null }</div>
	<div>${ list.size() == 0 }</div>
	
	<div>${ list[1]["2번"] }</div>
	
	<div>${ empty list }</div>
	
	<div>${ param.key }</div>
	
	<!-- <div>${ u.id }</div> u.getId() -->
	<div>${ pageU.getId() }</div>
	<div>${ reqU.getPw() }</div>
	
	<div>${ reqName }</div>
	<div>${ sessName }</div>
	<div>${ appName }</div>
	
	${ 'abc' }
	NULL : ${ null == null }
	<div>${ 10 + 1 }</div>
	<div>${ 10 / 3 }</div>
	<div>${ 10 % 3 }</div>
	<div>${ 10 > 3 }</div>
	<div>${ true || false }</div>
	<div>${ x == null }</div>
	<div>${ empty x }</div>
	<div>${ empty "" }</div>
	<div>${ empty 0 }</div>
</body>
</html>