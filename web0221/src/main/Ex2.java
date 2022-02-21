package main;

public class Ex2 {

	public static void main(String[] args) {
		// 반복문 for(foreach) vs while
		// for(반복을 위한 변수 초기치; 조건; 증감치)
		// while(조건)
		
		for(int i=1; i<11; i+=1) {
			System.out.println(i);
		}
		
		int j = 1;
		while(j < 11) {
			System.out.println(j);
			j += 1; // j=j+1;
		}
		
		// for문의 무한 루프 : for(;;){ }
		// while문의 무한 루프 : while(true) { }
		
		int n = 1;
		while(true) {
			System.out.println(n);
			if(n == 5) {
				break;
			}
			
			n = n + 1;
		}
		
		// for는 횟수를 반복 사용 --> 조건 사용에 가능
		// while은 조건에 따른 반복 --> 횟수 사용에 가능
		
	}

}
