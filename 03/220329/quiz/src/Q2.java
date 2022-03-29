// 2. 버블정렬을 사용하여 다음의 코드를 완성하시오.

public class Q2 {
	public static int[] arNum = { 7, 9, 1, 4, 5 };
	/*
	 	버블 정렬
	 	-7,9 비교 9가 크니 유지 -> 9,1 비교 9가 크니 1과 9의 자리 교환 (반복)
	 	1) { 7, 1, 4, 5, 9 }
	 	2) { 1, 4, 5, 7, 9 }
	*/

	public static void main(String[] args) {
		int out = 0;
		int in = 0;
		// out -> 4
		
		for (out = Q2.arNum.length - 1; out > 0; out--) {
			for (in = 0; in < out; in++ ) { // for문을 14579라는 결과가 출력되도록 for문을 완성하시오.
				if (arNum[in] > arNum[in + 1]) {
					Q2.swap(in, in + 1);
				}
				// 1) 7, 1, 4, 5, 9
			}
		}
		Q2.display();
	}
	
	// -static들은 다 접근 가능 -> new 만들지 않아도 괜찮다
	public static void swap(int one, int two) {
		int temp = Q2.arNum[one];
		Q2.arNum[one] = Q2.arNum[two];
		Q2.arNum[two] = temp;
	}

	public static void display() {
		for (int index = 0; index < Q2.arNum.length; index++) {
			System.out.print(Q2.arNum[index]);
		}
	}
}

/*
	2번 문제 원본 코드
	public class Q2 {
	public static int[] arNum = { 7, 9, 1, 4, 5 };

	public static void main(String[] args) {
		int out = 0;
		int in = 0;

		for (out = Q2.arNum.length - 1; out > 0; out--) {
			for () { // for문을 14579라는 결과가 출력되도록 for문을 완성하시오.
				if (arNum[in] > arNum[in + 1]) {
					Q2.swap(in, in + 1);
				}
			}
		}
		Q2.display();
	}

	public static void swap(int one, int two) {
		int temp = Q2.arNum[one];
		Q2.arNum[one] = Q2.arNum[two];
		Q2.arNum[two] = temp;
	}

	public static void display() {
		for (int index = 0; index < Q2.arNum.length; index++) {
			System.out.print(Q2.arNum[index]);
		}
	}
}
*/