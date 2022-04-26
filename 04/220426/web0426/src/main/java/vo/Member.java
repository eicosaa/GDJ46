package vo;

public class Member {
	private String id;
	private String pw;
	private int level; // 1 : 일반 유저, 6 : 관리자
	
	public Member() { }

	public Member(String id, String pw, int level) {
		this.id = id;
		this.pw = pw;
		this.level = level;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", level=" + level + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}
}
