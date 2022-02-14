
public class Ex06 {

	public static void main(String[] args) {
		// if, for 실습 예제
		
		// 6. 1~10까지의 수에서 홀수의 합을 출력하는 프로그램을 구현하라.(for, if, %연산자 사용)
		
		int sum = 0;
				
		for(int i = 1; i <= 10; i = i + 1) {
			if(i % 2 != 0) {
				sum = sum + i;
			}
		}
		System.out.println("1 ~ 10에서 홀수의 합 : " + sum);

	}

}
