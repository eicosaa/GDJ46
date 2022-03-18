
public class Ex03 {

	public static void main(String[] args) {
		// if, for 실습 예제
		
		// 3. if~else if~else문을 사용하여 양수, 음수, 0 을 구별하는 프로그램을 구현하라.
		
		int num = 3;
		
		if(num == 0) {
			System.out.println(num + " 0");
		} else {
			if(num > 0) {
				System.out.println(num + " 양수");
			} else {
				System.out.println(num + " 음수");
			}
		}

	}

}
