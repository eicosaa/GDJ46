import java.util.ArrayList;

public class AnimalMain {
	public static void main(String[] args) {
		Dog d = new Dog();
		d.cry(); // 멍멍
		Cat c = new Cat();
		c.cry(); // 야옹
		Bird b = new Bird();
		b.cry(); // 짹짹
		
		// 다형성 코드 오버라이딩을 사용하는 예
		ArrayList<Animal> list = new ArrayList<Animal>();
		list.add(d);
		list.add(c);
		list.add(b);
		
		for(Animal a : list) {
			a.cry(); // 한번의 cry()호출로 모든 객체의 cry()호출
		}
	}
}
