package gdj46;

public class Member {
	// 1) 필드
	public int no;
	public String name;
	
	// 필드와 메서드가 관계가 없을까?
	// 필드와 메서드를 통신할 수 없을까?
	
	// 2) 메서드
	
	// 2-1) 생성자 메서드
	public Member() { 
		// no = 0, name = null -초기화를 바꿀 수 있다.
		/*
		 * this.no 1; 
		 * this.name = "";
		 */
	}
	
	public Member(int no, String name) {
		// this(); // -this();는 Member()를 가리킨다.
		this.no = no; // -this.no는 필드의 no를 가리키고, no는 Member(int no, String name)의 int no를 가리킨다.
		this.name = name;
	}
	
	// 2-2) 일반 메서드
	public void hello() {
		System.out.println(this.name + "hello");
	}
}
