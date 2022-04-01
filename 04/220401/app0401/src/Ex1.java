
public class Ex1 {
	public static void main(String[] args) {
		int x = 0;
		int y = 0;
		int z = 0;
		
		// 자바의 오류 코드
		// 1) error
		// int x = 10;
		// x = "test"; // 컴파일 에러 - 문법 오류
		
		// 2) exception
		y = 1;
		z = x / y; // - 0 = 0 / 0이면 에러
		System.out.println(z);
		// int = int / int; 문법적으로 아무 이상이 없다 
		// -> 실행하면 무한대 값의 부재로 예외가 발생
		// new java.lang.ArithmeticException()
		// ArithmeticException 타입의 객체를 생성 
		// JVM은 실행 시점에 메모리 안에 Exception타입(자식 타입 포함)의 객체가 
		// 생성되면 프로그램을 바로 중지! -> 예외발생
		String s = null;
		try { // 예외 객체가 생성되지 않으면 try
			System.out.println(s.substring(3)); // new java.lang.NullPointerException
			System.out.println("try...");
		} catch (NullPointerException e) { // try 객체가 생성되면 catch
			// catch절이 예외 해결은 아니고
			// 예외 발생 시 강제종료 대신 경고창 후 안전하게 종료한다.
			// e.printStackTrace(); // -에러 디버깅코드
			System.out.println("시스템 사정으로 중지하겠습니다.");
		}
		// -s.substring -> s안의 글자를 3번째부터 잘라준다. 
		
		// 3)  error 처리가 되는 exception
		try {
			System.out.println("begin try");
			Class c = Class.forName("java.lang.S");
			System.out.println(c.getClass());
			System.out.println("end try");
		} catch (Exception e) { // -(ClassNotFoundException e)
			System.out.println("begin catch");
			e.printStackTrace(); // -에러 디버깅코드
			System.out.println("end catch");
		} finally { // -무조건 출력
			System.out.println("finally");
		}
	}
}
