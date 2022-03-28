
public class B {
	// 포함(has)
	public A a;
	public int sn;
	public static void main(String[] args) {
		B b = new B();
		b.a = new A();
		b.a.name = "자바";
	}
}
