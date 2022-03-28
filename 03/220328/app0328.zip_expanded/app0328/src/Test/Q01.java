package Test;

import java.io.FileInputStream;

// 1. 다음 코드의 실행 결과가 txt파일의 내용이 출력되도록 수정하시오.
// test폴더 아래 q1.txt 파일의 내용은 다음과 같습니다. c:\test 폴더 아래 q1.txt파일 생성 

public class Q01 {
	private static final String FILENAME = "c:\\test\\q1.txt"; 
	private static FileInputStream fis = null; 

	public static void main(String[] args) throws Exception {
		fis = new FileInputStream(FILENAME);
		while (fis.read() != -1) {
			System.out.print((char)(fis.read()));
		}
	}
}
