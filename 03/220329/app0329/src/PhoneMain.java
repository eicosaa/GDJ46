
public class PhoneMain {
	public static void main(String[] args) {
		Person p = new Person();
		p.call(new Phone());
		// 매개변수 다형성 상속 문법을 사용
		p.call(new SmartPhone()); // 다형성
		// 매개변수 다형성 익명 클래스를 사용
		p.call(new Phone() { // 클래스, 추상클래스, 인터페이스의 생성자 가능
			@Override
			public void send() {
				System.out.println("이야기를 하고 데이터를 보내다");
			}
		});
	}
}

class Person {
	public void call(Phone p) {
		p.send();
	}
}

class Phone {
	public void send() {
		System.out.println("이야기를 하다");
	}
}

class SmartPhone extends Phone {
	@Override
	public void send() {
		System.out.println("이야기를 하고 데이터를 보내다");
	}
}