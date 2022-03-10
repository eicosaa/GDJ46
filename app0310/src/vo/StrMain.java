package vo;

public class StrMain {

	public static void main(String[] args) {
		String s1 = new String("자바");
		String s2 = new String("자바");
		System.out.println(s1 == s2); // false
		System.out.println(s1.equals(s2)); // true
		
		String s3 = "자바";
		String s4 = "자바";
		System.out.println(s3 == s4); // true
		
		// -new 새로 만든다, 그렇지 않은 경우 자바라는 것이 있는지 먼저 찾고 연결 -> true
		
	}

}
