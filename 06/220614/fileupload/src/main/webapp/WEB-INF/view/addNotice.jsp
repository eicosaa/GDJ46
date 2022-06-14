<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addNotice</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){ // html 페이지를 다 로드시키고 매개변수함수를 실행
		
		let flag = true;
	
		$('#addFileupload').click(function(){
			// 추가된 noticefileList안에 파일이 첨부되지 않았다면 새로운 noticefileList 추가 X
			/* javascript 기본 api 방식
			let noticefileList = $('.noticefileList');
			console.log(noticefileList.length);
			for(let i=0; i<noticefileList.length; i++) {
				console.log(noticefileList[i].value);
				if(noticefileList[i].value == '') {
					flag = false;
					break;
				}
			}
			*/
			
			// jquery api 사용
			$('.noticefileList').each(function(){ // each 함수를 이용한 반복
				if($(this).val() == '') {
					flag = false;
				}
			});
			
			if(flag) {
				$('#fileSection').append("<div><input class='noticefileList' type='file' name='noticefileList'><div>");
			} else {
				alert('파일이 첨부되지 않은 noticefileList가 존재합니다');
			}
		});
		
		$('#addNotice').click(function(){
			if($('#noticeTitle').val() == '') {
				alert('noticeTitle 입력하세요');
			} else if($('#noticeContent').val() == '') {
				alert('noticeContent 입력하세요');
			} else {
				$('.noticefileList').each(function(){ // each함수를 이용한 반복
					if($(this).val() == '') {
						flag = false;
					}
				});
				if(flag) {
					$('#addForm').submit();
				} else {
					alert('파일이 첨부되지 않은 noticefileList가 존재합니다');
				}
			}
		});
		
	});	
</script>
</head>
<body>
	
<div class="container">
	<h1>addNotice</h1>
	<br>
	<form method="post" id="addForm" action="${pageContext.request.contextPath}/addNotice" enctype="multipart/form-data">
		<table class="table table-striped">
			<tr>
			    <td>제목</td>
			    <td><input type="text" name="noticeTitle" id="noticeTitle"></td>
			</tr>
			<tr>
			    <td>내용</td>
			    <td><input type="text" name="noticeContent" id="noticeContent"></td>
			</tr>
			<tr>
				<td>파일</td>
				<td>
					<button type="button" id="addFileupload">파일업로드 추가</button>
					<div id="fileSection">
						<!-- 파일업로드 input 태그가 추가될 영역 -->
					</div>
				</td>
			</tr>
		</table>
		
		<div>
			<button type="button" class="btn btn-default" id="addNotice">입력</button>
			<a class="btn btn-default" href="${pageContext.request.contextPath}/noticeList">이전페이지</a>
		</div>
	</form>
</div>

</body>
</html>