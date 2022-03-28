// B를 테스트
public class BMain {
	public static void main(String[] args) {
		B b = new B();
		b.a = new A();
		b.a.name = "자바";

		System.out.println(b.a.name);

	}
}
