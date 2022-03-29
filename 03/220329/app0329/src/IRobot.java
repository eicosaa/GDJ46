
public interface IRobot { // 추상 클래스의 사촌
	// static 멤버는 추상 클래스와 동일
	public static int id = 10;
	public static void exe() {
		System.out.println("test");
	}
	
	// 일반 필드 멤버는 추상클래스와 다르게 가질 수 없다.
	// public String name;
	
	// 일반 메서드는 default메서드라는 형태로 가질 수 있다.
	public default void play() {
		System.out.println("play");
	}
	
	// 추상메서드
	public abstract void make();
	
	
	// 추상클래스와 차이
	// 1) 일반 필드를 가질 수 없다
	// 2) 일반 메서드는 default 메서드로 만들어야한다.
	// 3) 인터페이스를 상속(extends)받으면 자식 인터페이스가 된다.
	// 4) 인터페이스를 구현(implements)하면 자식 클래스가 된다.
	// -> 인터페이스 대신 추상클래스를 사용하지?
	// -> 왜 굳이 인터페이스를 사용?
	// -> 인터페이스를 사용하면 다중상속에 효과
}
