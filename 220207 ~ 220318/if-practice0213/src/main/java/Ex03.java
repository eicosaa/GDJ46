
public class Ex03 {

	public static void main(String[] args) {
		// if 조건문과 for 반복문 연습
		
		// 3. if~else if~else문을 사용하여 양수, 음수, 0 을 구별하는 프로그램을 구현하라.
		
		// 변수 선언 및 초기화
		int num = 3;
		
		if(num > 0) {
			System.out.println(num + " 양수");
		} else {
			if(num == 0) {
				System.out.println(num + " 0");
			} else {
				System.out.println(num + " 음수");
			}
		}

	}

}
