package gdj46;

public class Person {
	private int age;
	private String name;
	
	// 우클릭 > Source > Generate Getters and Setters
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
	
	
	
	/*
	// getter 메서드
	public int getAge() {
		return this.age;
	}
	
	// setter 메서드
	public void setAge(String name) {
		this.name = name;
	}
	*/
	
	/*
	// public int age;
	private int age; // 정보 은닉
	public String name;
	
	public Person() { }
	
	// 캡슐화 : 은닉된 정보를 간접적으로 접근 허가
	public int getAge() {
		// int x = this.age;
		// return x;
		
		return this.age;
	}
	
	public void setAge(int age) {
		if(age < 0) {
			return;
		}
		this.age = age;
	}
	*/
}
