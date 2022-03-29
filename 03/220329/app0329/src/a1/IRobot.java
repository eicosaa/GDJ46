package a1;

public interface IRobot {
	public default void off() {
		System.out.println("전원을 끄다");
	}
}
