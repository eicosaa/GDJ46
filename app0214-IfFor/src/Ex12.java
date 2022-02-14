
public class Ex12 {

	public static void main(String[] args) {
		// if, for 실습 예제
		
		// 12. 다음과 같은 출력 결과물(세로 구구단)이 나오도록 구현하라.
		
		for(int i = 1; i <= 9; i++) {
			for(int j = 2; j <= 9; j++) {
				System.out.print(j + "*" + i + "=" + i*j + " ");
			}
			System.out.println("");
		}

	}

}
