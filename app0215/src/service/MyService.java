package service;

public class MyService { // 클래스의 역할 : 기능(명령, 메소드)의 컨테이너
	/*
	 * 리턴 타입 메소드이름(입력 타입) {
	 * 
	 * }
	 */
	public static void play() {
		System.out.println("놀다");
	}
	public void greet() {
		System.out.println("hello");
	}
	public int add(int x, int y) {
		int z = x + y;
		return z;
	}
}
