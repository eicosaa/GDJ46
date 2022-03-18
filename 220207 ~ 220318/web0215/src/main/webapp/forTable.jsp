<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>forTable</title>
	<style type="text/css">
		table, th, td {border : 1px dashed #FF00DD;}
	</style>
</head>
<body>
	<h1> 3행 2열</h1>
	<table>
		<tr>
			<%
				for(int i=1; i<=6; i=i+1) { // 테이블 칸의 개수만큼 반복(td의 개수, 칸의 개수)
			%>
					<td> <%= i %> </td>
			<%
					if(i != 6 && i%2 == 0) { // i != 6(마지막 tr생략) / i%2 == 0 (행 바꿈)
			%>
						</tr><tr> 
			<%
					}
				}
			%>
		</tr>
	</table>
	
	<h1> 5행 3열</h1>
	<table>
		<tr>
			<%
				for(int i=1; i<=15; i=i+1) {
			%>
					<td> <%= i %> </td>
			<%
					if(i != 15 && i%3 == 0) {
			%>
						</tr><tr>
			<%
					}
				}
			%>
		</tr>
	</table>
	
	<h1> 4행 5열</h1>
	<table>
		<tr>
			<%
				for(int i=1; i<=20; i=i+1) {
			%>
					<td> <%= i %> </td>
			<%
					if(i != 20 && i%5 == 0) {
			%>
						</tr><tr>
			<%
					}
				}
			%>
		</tr>
	</table>
	
	<h1> 3행 5열</h1>
	<table>
		<tr>
			<%
				for(int i=1; i<=15; i=i+1) {
			%>
					<td> <%= i %> </td>
			<%
					if(i != 15 && i%5 == 0) {
			%>
						</tr><tr>
			<%
					}
				}
			%>
		</tr>
	</table>
	
	<h1> 5행 7열</h1>
	<table>
		<tr>
			<%
				for(int i=1; i<=35; i=i+1) {
			%>
					<td> <%= i %> </td>
			<%
					if(i != 35 && i%7 == 0) {
			%>
						</tr><tr>
			<%
					}
				}
			%>
		</tr>
	</table>
</body>
</html>