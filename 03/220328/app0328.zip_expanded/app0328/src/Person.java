
public class Person {
	// 다형성을 이용해 3개의 메서드를 하나로 ... 
	public void doTool(Tool t) {
		// Tool은 play메서드가 없지만 Tool을 상속받은 자식 클래스는 play rk dlTek.
		// 오바라이딩을 사용하면
		t.play();
	}
	
	public static void main(String[] args) {
		Person p = new Person();
		
		Tool h = new Hammer(); // 다형성
		p.doTool(h);
		
		Ax a = new Ax();
		p.doTool(a);
		
		Sword s = new Sword();
		p.doTool(s);
		
		// 다음의 코드가 실행되지 않게...
		// Tool t = new Tool(); // 추상클래스는 객체를 생성할 수 없다.
		// t.play(); // 추상메서드는 호출x
		// p.doTool(t); // doTool() -> t.play() // 추상메서드는 호출x
	}
}
