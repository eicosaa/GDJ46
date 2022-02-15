<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>companyForm 데이터 입력</title>
	<style type = "text/css">
		table {border : 1px solid #3DB7CC;}
		td {border : 1px solid #3DB7CC;}
	</style>
</head>
<body>
<h1>입력</h1>
	<form method="post" action="./companyAction.jsp">
		<table>
			<tr>
				<td>연번</td>
				<td><input type="number" name="no"></td>
			</tr>
			<tr>
				<td>협약</td>
				<td><input type="text" name="agreement"></td>
			</tr>
			<tr>
				<td>협약서</td>
				<td><input type="text" name="document"></td>
			</tr>
			<tr>
				<td>회사명</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>필요 기술</td>
				<td><input type="text" name="skill"></td>
			</tr>
			<tr>
				<td>분야 / 직무 / 기타</td>
				<td><input type="text" name="job"></td>
			</tr>
			<tr>
				<td>담당자</td>
				<td><input type="text" name="person"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td>메일</td>
				<td><input type="text" name="mail"></td>
			</tr>
			<tr>
				<td>위치</td>
				<td><input type="text" name="location"></td>
			</tr>
			<tr>
				<td>현장 실습</td>
				<td><input type="text" name="internship"></td>
			</tr>
			<tr>
				<td>연봉(대졸)</td>
				<td><input type="number" name="salary"></td>
			</tr>
			<tr>
				<td>청년내일채움공제</td>
				<td><input type="text" name="tomorrow"></td>
			</tr>
			<tr>
				<td>홈페이지</td>
				<td><input type="text" name="homepage"></td>
			</tr>
			<tr>
				<td>매출액</td>
				<td><input type="number" name="sales"></td>
			</tr>
			<tr>
				<td>업력</td>
				<td><input type="number" name="since"></td>
			</tr>
			<tr>
				<td>사원수</td>
				<td><input type="number" name="employees"></td>
			</tr>
			<tr>
				<td>상장기업</td>
				<td><input type="text" name="corporation"></td>
			</tr>
			<tr>
				<td>청년친화</td>
				<td><input type="text" name="young"></td>
			</tr>
			<tr>
				<td>강소기업</td>
				<td><input type="text" name="smallGiant"></td>
			</tr>
			<tr>
				<td>우수기업</td>
				<td><input type="text" name="excellence"></td>
			</tr>
			<tr>
				<td>메인비즈</td>
				<td><input type="text" name="mainbiz"></td>
			</tr>
			<tr>
				<td>이노비즈</td>
				<td><input type="text" name="innobiz"></td>
			</tr>
			<tr>
				<td>벤처인증</td>
				<td><input type="text" name="venture"></td>
			</tr>
		</table>
		<tr>
			<td colspan="2">
				<button type="submit">입력</button>
			</td>
		</tr>
	</form>

</body>
</html>