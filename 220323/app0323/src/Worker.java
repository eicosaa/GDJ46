// Worker(자식)가 Human(부모)를 상속받았다.
public class Worker extends Human {
	public int workerId;
	public void goToWork() {
		System.out.println("회사간다");
	}
}
