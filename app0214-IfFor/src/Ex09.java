
public class Ex09 {

	public static void main(String[] args) {
		// if, for 실습 예제
		
		// 9. 3~100까지의 수에서 소수의 갯수를 출력하는 프로그램을 구현하라.
		
		int count = 0;
		boolean flag = true; // true : 소수
		
		for(int i = 3; i < 101; i++) {
			// 소수를 발견하면
			for(int j = 2; j < i; j++) {
				if(i % j == 0) {
					flag = false;
					break;
				}
			}
			if(flag) {
				count++;
			}
			flag = true;
		}
		
		System.out.println("소수는 " + count + "개 입니다.");
	
	}

}
