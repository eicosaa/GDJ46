package vo;

public class ArrMain {

	public static void main(String[] args) {
		int[] a1 = new int[2];
		int[][] a2 = new int[2][3];
		
		a2[0][0] = 10;
		a2[0][1] = 20;
		a2[0][2] = 30;
		a2[1][0] = 40;
		a2[1][1] = 50;
		a2[1][2] = 60;
		
		for(int i = 0; i < 2; i++) { // *2
			for(int j = 0; j < 3; j++) { // *3
				System.out.println(a2[i][j]);
			}
		}
		
		for(int i = 0; i < 6; i++) {
			System.out.println(a2[i / 3][i % 3]);
		}
		
		

	}

}
