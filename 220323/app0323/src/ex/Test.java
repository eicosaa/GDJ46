package ex; // 패키지

public class Test { // ex.Test
	
	public String name;
	public static int banId;
	
	// 메서드가 다른 구성 요소와 통신하는 방법
	
	// 1) 일반 메서드에서 static 필드
	public void hello() { // hello에서 name을 접근
		Test.banId = 8;
		this.name = "자바";
	}
	
	// 2) static 메서드에서 static 필드 접근 
	public static void hi() {
		Test.banId = 8;
		// this.name = "자바"; // static this를 사용할 수 없다.
	}
}

/* 1.
public class Test { // ex.Test
	// 1) 생성자 메서드
	public Test() { } 
	// 2) 일반 메서드
	public void hello() {
		System.out.println("안녕하세요");
	}
	// 3) static 메서드
	public static void hi() {
		System.out.println("안녕");
	}
}

// 하나의 파일에 두 개의 클래스가 올 때는 하나만 public
class Test2 { // default 접근 제한자 : 같은 패키지 
	public Test2() { } // 2) 생성자 
}
*/

/* 2.
public class Test { // ex.Test
	// 4) 일반 필드
	public int num;
	
	// 5) static 필드
	public static int banNum;
	
	// 6) 일반(객체 멤버) 내부 클래스
	public class InTest {
		public InTest() { }
		public int x;
	}
	
	// 7) static(클래스 멤버) 내부 클래스
	public static class InTest2 {
		public InTest2() { }
		public int y;
	}
}
*/

/* 3.
public class Test { // ex.Test
	
	public String name;
	
	// 메서드가 다른 구성 요소와 통신하는 방법
	
	// 1) 일반 메서드에서 일반 필드
	public void hello() { // hello에서 name을 접근
		// 메서드에서 필드 통신 : 동일한 객체의 필드만 통신
		// t1.hello() -> t1.name 통신
		// t2.hello() -> t2.name 통신
		System.out.println(this.name + "안녕");
	}
}
*/

/* 4.
package ex; // 패키지

public class Test { // ex.Test
	
	public String name;
	
	// 메서드가 다른 구성 요소와 통신하는 방법
	
	// 1) 일반 메서드에서 일반 필드
	public void hello() { // hello에서 name을 접근
		// 메서드에서 필드 통신 : 동일한 객체의 필드만 통신
		// t1.hello() -> t1.name 통신
		// t2.hello() -> t2.name 통신
		System.out.println(this.name + "안녕하세요");
		// this라는 키워드를 통해 동일 객체를 접근
	}
	
	// 2) static 메서드에서 일반 필드 접근 
	public static void hi() {
		// 클래스 메서드는 this 키워드를 사용할 수 없다.
		// this가 Test라는 클래스를 가르킬 수 없다.
		// 순서 상 static이 먼저 로드되기 때문에...
		// System.out.println(this.name + "안녕");
		// 그럼에도 불구하고 일반 필드 통신을 원한다면 객체를 만들어서 사용
		Test t = new Test();
		t.name = "자바";
		System.out.println(t.name + "안녕");
	}
}
*/

/* 5.
package ex; // 패키지

public class Test { // ex.Test
	
	public String name;
	public static int banId;
	
	// 메서드가 다른 구성 요소와 통신하는 방법
	
	// 1) 일반 메서드에서 static 필드
	public void hello() { // hello에서 name을 접근
		Test.banId = 8;
		this.name = "자바";
	}
	
	// 2) static 메서드에서 static 필드 접근 
	public static void hi() {
		Test.banId = 8;
		// this.name = "자바"; // static this를 사용할 수 없다.
	}
}
*/