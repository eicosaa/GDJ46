import java.util.Scanner;

public class Ex9 {

	public static void main(String[] args) {
		// 숫자 맞추기 게임
		
		// 시스템이 랜덤으로 생성한 숫자를 저장하는 변수
		int sysNum = (int)(Math.random() * 100) + 1; // 1 ~ 100
		// System.out.println(sysNum);
		
		// 사용자가 입력한 숫자를 저장하는 변수
		int userNum = 0;
		
		Scanner s = new Scanner(System.in);
		
		// 무한 루프 : 영원히 반복하는 반복문 <- break키워드 필요
		int count = 0;
		for(;;) {
			count = count + 1;
			System.out.print("1 ~ 100 사이의 숫자를 입력하세요 : ");
			userNum = s.nextInt();
			if(sysNum == userNum) { // 시스템이 생성한 숫자와 사용자가 입력한 숫자가 동일하면
				System.out.println(userNum + " 정답입니다. (" + count + "번)");
				break; // 반복문을 탈출하는 키워드
			} else if(sysNum > userNum) {
				System.out.println("큰 번호를 입력하세요");
			} else {
				System.out.println("작은 번호를 입력하세요");
			}
		}
	}

}
