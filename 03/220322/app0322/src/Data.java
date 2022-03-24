// 코드에 명시하지 않으면 컴파일러에 의해 자동으로 생성되는 코드
// 1)  java.lang 패키지 임포터
import java.lang.*; // String, Integer, System... 풀네임을 사용하지 않고도...

// 2) 오브젝트를 상속받는 코드
public class Data extends Object {
	// 1) 정보 은닉(필드)
	private int x; 
	
	// 2) 캡슐화
	public void setX(int x) { // -쓰기
		/*
		if(y > 0 && y < 101) {
			this.x = y;
		} else {
			System.out.println("값을 잘못 입력");
		}
		*/
		this.x = x;
	}
	public int getX() { // -읽기
		return this.x;
	}
	
	// 1) 정보 은닉(메서드)
	private void one() {
	}
	private void two() { 
	}
	// 2) 캡슐화
	public void oneAndTwo() {
		this.one();
		this.two();
	}
	
	/*
	public int x;
	public String y;
	
	// 3) 디폴트 생성자 + 일반 필드를 초기화(0, false, null)
	public Data() { 
		this.x = 0;
		this.y = null;
	}
	*/
	
	/*
	// 일반 필드
	public int x;
	
	// 일반 메서드
	public void setX() {
		this.x = 100;
	}
	*/
}

// public > protected > default > private