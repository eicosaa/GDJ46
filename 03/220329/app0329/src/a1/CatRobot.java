package a1;

public class CatRobot extends Cat implements IRobot { // 다중 상속이 안된다!
	public static void main(String[] args) {
		CatRobot cr = new CatRobot();
		cr.age = 3;
		cr.cry();
		cr.off(); 
	}
}	
// 부모클래스 중 하나를 인터페이스 변경
// 둘 중 어떤 것을 인터페이스 하느냐? 
// 필드가 없는 클래스(Robot)를 인터페이스로 하는게 최선
