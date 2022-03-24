package gdj46;

public class MemberMain {

	public static void main(String[] args) {
		Member m; // Member 객체 변수 m
		m = new Member(); 
		// new연산자 : 객체 생성
		// 생성자 : 어떤 구조를 가진 객체를 생성
		// Member() : no = 0, name = null 이라는 필드 + hello() 메서드 구성
		// m에는 new와 Member()로 만들어진 객체(다수의 값)의 위치(참조)값이 대입
		// 
		m.no = 1;
		m.name = "루피";
		System.out.println(m.name);
		m.hello(); // -hello()에서 this.name -> m.name
		
		Member m2 = new Member();
		m2.name = "나미";
		m2.hello(); // -hello()에서 this.name -> m2.name
		
		Member m3 = new Member(3, "조로");

	}

}
