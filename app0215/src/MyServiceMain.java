import service.MyService;
public class MyServiceMain {

	public static void main(String[] args) {
		MyService myService = new MyService();
		// 일반 메소드
		myService.greet();
		int result = myService.add(7, 8);
		System.out.println(result);
		// static 메소드
		MyService.play(); // -변수를 만들지 않고 static이 있어서 호출가능
		
		// -Math.random(); // -static 메소드
		// -request.getParameter(""); // -request는 static 메소드는 아니지만 톰캣 내장 객체이다.
		// -클래스 이름은 무조건 대문자, 변수 이름은 소문자
	}
}
