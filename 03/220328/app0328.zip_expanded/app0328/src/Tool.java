
public abstract class Tool { // 상속
	public String name;
	public int power;
	// 객체를 통해 호출이 목적이 아니고
	// 자식 클래스에서 오버라이딩을 위한...
	// 미완성된 메서드 상태로 둔다 -> 추상메서드
	public abstract void play();
}
