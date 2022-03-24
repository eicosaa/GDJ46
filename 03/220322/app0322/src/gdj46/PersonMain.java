package gdj46;

public class PersonMain {

	public static void main(String[] args) {
		Person p; // public Person 이니까 접근 가능
		p = new Person(); // public 이니까 접근 가능
		
		// p.age = 20; // public 이니까 접근 가능 // private 이니까 접근 불가
		// p.name = "조로"; // public 이니까 접근 가능 // private 이니까 접근 불가
		// System.out.println(p.age + p.name); // public 이니까 접근 가능 // private 이니까 접근 불가
		
		p.setAge(20);
		p.setName("조로");
		System.out.println(p.getAge() + p.getName());
		
		// -> Person 필드가 정보 은닉
		// -> Person 필드가 캡슐화
		
		/*
		Person p; // public Person 이니까 접근 가능
		p = new Person(); // public Person() 이니까 접근 가능
		// p.age = 1; // public int age 이니까 접근 가능 // -private int age 이라면 접근 불가능
		p.setAge(1);
		p.name = "루피"; // public String name 이니까 접근 가능
		
		System.out.println(p.getAge()); 
		// -private int age 이라면 System.out.println(p.age); 출력 불가능
		System.out.println(p.name);
		*/
	}

}
