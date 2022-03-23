package ex;

public class User {
	// 자바 언어 개발자들은 모든 필드를 정보 은닉 <- 약속
	private String id;
	private String pw;
	
	// 필드 읽기 메서드 -> Getter
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	
	// 필드 쓰기 메서드 -> Setter
	public void setId(String id) {
		this.id = id;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
}
