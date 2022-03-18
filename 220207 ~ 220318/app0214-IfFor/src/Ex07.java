
public class Ex07 {

	public static void main(String[] args) {
		// if, for 실습 예제
		
		/* 7.  for, if문등을 사용하여 2014년에서 2500년 사이의 윤년을 출력하는 프로그램을 구현하라.
		다음의 경우가 윤년이다.
		① 400로 나누어 떨어지는 해
		② 4로 나누어 떨어지지만 100으로는 나누어 떨어지지 않는 해 */
				
		for(int i = 2014; i <= 2500; i++) {
			if((i % 400 == 0) || (i % 4 == 0 && i % 100 != 0)) {
				System.out.println(i);
			}
		}

	}

}
