package a;

public class Test {
	// public(모두) > 
	// protected(같은 패키지 + 상속) >
	// default(같은 패키지) 
	// private(this 참조 키워드로)
	public int a;
	protected int b;
	int c;
	
	// 같은 클래스 내 멤버 메서드에서 
	// this 참조 키워드로만 접근 가능
	private int d; 
}
