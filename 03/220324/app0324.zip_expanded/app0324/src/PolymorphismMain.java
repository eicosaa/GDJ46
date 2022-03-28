import java.util.ArrayList;

public class PolymorphismMain {

	public static void main(String[] args) {
		Vegetable v1 = new Vegetable(1000, "당근", "전북");
		Vegetable v2 = new Vegetable(3000, "배추", "대관령");
		Vegetable v3 = new Vegetable(1500, "시금치", "파주");
		
		Noodle n1 = new Noodle(2000, "신라면", "농심");
		Noodle n2 = new Noodle(1500, "진라면", "오뚜기");
		Noodle n3 = new Noodle(1300, "삼양라면", "삼양");
		
		Computer c1 = new Computer(1000000, "그램", "LG", 1);
		Computer c2 = new Computer(800000, "싱크패드", "레노버", 1);
		Computer c3 = new Computer(2000000, "맥북프로", "애플", 1);
		
		// 다형성 문법을 사용하지 않으면
		// 1) System.out.println(v1.name + v1.price); // 9번
		// 2) ArrayList<Vegetable>, ArrayList<Noodle>, ArrayList<Computer> // 반복문 3번
		
		// 다형성을 적용하면 -> 다형성 적용이 가능하도록 설계(추상화, 상속, ...)
		// 3) // 반복문 1번
		
		ArrayList<Product> list = new ArrayList<Product>();
		list.add(v1);
		list.add(v2);
		list.add(v3);
		
		list.add(n1);
		list.add(n2);
		list.add(n3);
		
		list.add(c1);
		list.add(c2);
		list.add(c3);
		
		for(Product p : list) { // 반복문 한번으로
			System.out.println(p.name + " " + p.price + "원");
		}
	}

}
