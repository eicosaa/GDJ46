package b;

import a.Test;

public class Ex2 {
	public void execute() {
		// Test 클래스의 필드들을 사용
		Test t = new Test();
		t.a = 1; // public만 다른 패키지에서 접근 가능
		
		// 패키지 다르면 protected, default도 접근이 안된다.
		// t.b = 2;
		// t.c = 3;
		
		// 같은 패키지에서 public, protected, default (-접근 가능)
		// t.d = 4;
	}
}
