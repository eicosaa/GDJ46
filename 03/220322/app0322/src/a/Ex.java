package a;

public class Ex {
	public void execute() {
		// Test 클래스의 필드들을 사용
		Test t = new Test();
		t.a = 1;
		t.b = 2;
		t.c = 3;
		// 같은 패키지에서 public, protected, default
		// t.d = 4;
	}
}
