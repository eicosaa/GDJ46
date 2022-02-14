
public class Ex1 {

	public static void main(String[] args) {
		// 주석 : 코드 안에 낙서
		// - 한 줄 주석
		/* - 여러 줄 주석 */
		
		// 2. 대입연산자 =
		// 대입연산자	 == 연산자와는 완전히 다르다
		// 변수 = 값; 
		
		int x; // 변수 선언
		x = 10; // 변수 초기화
		int y = 11; // 변수 선언과 초기화를 같이 구현
		
		System.out.println(x);
		System.out.println(y);
		
		// 3. 상수 : 변수의 값을 초기화 이후에 변경하지 못하도록
		// int maxNum = 100; // 카멜표현식
		// final 키워드를 이용하여 상수를 만든다.
		final int MAX_NUM = 100; // 상수의 이름은 대문자로 만든다.
		System.out.println(MAX_NUM);
		
		
	}

}
