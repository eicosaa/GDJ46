<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$('document').ready(function() {
		$('#btn').click(function() {
			if($('#idck').val().length > 3) {
				$.ajax({
					type:'post'
					, url:'/fileupload/idCheck' // url:'/fileupload/idCheck?id=' + $('#idck').val()
					, data: {id: $('#idck').val()}
					, success: function(ck) {
						console.log('ck : ', ck);
						if(ck == 'false') {
							alert('이미 사용중인 아이디입니다');
						} else {
							$('#id').val(ck);
						}
					}
				});	
			} else {
				alert('id는 4자 이상');
			}
		});
	});
</script>
</head>
<body>
	<h1>회원가입폼</h1>
	<form>
		id중복검사 : <input type="text" id="idck"><button type="button" id="btn">중복검사</button><br>
		id : <input type="text" id="id" name="id" readonly="readonly">
	</form>
</body>
</html>