
public class C extends A{ // 상속(is)
	// -A가 가진 것을 C도 갖는다
	
	public C() {
		super(); // A();
	}
	
	public int sn;
	
	public static void main(String[] args) {
		C c = new C();
		c.name = "자바";
		c.sn = 666;

	}
}
