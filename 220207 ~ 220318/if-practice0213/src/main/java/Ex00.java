
public class Ex00 {

	public static void main(String[] args) {
		// if 조건문과 for 반복문 연습
		
		// 변수 선언 및 초기화
		int i = 0;
		int sum = 0;
				
		// 0. 1 ~ 10까지의 합
		for(i = 1; i <= 10; i = i + 1) {
			sum = sum + i;
		}
		System.out.println("1 ~ 10까지의 합 : " + sum);
		
		// 0-1. 1 ~ 10까지의 짝수 출력
		for(i = 1; i <= 10; i = i + 1) {
			if(i % 2 == 0) {
				System.out.println("1 ~ 10까지의 짝수 : " + i);
			}
		}
		
		// 0-2. 1 ~ 10까지의 홀수 출력
		for(i = 1; i <= 10; i = i + 1) {
			if(i % 2 != 0) {
				System.out.println("1 ~ 10까지의 홀수 : " + i);
			}
		}

	}

}
