package vo;

public class DataMain {

	public static void main(String[] args) {
		byte a; // 1byte == 8bit -> 0 ~ 255 -> -128 ~ +127 -> 2^7 ~ 2^7-1
		short b; // 2byte -> 2^15 ~ 2^15-1
		int c; // 4byte
		long d; // 8byte
		
		a = 127;
		// a = 128;
		c = 2000000000;
		// c = 3000000000;
		
		c = 10; // 자바에 정수 숫자 표기는 int
		d = (long)20; // 자동 형변환
		c = (int)3000000000L; // 형변환 시 데이터 손실이 발생할 수 있어 강제 형변환이 필요하다.
		System.out.println(c);
		
		float e;
		
		e = 3000000000L; // ? 컴퓨터가 실수 표현방식이 정수표현방식과는 다르다 -> 부동소수점방식
		System.out.println(e);
		
		e = (float)1.7; // 자바에 실수 숫자 표기는 double / 1.7F;
		
		// boolean f = (boolean)0;
		
		
		// if		vs		switch		vs		3항 연산자
		// 조건 분기			값 분기
		
		int x = 10;
		String result = (x > 10) ? "양수" : "음수";
		System.out.println(result);
		
		int age = 29;
		switch(age % 2) {
		case 0:
			System.out.println("짝수 나이");
			break;
		case 1:
			System.out.println("홀수 나이");
		}
		
		if(age % 2 == 0) { // switch문은 if(==)문으로 변경 가능하다.
			//
		} else if(age % 2 ==1) {
			//
		}
		
		String grade = "F";
		switch(grade) {
		case "A":
			System.out.println("최우수");
			break;
		case "B":
			System.out.println("우수");
			break;
		case "C":
			System.out.println("보통");
			break;
		default:
			System.out.println("탈락");	
		}
		
		
	}

}
