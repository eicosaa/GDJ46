// 1. 다음 코드의 실행 결과가 txt파일의 내용이 출력되도록 수정하시오.
// test폴더 아래 q1.txt 파일의 내용은 다음과 같습니다. c:\test 폴더 아래 q1.txt파일 생성

import java.io.FileInputStream;

public class Q1 {
	// 변수 앞에 final -> 상수 -> 대문자와 _ 이용해서 명명
	private static final String FILENAME = "c:\\test\\q1.txt";  
	private static FileInputStream fis = null;
	
	private final String FILENAME2 = "c:\\test\\q1.txt";  
	private FileInputStream fis2 = null;

	// Q1.main()
	public static void main(String[] args) throws Exception {
		// fis2, FILENAME2처럼 일반 멤버였다면
		Q1 q1 = new Q1();
		q1.fis2 = new FileInputStream(q1.FILENAME2);
		
		// static 멤버는 main 역시 static이니까
		// inputstream 메모리로 파일을 불러올 때
		Q1.fis = new FileInputStream(Q1.FILENAME); // c:\\test\\q1.txt
		
		// FileInputStream클래스 read()메서드
		int temp = 0;
		while ((temp = Q1.fis.read()) != -1) { // G는 69가 temp에 -1이 아니다
			// -대문자 G에 해당되는 숫자를 temp에 넣는다, G(69)는 -1이 아니다
			System.out.print((char)temp);
			// System.out.print((char)(Q1.fis.read()));
		}
	}
}

/*
	1번 문제 원본 코드
	public class Q1 {
	private static final String FILENAME = "c:\\test\\q1.txt";  
	private static FileInputStream fis = null; /

	public static void main(String[] args) throws Exception {
		Q1.fis = new FileInputStream(Q1.FILENAME);
		while (Q1.fis.read() != -1) {
			System.out.print((char)(Q1.fis.read()));
		}
	}
}
*/