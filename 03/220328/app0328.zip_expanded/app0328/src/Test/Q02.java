package Test;
// 2. 버블정렬을 사용하여 다음의 코드를 완성하시오.
public class Q02 {
	public static int[] arNum = { 7, 9, 1, 4, 5 };

	public static void main(String[] args) {
		int out = 0;
		int in = 0;
		Q02 t = new Q02();
		for (out = arNum.length - 1; out > 0; out--) {
			/*
			for () { // for문을 14579라는 결과가 출력되도록 for문을 완성하시오.
				if (arNum[in] > arNum[in + 1]) {
					t.swap(in, in + 1);
				}
			}
			*/
		}
		t.display();
	}

	public void swap(int one, int two) {
		int temp = arNum[one];
		arNum[one] = arNum[two];
		arNum[two] = temp;
	}

	public void display() {
		for (int index = 0; index < arNum.length; index++) {
			System.out.print(arNum[index]);
		}
	}
}
