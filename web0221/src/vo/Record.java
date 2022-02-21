package vo;

public class Record {
	public String studentName; // 중복 허용
	public String subject; // 중복 허용
	public int score; // 중복 허용
	
	// 3개의 필드가 모두 중복 허용 --> 키 필드가 없다 --> 복합 필드에서 키 필드를 찾아보기 --> StudentName + subject 복합키로 사용
	
}
