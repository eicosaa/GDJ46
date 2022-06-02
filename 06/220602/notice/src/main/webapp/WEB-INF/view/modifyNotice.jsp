<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>modifyNotice</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
</head>
<body>
<div class="container">
	<h1>modifyNotice - ${notice.noticeTitle}</h1>
	<br>
	<form method="post" action="${pageContext.request.contextPath}/modifyNotice">
		<table class="table table-striped">
			<tr>
			    <td>번호</td>
			    <td><input type="number" name="noticeNo" value="${notice.noticeNo}" readonly="readonly"></td>
			</tr>
			<tr>
			    <td>제목</td>
			    <td><input type="text" name="noticeTitle" value="${notice.noticeTitle}"></td>
			</tr>
			<tr>
			    <td>내용</td>
			    <td><input type="text" name="noticeContent" value="${notice.noticeContent}"></td>
			</tr>
			<tr>
			    <td>비밀번호 확인</td>
			    <td><input type="password" name="noticePw"></td>
			</tr>
		</table>
		
		<div>
			<input type="submit" class="btn btn-default" value="수정">
			<a class="btn btn-default" href="${pageContext.request.contextPath}/getNoticeOne?noticeNo=${notice.noticeNo}">이전페이지</a>
		</div>
	</form>
</div>
</body>
</html>