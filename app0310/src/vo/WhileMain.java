package vo;

public class WhileMain {

	public static void main(String[] args) {
		
		
		for(int i = 0; i < 10; i++) {
			if(i != 5) {
				// break;
				continue;
			}
			System.out.println(i);
		}
		
		
		// switch, do while, 라벨 :, continue
		
		out : 
		for(int i = 1; i < 10; i++) {
			System.out.println(i + " <-- i");
			in : 
			for(int j = 0; j < 10; j++) {
				System.out.println(j + " <-- j");
				if(j == 4) {
					break out;
				}
			}
		}
		
		for(int i = 1; i < 10; i++) {
			System.out.println(i); // 1 ~ 9
		}
		
		int x = 1;
		while (x < 10) {
			System.out.println(x);
			x++; // x+=1;
		}
		
		
		// for 무한루프 vs while 무한루프
		for(;;) {
			// 무한루프
			break;
		}
		
		while(true) {
			// 무한루프
			break;
		}

		
		int y = 10;
		do {
			System.out.println(y);
		} while(y < 0);
	}

}
