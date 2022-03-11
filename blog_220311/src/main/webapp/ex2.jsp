<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<!-- 상단 메뉴 / 좌측 메뉴 / 메인 / 아래 내용... -->
	
	<div class = "container">
		<!-- 상단 메뉴 -->
		<div class = "bg-secondary">
			상단 메뉴
		</div>
		<!-- 좌측 메뉴 + 메인 -->
		<div class = "row">
			<!-- 좌측 메뉴 -->
			<div class = "col-sm-2 bg-warning">
				<ul class="list-group">
				  <li class="list-group-item">First item  <span class = "badge bg-danger">25</span> </li>
				  <li class="list-group-item">Second item <span class = "badge bg-danger">20</span> </li>
				  <li class="list-group-item">Third item <span class = "badge bg-danger">10</span> </li>
				</ul> 
			</div>
			<!-- 메인 -->
			<div class = "col-sm-8 bg-light">
				<div>
					<div class="mt-4 p-5 bg-primary text-white rounded">
						<h1>Jumbotron Example</h1>
  						<p>Lorem ipsum...</p>
					</div>
				</div>
				<div>
					<img src = "./ace.png">
				</div>
				<div>
					<img src = "./ace.png" class = "rounded">
				</div>
				<div>
					<img src = "./ace.png" class = "rounded-circle">
				</div>
				<div>
					<img src = "./ace.png" class = "img-thumbnail">
				</div>
				<div>
					<button type = "button" class = "btn btn-success">버튼 회원가입</button> <br>
					<input type = "button" class = "btn btn-info" value = "INPUT 회원가입"> <br>
					<a href="" class = "btn btn-warning">A 회원가입</a>
				</div>
				
				<ul class="pagination">
				  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
				  <li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
				
			</div>
		</div>
		<!-- 아래 내용 -->
		<div class = "bg-secondary">
			<div>주소...</div>
			<div>Copyright...</div>
		</div>
	</div>
</body>
</html>