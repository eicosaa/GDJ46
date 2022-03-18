package main;

public class Ex3 {

	public static void main(String[] args) {
		// if는 조건 분기에 사용 --> 비교 연산자를 사용 --> 값을 비교하는 ==(등호)연산자를 값 분기 가능
		// switch는 값 분기에 사용 (if문보다는 가독성이 높다) --> 특정 조건 분기문에는 사용 불가
		// --> 모든 switch문은 if문으로 변경 가능 but 모든 if문은 switch문으로 변경 가능하지 않다.
		
		int num = 1;
		if(num == 1) {
			System.out.println(1 + " <-- if");
		} else if(num == 2) {
			System.out.println(2 + " <-- if");
		} else {
			System.out.println(3 + " <-- if");
		}
		
		switch(num) {
		case 1:
			System.out.println(1 + " <-- switch");
			break; // break 사용 때문에 반복문 안에 조건문이 필요할 때 반복문 break 사용이 불편
		case 2:
			System.out.println(2 + " <-- switch");
		default:
			System.out.println(3 + " <-- switch");
			
		}

	}
	// break --> 가장 가까운 반복문이나 switch문을 탈출한다. --> 반복문 안에 switch문은 오히려 가독성 떡어진다.

}
