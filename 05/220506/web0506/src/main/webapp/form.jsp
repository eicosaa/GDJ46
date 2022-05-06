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
                   <input type="text" id="id" name="id" value = "test">
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
                    <div><input type="password" id="pw" name="pw" value = "test"></div>
                    <!-- pw1==pwConfirm : blur이벤트 발생시 체크 -->
                    <div>
                    	<input type="password" id="pwConfirm" name="pwConfirm" value = "test">
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
	// 1) id 입력창 검사
	document.querySelector('#id').addEventListener('blur', function() {
		if(document.querySelector('#id').value.length < 4) {
			console.log('id는 4자 이상'); // 디버깅
			// 폼 태그는 텍스트 값을 value 속성 사용
			// 일반 태그는 텍스트 값을 innerHTML 속성 사용
			document.querySelector('#idHelper').innerHTML = 'id는 4자 이상';
			document.querySelector('#id').focus(); // 커서를 다시 id 입력창으로 이동
		} else {
			document.querySelector('#idHelper').innerHTML = '';
		}
	});
	
	// 2) pw와 pw확인 입력창 검사
	document.querySelector('#pwConfirm').addEventListener('blur', function() {
		if(document.querySelector('#pw').value.length < 4) {
			console.log('pw는 4자 이상'); // 디버깅
			document.querySelector('#pwHelper').innerHTML = 'pw는 4자 이상';
			document.querySelector('#pw').focus();
		} else if(document.querySelector('#pw').value
				!= document.querySelector('#pwConfirm').value) {
			document.querySelector('#pwHelper').innerHTML = 'pw가 다릅니다';
			document.querySelector('#pw').focus();
		} else {
			document.querySelector('#pwHelper').innerHTML = '';
		}
	});
	
	// 3) birth와 age 입력창 검사(birth 공백값 체크, birth blur 발생 시 age 계산)
	document.querySelector('#birth').addEventListener('blur', function() {
		if(document.querySelector('#birth').value == '') {
			console.log('birth를 입력하세요'); // 디버깅
			document.querySelector('#birthHelper').innerHTML = 'birth를 입력하세요';
			document.querySelector('#birth').focus();
		} else {
			// age 계산
			document.querySelector('#birthHelper').innerHTML = '';
			// 오늘 년도
			let now = new Date(); // 현재 날짜 및 시간
			let year = now.getFullYear(); // 연도
			let age = year - Number(document.querySelector('#birth').value.substr(0, 4));
			document.querySelector('#age').value = age;
		}
	});
	
	// 4) 나머지 요소들은 버튼을 클릭했을 때 유효성 검사
	/*
	document.querySelector('#singup').addEventListener('click', function() {
		// 유효성 검사는 중복으로 전체 공백 검사 <- 바로 가입 버튼을 누를 수 있기 때문이다.
		if(document.querySelector('#pw').value.length < 4) {
			document.querySelector('#pwHelper').innerHTML = 'pw는 4자 이상';
			document.querySelector('#pw').focus();
		} else if(document.querySelectorAll('.gender:checked').length == 0) {
			document.querySelector('#pwHelper').innerHTML = '';
			document.querySelector('#genderHelper').innerHTML = '성별 선택';
		} else if(document.querySelectorAll('.interest:checked').length < 2) {
			document.querySelector('#genderHelper').innerHTML = '';
			document.querySelector('#interestHelper').innerHTML = '2개 이상 선택';
		} else if(document.querySelector('#emailId').value == ''
				|| document.querySelector('#emailUrl').value == '') {
			document.querySelector('#interestHelper').innerHTML = '';
			document.querySelector('#emailHelper').innerHTML = 'emailId와 emailUrl 확인';
			document.querySelector('#emailId').focus();
		} else {
			document.querySelector('#signupForm').submit();
		}
	});
	*/
	
	// 4-1) ISSUE 처리 중
	document.querySelector('#signup').addEventListener('click', function() {
		// ISSUE : 유효성 검사는 중복으로 전체 공백 검사 <- 바로 가입 버튼을 누를 수 있기 때문이다.
		if(document.querySelector('#pw').value.length < 4) {
			document.querySelector('#pwHelper').innerHTML = 'pw는 4자 이상';
			document.querySelector('#pw').focus();
		} else if(document.querySelectorAll('.gender:checked').length == 0) {
			document.querySelector('#pwHelper').innerHTML = '';
			document.querySelector('#genderHelper').innerHTML = '성별 선택';
		} else if(document.querySelectorAll('.interest:checked').length < 2) {
			document.querySelector('#genderHelper').innerHTML = '';
			document.querySelector('#interestHelper').innerHTML = '2개 이상 선택';
		} else if(document.querySelector('#emailId').value == ''
				|| document.querySelector('#emailUrl').value == '') {
			document.querySelector('#interestHelper').innerHTML = '';
			document.querySelector('#emailHelper').innerHTML = 'emailId와 emailUrl 확인';
			document.querySelector('#emailId').focus();
		} else {
			document.querySelector('#signupForm').submit();
		}
	});
	
</script>
</html>