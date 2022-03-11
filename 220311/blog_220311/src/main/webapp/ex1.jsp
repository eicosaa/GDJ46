<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<!-- 
		1. html5 = html5(컨텐츠) + css3(스타일) + javascript(태드에 기능 부여)
		
		2. css 문법
		선택자 { 속성 : 값; }
			1) 태그 이름 : 거의 사용하지 않는다. 태그의 디폴트 스타일을 적용할 때만 사용 (-모든 태그에 적용되기 때문)
			2) 클래스 속성
			3) 아이디 속성
			
		
		<style>
	 	/* div {align-content : center; color : red;}
	 	   div {text-align : center;} -여러 개로 나눠서 작성 가능*/
	 	/* div {color : red;} -모든 div에 빨간 글씨 */
	 	/* <body> <div style="color:red;">abc</div> </body>
	 	   -스타일 걷어내기(수정, 유지보수)가 어렵다, 재활용 불가능, 사용 비추천	
	 	*/
	 	/* 
		 	id = "t1" 인 태그의 컬러를 빨간색 -id는 중복되는 CSS문법이 생김
		 	#t1 {color : red;}
		 	#t2 {color : red;}
	 	*/
	 	/* 
		 	class = "g1" 인 태그의 컬러를 빨간색
		 	.g1 {color : red;}
		 	.g2 {text-align : center;}
		*/
		/* -css파일을 새로 만들어서 쓰기도 한다.(이클립스에는 .css 존재) */
	 </style>
	 
	 <link rel="stylesheet" type="text/css" href="./mystyle.css">
	 -href에 네이버같은 외부 주소 가능
	 -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>	
	<div class = "container-fluid">
		<div class="row">
		 <div class="col-sm-2"> <!-- 좌측 메뉴 -->
		  <ul>
		  	<li><a href = ""> 메뉴1 </a>
		  	<li><a href = ""> 메뉴2 </a>
		  	<li><a href = ""> 메뉴3 </a>
		  	<li><a href = ""> 메뉴4 </a>
		  	<li><a href = ""> 메뉴5 </a>
		  </ul>
		  </div>
		  		
		<div class="col-sm-10"> <!-- 메인 내용 -->
			<table class = "table table-dark">
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>강민창</td>
					</tr>
					<tr>
						<td>2</td>
						<td>강한빛</td>
					</tr>
					<tr>
						<td>3</td>
						<td>구혜민</td>
					</tr>
					<tr>
						<td>4</td>
						<td>김득환</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>