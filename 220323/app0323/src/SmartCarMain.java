
public class SmartCarMain {

	public static void main(String[] args) {
		// 복사
		SmartCar1 c1 = new SmartCar1();
		c1.drive();
		c1.selfDrive();
		
		// has관계(포함)
		SmartCar2 c2 = new SmartCar2();
		c2.car = new Car();
		c2.car.drive();
		c2.selfDrive();
		
		// is관계(상속)
		SmartCar3 c3 = new SmartCar3();
		c3.drive();
		c3.selfDrive();

	}

}
