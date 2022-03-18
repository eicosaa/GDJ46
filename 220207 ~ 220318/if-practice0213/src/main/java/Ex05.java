
public class Ex05 {

	public static void main(String[] args) {
		// if 조건문과 for 반복문 연습
		
		// 5. 1~50까지의 수에서 5의배수만 출력하는 프로그램을 구현하라.(for, if, %연산자 사용)
		
		for(int i = 1; i <= 50; i = i + 1) {
			if(i % 5 == 0) {
				System.out.println(i);
			}
		}

	}

}
