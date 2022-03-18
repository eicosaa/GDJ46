
public class Ex04 {

	public static void main(String[] args) {
		// if 조건문과 for 반복문 연습
		
		/* 4. 20대만 출입이 가능한 곳이 있다. 두 명의 나이가 모두 20대이면 출입, 아니면 출입금지를 출력하는 프로그램을 구현하라.
		(if~else, 산술연산자, 논리연산자 사용) */
				
		// 변수 선언 및 초기화
		int oneAge = 21;
		int twoAge = 27;
		
		if(oneAge > 20 && twoAge > 20) {
			System.out.println("모두 20대이기에 출입 가능합니다.");
		} else {
			System.out.println("20대가 아니라 출입 불가능합니다.");
		}

	}

}
