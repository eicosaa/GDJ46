<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    table, tr, td {
        border:1px solid #000000 ;
        border-collapse:collapse;
    }
    table {
        width:100%;
    }
    .help {
    	color : #FF0000;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<form action="./action.jsp" method="post" id = "signupForm">
    <fieldset>
        <legend>회원가입</legend>
        <table>
            <tr>
                <td>ID(4자 이상)</td>
                <td>
                   <!-- 4자이상 : blur이벤트 발생시 체크 -->
                   <input type="text" id="id" name="id">
                   <span id = "idHelper" class = "help"></span>
                </td>
            </tr>
            <tr>
                <td>
                   <div>PW(4자 이상)</div>
                   <div>PW확인</div>
                </td>
                <td>
                   <!-- 4자이상 : blur이벤트 발생시 체크 -->
                    <div><input type="password" id="pw" name="pw"></div>
                    <!-- pw1==pwConfirm : blur이벤트 발생시 체크 -->
                    <div>
                    	<input type="password" id="pwConfirm" name="pwConfirm">
                    	<span id = "pwHelper" class = "help"></span>
                    </div>
                </td>
            </tr>
            <tr>
                <td>성별(필수항목)</td>
                <td>
                    <input type="radio" value="male" name="gender" class="gender">남
                    <input type="radio" value="female" name="gender" class="gender">여
                    <span id = "genderHelper" class = "help"></span>
                </td>
            </tr>
            <tr>
                <td>관심사(필수항목 2개 이상 선택)</td>
                <td>
                    <!-- 2개 이상 필수선택 체크 -->
                    <input type="checkbox" value="sport" name="interest" class="interest">스포츠
                    <input type="checkbox" value="trip" name="interest" class="interest">여행
                    <input type="checkbox" value="book" name="interest" class="interest">책
                    <input type="checkbox" value="it" name="interest" class="interest">IT
                    <input type="checkbox" value="music" name="interest" class="interest">음악
                    <span id = "interestHelper" class = "help"></span>
                </td>
            </tr>
            <tr>
                <td>생일(필수항목)</td>
                <td>
                	<input type="date" id="birth" name="birth">
                	<span id = "birthHelper" class = "help"></span>
                </td>
            </tr>
            <tr>
                <td>나이</td>
                <td>
                   <!-- 생일입력시 자동입력, 직접 입력불가(readonly) -->
                   <input type="text" id="age" name="age" readonly="readonly">
                </td>
            </tr>
            <tr>
                <td>이메일(필수항목)</td>
                <td>
                    <input type="text" id="emailId" name="emailId">
                    @
                    <select id="emailUrl" name="emailUrl">
                  <!-- 필수 -->
                       <option value="">::선택::</option>
                        <option value="naver.com">네이버</option>
                        <option value="daum.net">다음</option>
                        <option value="gmail.com">gmail</option>
                    </select>
                    <span id = "emailHelper" class = "help"></span>
                </td>
            </tr>
            <tr>
                <td>메모(선택항목)</td>
                <td>
                   <!-- 필수 입력 사항 아님 -->
                   <textarea id="memo" name="memo" rows="3" cols="50"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <!-- 폼 text, radio, checkbox 공백이 있는지 체크 -->
                    <button type = "button" id = "signup">signup</button>
                    <button type = "reset">reset</button>
                    <!-- 
                    <input type="button" id="signup" value="signup">
                    <input type="reset" value="reset">
                    -->
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
<script>
	// consle.log($('.gender:checked'));

	// $('#id').focus();
	
	$('#id').blur(function() {
		if($('#id').val().length < 4) {
			$('#idHelper').text('id는 4자 이상');
			$('#id').focus();
		} else {
			$('#idHelper').text('');
		}
	}); // -id에 blur라는 이벤트가 발생하면 함수를 실행한다.
	
	$('#pwConfirm').blur(function() {
		if($('#pw').val().length < 4) {
			$('#pwHelper').text('pw는 4자 이상');
			$('#pw').focus();
		} else if($('#pw').val() != $('#pwConfirm').val()) {
			$('#pwHelper').text('pw가 일치하지 않습니다');
			$('#pw').focus();
		} else {
			$('#pwHelper').text('');
		}
	});
	
	$('#birth').blur(function() {
		if($('#birth').val() == '') {
			$('#birthHelper').text('birth을 입력하세요');
			$('#birth').focus();
		} else {
			$('#birthHelper').text('');
			// age 계산
			let today = new Date();
			let y = today.getFullYear();
			let age = y - Number($('#birth').val().substr(0, 4));
			$('#age').val(age);
		}
	});
	
	/*
	$('#birth').blur(function() {
		if($('#birth'.val() == '')) {
			$('#birthHelper').text('birth를 입력하세요'); // -태그를 채울 때는 $('#birthHelper').html('<div>test</div>');
			$('#birth').focus();
		} else {
			$('#birthHelper').text('');
			// age 계산
			let today = new Date();
			let y = today.getFullYear();
			let age = y - Number($('#birth').val().substr(4));
			$('#age').val(age);
		}
	});
	*/
	
	$('#signup').click(function() {
		if($('#id').val() == '') {
			$('#idHelper').text('id는 4자 이상');
			$('#id').focus();
		} else if($('#pw').val() == '') {
			$('#idHelper').text('');
			
			$('#pwHelper').text('pw는 4자 이상');
			$('#pw').focus();
		} else if($('.gender:checked').length == 0) {
			$('#pwHelper').text('');
			
			$('#genderHelper').text('gender를 선택하세요');
			$('.gender').focus(); // ?
		} else if($('.interest:checked').length < 2) {
			$('#genderHelper').text('');
			
			$('#interestHelper').text('interest는 2개 이상 선택하세요');
			$('.interest').focus(); // ?
		} else if($('#birth').val() == '') {
			$('#interestHelper').text('');
			
			$('#birthHelper').text('birth를 입력하세요');
			$('.interest').focus();
		} else if($('#emailId').val() == '' || $('#emailUrl').val() == '') {
			$('#birthtHelper').text('');
			
			$('#emailHelper').text('email을 입력하세요');
			$('#emailId').focus();
		} else {
			$('#signupForm').submit();
		}
	})
</script>
</html>