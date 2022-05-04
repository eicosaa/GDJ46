<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type = "text/css"></style>
<script type = "text/javascript">
	// 값 타입
	let a;
	let b = 1;
	let c = 3.14;
	let d = "a"; // 'a', "abc", 'abc', `abc`
	// 객체 타입
	let e = [3, 8, 10]; // ["득환", "유진", 9]
	let f = {id : "guest", pw : "1234"};
	let g = function() {console.log('hello')};
	
	// console.log(g);
	
	// g(); // -g라는 코드가 있으면 호출/ 함수(코드)호출연산자
	
	console.log('a : ', a);
	console.log('b : ', b);
	console.log('c : ', c);
	console.log('d : ', d);
	console.log('e : ', e);
	console.log('e[0] : ', e[0]);
	console.log('e[1] : ', e[1]);
	console.log('e[2] : ', e[2]);
	console.log('f : ', f);
	console.log('f : ', f.id); // f["id"]
	console.log('f : ', f.pw); // f["pw"]
</script>
</head>
<body>
	<h1>ex1_0504</h1>
</body>
</html>