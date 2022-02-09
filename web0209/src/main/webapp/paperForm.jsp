<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="./paperAction.jsp">
		<p>
			이름 : <input type = "text" name = "name">
		</p>
		<p>
			<div> <!-- 문제 -->
				1. 다음 중 자바의 기본 데이터타입(자료형)이 아닌 것은?
			</div>
			<div> <!-- 보기 -->
				<input type="radio" name="q1" value="1">① int
				<input type="radio" name="q1" value="2">② boolean
				<input type="radio" name="q1" value="3">③ String
				<input type="radio" name="q1" value="4">④ char
			</div>
		</p>
		
		<p>
			<div> <!-- 문제 -->
				2. 다음 중 문자열을 숫자 타입으로 변경하는 메서드는?
			</div>
			<div> <!-- 보기 -->
				<input type="radio" name="q2" value="1">① Integer.parseInt()
				<input type="radio" name="q2" value="2">② Math.random()
				<input type="radio" name="q2" value="3">③ System.out.println()
				<input type="radio" name="q2" value="4">④ main()
			</div>
		</p>
		
		<p>
			<div> <!-- 문제 -->
				3. 다음 중 자바에서 값을 표현하는 방식이 아닌 것은?
			</div>
			<div> <!-- 보기 -->
				<input type="radio" name="q3" value="1">① "true"
				<input type="radio" name="q3" value="2">② 'T'
				<input type="radio" name="q3" value="3">③ 100
				<input type="radio" name="q3" value="4">④ False
			</div>
		</p>
		
		<p>
			<div> <!-- 문제 -->
				4. 다음 중 조건문을 만들 때 사용하는 자바 키워드는?
			</div>
			<div> <!-- 보기 -->
				<input type="radio" name="q4" value="1">① for
				<input type="radio" name="q4" value="2">② if
				<input type="radio" name="q4" value="3">③ while
				<input type="radio" name="q4" value="4">④ where
			</div>
		</p>
		
		<p>
			<div> <!-- 문제 -->
				5. 다음 중 System.out.println(10 / 4); 호출 결과값은?
			</div>
			<div> <!-- 보기 -->
				<input type="radio" name="q5" value="1">① 2.5
				<input type="radio" name="q5" value="2">② 3
				<input type="radio" name="q5" value="3">③ 2
				<input type="radio" name="q5" value="4">④ 오류
			</div>
		</p>
		
		<p>
			<div> <!-- 문제 -->
				6. 다음 중 System.out.println(10.0 / 4.0); 호출 결과값은?
			</div>
			<div> <!-- 보기 -->
				<input type="radio" name="q6" value="1">① 2.5
				<input type="radio" name="q6" value="2">② 3
				<input type="radio" name="q6" value="3">③ 2
				<input type="radio" name="q6" value="4">④ 오류
			</div>
		</p>
		
		<p>
			<div> <!-- 문제 -->
				7. 다음 중 System.out.println(10 % 3); 호출 결과값은?
			</div>
			<div> <!-- 보기 -->
				<input type="radio" name="q7" value="1">① 3
				<input type="radio" name="q7" value="2">② 3.33333
				<input type="radio" name="q7" value="3">③ 1
				<input type="radio" name="q7" value="4">④ 오류
			</div>
		</p>
		
		<p>
			<div> <!-- 문제 -->
				8. 다음 중 System.out.println((int)3.14); 호출 결과값은?
			</div>
			<div> <!-- 보기 -->
				<input type="radio" name="q8" value="1">① 3.14
				<input type="radio" name="q8" value="2">② 3.0
				<input type="radio" name="q8" value="3">③ 3
				<input type="radio" name="q8" value="4">④ 4
			</div>
		</p>
		
		<p>
			<div> <!-- 문제 -->
				9. 다음의 코드를 실행 시 결과값은?
				<div>
					int x = 77; <br>
					if( x % 2 == 0) { <br>
						&nbsp;&nbsp;&nbsp;System.out.println("짝수"); <br>
					} else { <br>
						&nbsp;&nbsp;&nbsp;System.out.println("홀수"); <br>
					}
				</div>
			</div>
			<div> <!-- 보기 -->
				<input type="radio" name="q9" value="1">① 짝수
				<input type="radio" name="q9" value="2">② 홀수
				<input type="radio" name="q9" value="3">③ 짝수홀수
				<input type="radio" name="q9" value="4">④ 오류
			</div>
		</p>
		
		<p>
			<div> <!-- 문제 -->
				10. 다음의 코드를 실행 시 결과값은?
				<div>
					double x = Math.random(); <br>
					int y = (int)(x * 3); <br>
					System.out.println(y); <br>
				</div> 
			</div>
			<div> <!-- 보기 -->
				<input type="radio" name="q10" value="1">① 0
				<input type="radio" name="q10" value="2">② 1
				<input type="radio" name="q10" value="3">③ 2
				<input type="radio" name="q10" value="4">④ 0, 1, 2 중 랜덤 출력
			</div>
		</p>
		
		<div>
			<button type = "submit">답안전송</button>
		</div>
	</form>

</body>
</html>