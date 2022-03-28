
public class Cat extends Animal {
	
	@Override // 이 메서드는 오버라이딩 -부모하고 동일한 메서드를 갖는다
	public void cry() { // 오버라이딩
		System.out.println("야옹");
	}
	
	public static void main(String[] args) {
		Cat c = new Cat();
		c.cry();
	}
}
