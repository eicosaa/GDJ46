
public class Test2 {
	public static void main(String[] args) {
		Three t = new Three();
		// t.id = 10; // id는 final이 붙은 상수
	}
}

// final은
// 1) 클래스 앞에서는 자식을 더이상 확장할 수 없는 마지막 클래스
// 2) 메서드 앞에서는 재정의(오버라이딩)을 할 수 없는 마지막 메서드 내용
// 3) 변수 앞에서는 값을 변경할 수 없는 마지막 변수 값

final class One { }

// class One2 extends One { } // final 클래스는 자식클래스가 확장 안된다.

class Two {
	public final void exe() {
		System.out.println("Two exe");
	}
}

class Two2 extends Two {
	/* final 메서드는 자식클래스에서 오버라이딩이 안된다.
	@Override
	public final void exe() {
		System.out.println("Two2 exe");
	}
	*/
}

class Three {
	public final int id = 7;
}
