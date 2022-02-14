
public class Ex2 {

	public static void main(String[] args) {
		// 1. 자바의 자료형
		// - 기본 타입
		// - 참조 타입 : 물리적으로 메모리에 저장되는 방식이 기본 타입과는 다르다.
		
		// 2. 기본 타입(총 8개) : 숫자(정수4, 실수2), 글자 한자1, 논리1
		// byte, short, int, long, float, double, char, boolean
		
		int a = 10;
		long b = 10L;
		
		float c = 1.7F;
		double d = 1.7;
		
		char e = '가';
		boolean f = true; // true/false
		
		// 3. String이라는 참조 타입
		String s = new String("참조타입"); // new 연산자 객체(참조타입의 값)를 만들 때 필요한 연산자
		String name = "참조타입"; // 큰따옴표를 이용하여 문자열을 만든다.
	}

}
