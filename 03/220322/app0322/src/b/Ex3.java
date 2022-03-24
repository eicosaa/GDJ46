package b;

import a.Test;

// Ex3 클래스는 Test 클래스를 상속받았다.
// Test 클래스와 거의 동일하다.
public class Ex3 extends Test {
	/*
	public int a;
	protected int b;
	int c;
	private int d;
	*/
	public void execurt() {
		System.out.println(this.a);
		System.out.println(this.b);
		// System.out.println(this.c);
		// System.out.println(this.d);
	}
}
