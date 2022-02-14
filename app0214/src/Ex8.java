import java.util.Scanner;
public class Ex8 {

	public static void main(String[] args) {
		// 스캐너 데이터 타입에서 사용 중인 시스템의 입력 가능한 모든 장치타입을 저장
		Scanner s = new Scanner(System.in); // s는 현재 시스템의 키보드를 가르킴
		
		//int num = s.nextInt(); // nextInt()메서드는 엔터키가 입력될 때까지 멈춤
		//System.out.println(num + " <-- num");
		
		String str = s.nextLine(); // 멈췄다가 엔터키가 입력될 때까지 문자를 입력받음
		System.out.println(str + " <-- str");
	}

}
