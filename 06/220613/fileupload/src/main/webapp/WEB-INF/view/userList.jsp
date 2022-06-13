<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>userList</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 
</head>
<body>
<div class="container">

	<div>
	<br>
		<c:if test="${ loginUser != null }">
			${ loginUser.userId } 님 반갑습니다.
			&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath}/logout" class="btn btn-default">로그아웃</a>
		</c:if>
	</div>

    <h1>USER LIST</h1>
    <table class="table">
        <thead>
            <tr>
                <td>no</td>
                <td>id</td>
                <td>pw</td>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="u" items="${userList}">
                <tr>
                    <td>${u.userNo}</td>
                    <td>${u.userId}</td>
                    <td>${u.userPw}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <!-- 아이디 검색 -->
    <div>
        <form action="${pageContext.request.contextPath}/userList" method="get">
            아이디 검색 : <input type="text" name="searchWord"/>
            <button type="submit">검색</button>
        </form>
    </div>
    <br>
    <!-- 페이징 -->
    <div>
        <c:if test="${currentPage > 1}">
            <a href="${pageContext.request.contextPath}/userList?currentPage=${currentPage - 1}" class="btn btn-default">이전</a>
        </c:if>
        
        &nbsp;&nbsp;
        ${currentPage}
        &nbsp;&nbsp;
        
        <c:if test="${currentPage < lastPage}">
            <a href="${pageContext.request.contextPath}/userList?currentPage=${currentPage + 1}" class="btn btn-default">다음</a>
        </c:if>
    </div>
</div>
</body>