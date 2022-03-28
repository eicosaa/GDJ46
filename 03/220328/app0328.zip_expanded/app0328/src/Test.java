
public class Test {

	public static void main(String[] args) {
		// 1) 상속
		B b = new B();
		b.x = 1;
		b.y = 2;
		
		// 2) 다형성
		A a = new B(); // 자식 객체는 부모타입에 대입된다.
		
		// 3) 오버라이딩 -부모가 가진 것을 재정의한다.
		a.exe(); // B의 exe()가 호출된다. 오버라이딩
		
		// 4) 추상클래스
		D d = new D(); // d객체 생성은 가능하고
		// C c = new C(); // 자식클래스의 생성가능. private생성자는 해결책이 아니다
		
		// C2 c2 = new C2(); // 추상클래스는 객체를 만들 수 없다.
		
	}
}

// 상속 -> 다형성구현 -> 오버라이딩을 구현 -> 추상클래스 -> 추상메서드

// 5) 추상메서드
abstract class C2 { 
	// 상위클래스 사용이 목적이고 exe메서드는 오버라이딩이 목적이다.
	// 이런 목적의 메서드는 구현부{}이 없는 메서드로 -> 추상 메서드 -> 추상 메서드를 가지는 클래스는 추상클래스
	public abstract void exe();
}

// 4) 추상클래스
abstract class C { // 추상클래스는 객체를 만들 수 없지만 자식클래스는 만들어진다.
	// private C() { } // C 클래스의 자식클래스를 생성x, D클래스 에러 발생
	int z;
}
class D extends C {
	
}

// 1) 상속 -부모가 가진 것을 자식도 갖을 수 있다. 2) 다형성
class A {
	int x;
	
	// 3) 오버라이딩
	public void exe() {
		System.out.println("A exe");
	}
}
class B extends A { // -B는 y와 x를 갖는다.
	int y;
	
	// 3) 오버라이딩
	@Override
	public void exe() {
		System.out.println("B exe");
	}
}
