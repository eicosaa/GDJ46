<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// -인코딩
	request.setCharacterEncoding("utf-8");	

	// -요청값
	int won = Integer.parseInt(request.getParameter("won"));		
	String operator = request.getParameter("opSelection");
	
	// -디버깅코드
	System.out.println("[rateAction.jsp] won : " + won);
	System.out.println("[rateAction.jsp] operator : " + operator);
	
	String result = null;
	final float USD_RATE = 1124.70F;
	final float JPY_RATE = 10.113F;
	final float CNY_RATE = 163.30F;
	final float GBP_RATE = 1444.35F;
	final float EUR_RATE = 1295.97F;
	
	// -select값에 따른 result값(환전 계산 결과) 처리
	if(operator.equals("달러")){
		result = String.format("%.6f", won / USD_RATE);
	} else if(operator.equals("엔화")){
		result = String.format("%.6f", won / JPY_RATE);
	} else if(operator.equals("위안")){
		result = String.format("%.6f", won / CNY_RATE);
	} else if(operator.equals("파운드")) {
		result = String.format("%.6f", won / GBP_RATE);
	} else if(operator.equals("유로")) {
		result = String.format("%.6f", won / EUR_RATE);
	}
	
	// -디버깅코드
	System.out.println("[rateAction.jsp] result : " + result);
	
	// -값을 넘기기 위해서 한글값 인코딩
	operator = URLEncoder.encode(operator,"utf-8");
	// -Action 처리 후 값과 함께 Form페이지로 넘어가기
	response.sendRedirect(request.getContextPath()+"/rateForm.jsp?won=" + won + "&operator=" + operator + "&result=" + result);
%>