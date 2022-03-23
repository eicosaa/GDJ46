
public class Car {
	public void drive() {
		System.out.println("주행");
	}
}

// 1) 복사 : Car 멤버가 변경되면 다시 복사해야 되는 단점이 있음.
class SmartCar1 {
	// Car가 가진 모든 멤버를 가져야한다.
	public void drive() {
		System.out.println("주행");
	}
	public void selfDrive() {
		System.out.println("자율 주행");
	}
}

// 2) 포함 (has관계)
class SmartCar2 {
	// Car가 가진 모든 멤버를 가져야한다.
	public Car car;
	public void selfDrive() {
		System.out.println("자율 주행");
	}
}

// 3) 상속 (is관계)
class SmartCar3 extends Car {
	// Car가 가진 모든 멤버를 가져야한다.
	public void selfDrive() {
		System.out.println("자율 주행");
	}
}