<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Index</h1>
	<div>
		<div> 현재 접속자 수 : ${ currentCount } </div>
		<div> 오늘(${ stats.day }) 접속자 수 : ${ stats.cnt } </div>
		<div> 총 접속자 수 : ${ totalCount } </div>
	</div>
</body>
</html>