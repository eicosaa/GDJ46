<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.Bookmark" %>
<%
	Bookmark[] bookmark = new Bookmark[3];
	Bookmark b0 = new Bookmark();
	b0.name = "깃허브";
	b0.url = "http://www.github.com";
	bookmark[0] = b0;
	Bookmark b1 = new Bookmark();
	b1.name = "네이버";
	b1.url = "https://www.naver.com/";
	bookmark[1] = b1;
	Bookmark b2 = new Bookmark();
	b2.name = "유튜브";
	b2.url = "https://www.youtube.com";
	bookmark[2] = b2;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>즐겨찾기 목록</h1>
	<ul>
		<%
			for(Bookmark b : bookmark) {
		%>
				<li><a href = "<%= b.url%>" target = "_blank"><%= b.name %></a>
		<%
			}
		%>
	</ul>
</body>
</html>