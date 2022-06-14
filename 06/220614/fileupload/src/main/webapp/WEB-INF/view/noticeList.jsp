<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>noticeList</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
</head>
<body>
<div class="container">
    <h1>noticeList</h1>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>날짜</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="n" items="${list}">
                <tr>
                   <td>${n.noticeId}</td>
                    <td><a href="${pageContext.request.contextPath}/noticeOne?noticeId=${n.noticeId}">${n.noticeTitle}</a></td>
                   <td>${n.noticeDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

   <ul class="pager">
      <li class="previous"><a href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage-1}">이전</a></li>
      <li class="next"><a href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage+1}">다음</a></li>
   </ul>
   
    <div>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/addNotice">공지 입력</a>
    </div>
</div>
</body>
</html>