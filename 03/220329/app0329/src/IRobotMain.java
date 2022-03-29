
public class IRobotMain {

	public static void main(String[] args) {
		System.out.println(IRobot.id);
		IRobot.exe();
		
		// 인터페이스 추상클래스와 동일하게 객체를 생성할 수 없다.
		// IRobot irobot = new IRobot();
		
		Robot r1 = new Robot();
		r1.make();
		r1.play();
		
		IRobot r2 = new Robot(); // 다형성
		r2.make();
		r2.play();
	}

}
