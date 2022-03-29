// 3. 다음 코드의 실행 결과는?

public class Q3 {
	public static void main(String[] args) {
		Q3 q = new Q3();
		int a = 20;
		int[] b = {100, 200, 300};
		q.change(a, b);
		q.display(a, b);
	}

	void change(int a, int[] b) {
		a = 777;
		b[0] = 777;
	}

	void display(int a, int b[]) {
		System.out.print(a + "," + b[0]);
	}
}
