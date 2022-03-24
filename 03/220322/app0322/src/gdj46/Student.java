package gdj46; // 클래스 이름 중복되지 않게 긴 이름으로...
// import java.lang.String; // String 클래스의 풀네임을 코드에서 짧게 표현하기 위해서...
// 자바 컴파일러 자동으로 import java.lang.* 추가하기 때문에 String import구문 생략

import java.util.ArrayList;


// 접근 지정자 : public > protected > default(표시하지 않는 것) > private
public class Student {
	// 1) 생성자 메서드
	public Student() { } // 디폴트 생성자의 경우 역시 하나의 생성자도 없다면 자동으로 추가
	public Student(int no) { // 메서드 오버로딩
		// -int no라는 매개변수를 받는 Student 클래스
	}
	
	// 2) 필드 : 모든 데이터 타입
	public int no; // 기본 타입(8개) 필드
	public Integer no2; // 랩퍼 참조 타입 필드
	public String name; // String 참조 타입 필드
	public String[] hobby; // 배열 참조 타입 필드
	public ArrayList<String> phone; // 컬렉션 참조 타입 필드
	public Ban ban; // 사용자 정의 클래스 참조 타입 필드
	// Student s1 = new Student(); 
	// s1.no; -접근 방법 // 클래스의 객체가 생성될 때마다 no 변수가 생성

	// 2-1) static 필드
	public static int id; // 클래스 이름으로 접근 
	// Student.id; -접근 방법 // 클래스 당 하나의 id 변수가 생긴다.
	
	// 3) 메서드
	public void hello() {
		System.out.println("hello");
	}
	// Student s1 = new Student();
	// s1.hello();
	
	// 3-1) static 메서드
	public static void hi() {
		System.out.println("hi");
	}
	// Student.hi();
	
	// 4) 내부 클래스
	public class InCls {
		public int x;
	}
}

class Ban { 
	public String loc;
} 
// 자바는 파일의 이름과 클래스 이름이 동일, 파일 안에 클래스 두개 이상이라면
// public class 이름과 파일 이름 동일 해야한다.
// 하나의 파일 안에 여러 개의 클래스를 생성은 가능하지만 public 클래스는 하나만...
// -public class Ban { }은 불가능, class Ban { }은 가능
