package ex;

public class TestMain {

	public static void main(String[] args) {
		Test t1 = new Test();
		
		t1.name = "자바";
		t1.hello();
		
		Test t2 = new Test();
		
		t2.name = "46기";
		t2.hello();
		
		Test.hi();
	}
}
