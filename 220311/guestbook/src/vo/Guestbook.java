package vo;

public class Guestbook {
	public Guestbook() { } // 생성자 메서드
	
	public int guestbookNo;
	public String guestbookContent;
	public String writer;
	public String createDate;
	public String updateDate;
	
	/*
 	1. 필드(멤버 변수)
 		일반 필드 / 정적(static)필드
 	2. 메서드(멤버 함수)
 		일반 메서드 / 정적(static)메서드 / 생성자 메서드
 	3. 내부 클래스
	*/

	/*
	// 생성자 메서드 : 반환 타입이 없고 클래스 이름과 동일한 메서드
	// 모든 클래스에는 하나 이상의 생성자 메서드가 구현되어야 한다.
	public Guestbook() { // 생성자 메서드
	} // 디폴트 모양 <- 디폴트 생성자
	public Guestbook(int x) {
	}
	public Guestbook(int x, int y) {
	}
	public Guestbook(String x) {
	}
	// 메서드는 이름이 같아도 매개 변수가 다르면
	// 동일한 이름으로 구현 가능 -> 메서드 오버로딩
	// Guestbook gb = new Guestbook();
	*/
}

/*
	public 반환 타입 메서드 이름(입력 매개 변수1, 입력 매개 변수2, ...) {
		내용
		return 반환값;
	}
*/

/*
	public int add(int n1, int n2) {
		int r = n1 + n2;
		return r; // 메서드식의 종료 뒤에 값을 남깁니다.
		// -r이라는 식은 값으로 변경, return은 값을 반환
	}
*/