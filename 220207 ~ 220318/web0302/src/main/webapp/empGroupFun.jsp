<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.HashMap" %>
<%
	// -비즈니스 코드 (서비스단)

	// -오라클 드라이버 로딩 + 오라클 RDBMS 접속
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
	System.out.println("empGroupFun.jsp 드라이버 로딩 성공");
	
	// -쿼리
	/*
		String sql = "select count(*) cntVal, 
							 sum(sal) sumVal, 
							 round(avg(sal), 2) avgVal // -round : 반올림 (-> avg(sal)의 소수점을 2번째자리까지 반올림)
							 median(sal) medianVal, 
							 max(sal) maxVal, 
							 min(sal) minVal 
					  from emp";
	*/
	// rs.getInt(count(*)); <-- 실제 테이블의 컬럼명이 아니다. 인라인뷰의 select절의 컬럼명 or 별칭
	
	// -쿼리 - alias 사용시
	String sql = "select count(*) cntVal, sum(sal) sumVal, round(avg(sal), 2) avgVal, median(sal) medianVal, max(sal) maxVal, min(sal) minVal from emp";
	// rs.getInt("cnt"); alias명을 사용
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();	
	/*
	int cntVal = 0; // -결과값을 저장할 변수 생성 및 초기화
	int sumVal = 0;
	double avgVal = 0;
	double medianVal = 0;
	int maxVal = 0;
	int minVal = 0;
	if(rs.next()) { // -결과값을 변수에 저장
		cntVal = rs.getInt("cntVal");
		sumVal = rs.getInt("sumVal");
		avgVal = rs.getDouble("avgVal");
		medianVal = rs.getDouble("medianVal");
		maxVal = rs.getInt("maxVal");
		minVal = rs.getInt("minVal");
	}
	*/
	// 만약(FM) 서비스단과 뷰단의 파일이 분리 -> 뷰단으로 넘겨져야 하는 변수가 6개 -> 묶어서 보내자 -> VO 필요
	// 이런 경우 매번 새로운 VO타입을 만들어야 하는가? -> 자바 기본 API에서 Map타입 제공(1회용 VO라고 생각하자)
	// 하나의 변수로 6개의 넘김 <- 이 변수를 "모델"이라고 한다. -코드에서 내가 궁극적으로 얻고자 하는 값 : 모델
	HashMap<String, Object> map = new HashMap<String, Object>();
	if(rs.next()) { // -next() : 문자 혹은 문자열을 공백 기준으로 한 단어 또는 한 문자씩 입력받음 
		map.put("cntVal", rs.getInt("cntVal")); // map.put("키 이름", 값);
		map.put("sumVal", rs.getInt("sumVal"));
		map.put("avgVal", rs.getDouble("avgVal"));
		map.put("medianVal", rs.getDouble("medianVal"));
		map.put("maxVal", rs.getInt("maxVal"));
		map.put("minVal", rs.getInt("minVal"));
	}
	// 1) VO타입을 사용하지 않았을 때
	// 2) VO타입을 만들어서 사용했을 때
	// 3) VO타입 대신 Map타입을 사용했을 때

	// 여기까지 서비스(로직)단

	// 아래 코드가 뷰(출력)단-----------------------------------------------
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>empGroupFun</title>
</head>
<body>
	<!-- -비즈니스 코드(서비스단)를 출력하는 뷰 코드(뷰단) -->
	<div>전체 행의 수 : <%= map.get("cntVal") %></div> 
	<div>급여 합계 : <%= map.get("sumVal") %></div> 
	<div>급여 평균 : <%= map.get("avgVal") %></div>  
	<div>급여 중앙값 : <%= map.get("medianVal") %></div> 
	<div>급여 최대값 : <%= map.get("maxVal") %></div> 
	<div>급여 최소값 : <%= map.get("minVal") %></div> 
</body>
</html>