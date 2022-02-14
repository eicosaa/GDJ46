
public class Ex11 {

	public static void main(String[] args) {
		// if, for 실습 예제
		
		// 11. 다음과 같은 출력 결과물(가로 구구단)이 나오도록 구현하라.
		
		for(int i = 2; i <= 9; i++) {
			for(int j = 1; j <= 9; j++) {
				System.out.print(i + "*" + j + "=" + i*j + " ");
			}
			System.out.println("");
		}

	}

}
