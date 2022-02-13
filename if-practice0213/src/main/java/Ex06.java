
public class Ex06 {

	public static void main(String[] args) {
		// if 조건문과 for 반복문 연습
		
		// 6. 1~10까지의 수에서 홀수의 합을 출력하는 프로그램을 구현하라.(for, if, %연산자 사용)
		
		// 변수 선언 및 초기화 (홀수의 합을 누적할 변수)
		int sum = 0;
		
		for(int i = 1; i <= 10; i = i + 1) {
			if(i % 2 != 0) {
				sum = sum + i;
			}
		}
		System.out.println("1 ~ 10에서 홀수의 합 : " + sum);

	}

}
