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
			${ loginUser.userId } �� �ݰ����ϴ�.
			&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath}/logout" class="btn btn-default">�α׾ƿ�</a>
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
    <!-- ���̵� �˻� -->
    <div>
        <form action="${pageContext.request.contextPath}/userList" method="get">
            ���̵� �˻� : <input type="text" name="searchWord"/>
            <button type="submit">�˻�</button>
        </form>
    </div>
    <br>
    <!-- ����¡ -->
    <div>
        <c:if test="${currentPage > 1}">
            <a href="${pageContext.request.contextPath}/userList?currentPage=${currentPage - 1}" class="btn btn-default">����</a>
        </c:if>
        
        &nbsp;&nbsp;
        ${currentPage}
        &nbsp;&nbsp;
        
        <c:if test="${currentPage < lastPage}">
            <a href="${pageContext.request.contextPath}/userList?currentPage=${currentPage + 1}" class="btn btn-default">����</a>
        </c:if>
    </div>
</div>
</body>