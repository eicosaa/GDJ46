<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>addNotice</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
</head>
<body>
<div class="container">
	<h1>addNotice</h1>
	<br>
	<form method="post" action="${pageContext.request.contextPath}/addNotice" enctype="multipart/form-data">
		<table class="table table-striped">
			<tr>
			    <td>제목</td>
			    <td><input type="text" name="noticeTitle"></td>
			</tr>
			<tr>
			    <td>내용</td>
			    <td><input type="text" name="noticeContent"></td>
			</tr>
			<tr>
			    <td>파일</td>
			    <td><input type="file" name="noticefileList" multiple="multiple"></td>
			</tr>
		</table>
		
		<div>
			<button type="submit" class="btn btn-default">입력</button>
		</div>
	</form>
</div>
</body>
</html>