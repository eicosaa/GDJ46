import java.util.ArrayList;
import java.util.HashMap;

public class ObjectMain {

	public static void main(String[] args) {
		// 직접적인 상속 관계의 클래스의 다형성
		Dog dog = new Dog();
		Cat cat = new Cat();
		
		// 1) List
		ArrayList<Animal> animalList = new ArrayList<Animal>();
		animalList.add(dog);
		animalList.add(cat);
		// 2) Map
		HashMap<String, Animal> animalMap = new HashMap<String, Animal>();
		animalMap.put("멍멍이", dog);
		animalMap.put("야옹이", cat);
		animalMap.get("멍멍이").cry(); // 멍멍
		animalMap.get("야옹이").cry(); // 야옹
		
		// 직접적인 상속 관계가 없는 클래스의 다형성
		Bird bird = new Bird();
		Computer computer = new Computer();
		
		// 1) List
		ArrayList<Object> list = new ArrayList<Object>();
		list.add(bird);
		list.add(computer);
		// 2) Map
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("짹쨱이", bird);
		map.put("컴퓨터", computer);
		if(map.get("짹쨱이") instanceof Bird) {
			((Bird)(map.get("짹쨱이"))).cry();
		}
		if(map.get("컴퓨터") instanceof Computer) {
			System.out.println(((Computer)(map.get("컴퓨터"))).cpu); // 0
		}
	}
}
