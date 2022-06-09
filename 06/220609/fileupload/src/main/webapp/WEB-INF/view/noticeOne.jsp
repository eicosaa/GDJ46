<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>noticeOne</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
</head>
<body>
<div class="container">
	<h1>noticeOne - ${notice.noticeTitle}</h1>
	<br>
	<table class="table table-striped">
	 <tr>
	     <td>번호</td>
	     <td>${notice.noticeId}</td>
	 </tr>
		<tr>
	     <td>제목</td>
	     <td>${notice.noticeTitle}</td>
	 </tr>
		<tr>
	     <td>내용</td>
	     <td>${notice.noticeContent}</td>
	 </tr>
		<tr>
	     <td>날짜</td>
	     <td>${notice.noticeDate}</td>
	 </tr>
	 
	 <c:if test="${ not empty fileList }">
	 	
		 	<c:forEach var = "fl" items = "${ fileList }">
			 	<tr>
			 		<c:if test="${ fl.noticefileType eq 'image/jpeg'}">
			 			<td><img src="${pageContext.request.contextPath}/upload/${ fl.noticefileName }" width = "150" height = "150"></td>
			 		</c:if>
			 		<td colspan="2">
			 			<a href="${pageContext.request.contextPath}/upload/${ fl.noticefileName }" download>${ fl.noticefileName }</a>
			 			&nbsp;
			 			<a class="btn btn-default" href="${pageContext.request.contextPath}/deleteNoticefile?noticefileId=${ fl.noticefileId }&noticeId=${notice.noticeId}&noticefileName=${ fl.noticefileName }">삭제</a>
			 		</td>
			 	</tr>
		 	</c:forEach>
	 </c:if>
	</table>
	
	<div>
		<!-- <a class="btn btn-default" href="${pageContext.request.contextPath}/modifyNotice##########?noticeId=${notice.noticeId}">수정</a>  -->
		<a class="btn btn-default" href="${pageContext.request.contextPath}/removeNotice?noticeId=${notice.noticeId}">삭제</a>
		<a class="btn btn-default" href="${pageContext.request.contextPath}/noticeList">이전페이지</a>
	</div>
</div>
</body>
</html>