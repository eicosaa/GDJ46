
public class DataMain {

	public static void main(String[] args) {
		Data d = new Data();
		// d.x = 7; // 쓰기
		// 직접적으로 priavate 필드를 접근 x
		// 간접적으로 public setX()메서드를 이용
		d.setX(100);
		
		// 직접적으로 priavate 필드를 접근 x
		// System.out.println(d.x); // 읽기
		System.out.println(d.getX());
		
		/*
		d.oneAndTwo();
		
		// -이것을 막고 싶어서 oneAndTwo()를 만들었다. 메서드의 정보은닉
		d.two(); // 직접적으로 priavate 필드를 접근 x
		d.one();
		*/
		
		/*
		// Data라는 클래스
		// 1) int x를 저장/읽기를 할 수 있는 역할
		// 2) setX()메서드를 호출할 수 있다
		
		Data d1 = new Data(); // Data타입으로 만든 d 객체는 위의 2가지 역할을 한다.
		Data d2 = new Data();
		
		// 1)
		d1.x = 7; // x에 7 저장
		System.out.println(d1.x); // x 읽기
		d2.x = 77;
		System.out.println(d2.x); // x 읽기
		
		// 2) 
		d1.setX(); // x의 값을 100으로 변경
		d2.setX();
		*/
	}
}
