
public class Ex3 {

	public static void main(String[] args) {
		// 참조 타입
		
		// 1. String이라는 탐조 타입(이미 자바 문법적으로 제공하는 클래스 참조 타입)
		String s1 = new String("자바"); // new 연산자는 참조 타입 값(객체)을 만드는 곳에 사용되는 연산자
		String s = new String("자바");
		String s2 = "자바";
		String s3 = "자바";
		System.out.println(s1);
		System.out.println(s2);
		System.out.println(s1 == s2); // false // String 타입의 비교(등호)시 ==보다는 equals()메서드를 사용하자.
		System.out.println(s2 == s3); // true
		System.out.println(s1 == s); // false
		System.err.println("equal 비교 : " + s1.equals(s2)); // true
		
		// 2. 클래스라는 사용자 정의 참조 타입
		// - 클래스의 역할
		// 1) 데이터 타입(참조 타입) 역할
		// 2) 메서드를 담고 있는 상자(컨테이너) 역할
		Student student = null; // null 참조 타입이 아무것도 가르칠 것이 없다는 초기값
		student = new Student(); // student 객체 참조 변수, 객체 변수
		student.no = 17; // . 객체 참조 연산자 ~의, ~에, of, in, 소유격
		student.age = 30;
		System.out.println(student.no);
		System.out.println(student.age);

	}

}
