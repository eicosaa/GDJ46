
public class Ex08 {

	public static void main(String[] args) {
		// if, for 실습 예제
		
		// 8. for, if문 등을 사용하여 소수(1제외)를 판별하는 프로그램을 구현하라.
		// (소수란 1과 자기 자신만으로 나누어 떨어지는 1보다 큰 양의 정수. 
		// 이를테면, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31,… 등은 모두 소수이다)

		int num = 37;
		
		for(int i = 2; i < num; i = i + 1) {
			if(num % i != 0) {
				System.out.println(num + " 소수 입니다.");
			} else {
				System.out.println(num + " 소수가 아닙니다.");
			} 
			break;
		}
	}

}
