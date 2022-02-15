import vo.Person; // 코드에서 vo.Person풀네임 대신 Person이름으로 대신
// Person -> vo.Person

public class PersonMain {

	public static void main(String[] args) {
		// 1. 데이터 변수 선언
		vo.Person person = null;
		// 2. 참조 값을 할당
		
		// 혜민님의 정보를 다른 곳으로 이동하기 위해 하나의 변수만 이용하면 된다.
		person = new vo.Person(); // 숫자 0, 참조값 null 초기화
		person.name = "구혜민";
		person.age = 25;
		person.gender = '여';
		person.married = false;
		
		System.out.println(person); // 위치값 출력 (vo.Person@379619aa)
		System.out.println(person.name);
		System.out.println(person.age);
		System.out.println(person.gender);
		System.out.println(person.married);
		
		String s = "자바";
		System.out.println(s); // 실제 가르키는 값이 출력 -> String은 특별한 참조 타입
	}

}
