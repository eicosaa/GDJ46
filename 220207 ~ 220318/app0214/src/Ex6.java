
public class Ex6 {

	public static void main(String[] args) {
		// 형변환 연산자 : 특정 타입의 값을 다른 타입으로 변경하는 연산자
		
		int a = 0;
		long b = 0L;
		a = (int)10L; // 타입이 다르면 형을 변환 후 대입
		b = (long)10;
		b = 10; // 자바 컴파일러에 의해서 b = (long)10;로 코드가 수정됨 -> 자동 형변환 -> long이 int보다 더 포괄적인 타입이다.
		a = (int)b;
		b = a; // 자동 형변환
		
		float c = 0.0F;
		double d = 0.0;
		c = (float)d;
		d = c; // 자도 형변환
		
		// 실수는 정수보다 더 포괄적인 타입
		d = a; // 자동 형변환
		a = (int)d; // 소수점 이하가 잘리기 때문에 자동 형변환은 안된다.
		
		// 사칙연산은 연산자의 타입이 동일해야지만 연산이 가능하다
		double f = 2.7 + 3; // 이 경우에도 2.7 + (double)3으로 자동 형변환이 된다.
		
		double g = 5 / 2; // 5 / 2 정수 연산 결과 2 -> g = (double)2 -> 2.0
		double h = (double)5 / 2; // 2가 자동 형 변환 연산이 발생하여 5.0 / 2.0 -> 2.5
		System.out.println(g); // 2.0
		System.out.println(h); // 2.5
		
	}

}
