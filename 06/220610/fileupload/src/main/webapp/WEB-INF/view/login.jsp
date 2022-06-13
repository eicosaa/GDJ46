<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>LOGIN</h1>
    <form action="${pageContext.request.contextPath}/login" method="post">
	    <table class="table">
	    	<tr>
	    		<td>ID</td>
	    		<td><input type="text" name="userId"></td>
	    	</tr>
	    	<tr>
	    		<td>PW</td>
	    		<td><input type="password" name="userPw"></td>
	    	</tr>
	    </table>
	    
    	<button type="submit" class="btn btn-default">로그인</button>
    </form>
</div>
</body>
</html>