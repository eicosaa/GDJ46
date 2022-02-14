
public class Ex13 {

	public static void main(String[] args) {
		// if, for 실습 예제
		
		// 13. 다음과 같이 출력하라
		
		for(int i = 0; i < 10; i++) {
			for(int j = 0; j <= 9; j++) {
				if(j == i || j == (9 - i)) {
					System.out.print("*");
				} else {
					System.out.print(" ");
				}
			}
			System.out.println();
		}

	}

}
