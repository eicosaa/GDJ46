
public class Out2 {
	public void println(int x) {
		System.out.println(x);
	}
	// 1) 오버로딩
	public void println(byte x) {
		System.out.println(x);
	}
	// 2) 기본타입(primitive type) 8개
	public void println(short x) {
		System.out.println(x);
	}
	public void println(long x) {
		System.out.println(x);
	}
	public void println(float x) {
		System.out.println(x);
	}
	public void println(double x) {
		System.out.println(x);
	}
	public void println(char x) {
		System.out.println(x);
	}
	public void println(boolean x) {
		System.out.println(x);
	}
	// 기본타입 8 + Object타입을 매개로 받는
	public void println(Object x) { // 다형성 모든 타입을 다 받는다
		System.out.println(x.toString());
	}
}
