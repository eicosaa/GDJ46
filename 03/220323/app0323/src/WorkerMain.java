import java.util.ArrayList;

public class WorkerMain {

	public static void main(String[] args) {
		ArrayList<Worker> workerList = new ArrayList<Worker>();
		workerList.add(new Worker());
		workerList.add(new Worker());
		// workerList.add(new Student());
		
		// 다형성을 이용
		ArrayList<Human> list = new ArrayList<Human>();
		
		Student s1 = new Student();
		s1.name = "쵸파";
		
		Student s2 = new Student();
		s2.name = "키티";
		
		Worker w = new Worker();
		w.name = "루피";
		
		list.add(s1);
		list.add(s2);
		list.add(w);
		
		for(Human h : list) {
			System.out.println(h.name);
			// instanceof 연산자
			// 변수 instanceof 타입 -> 변수가 타입으로 변경 가능하면 true, 변수를 타입으로 변경 불가하면 false
			if(h instanceof Student) { 
				((Student)h).goToSchool();
			}
			
		}
		
		/*
		ArrayList<Worker> workerList = new ArrayList<Worker>();
		workerList.add(new Worker());
		workerList.add(new Worker());
		// workerList.add(new Student());
		
		// 다형성을 이용
		ArrayList<Human> list = new ArrayList<Human>();
		Worker w = new Worker();
		w.name = "루피";
		Student s = new Student();
		s.name = "쵸파";
		list.add(w);
		list.add(s);
		for(Human h : list) {
			System.out.println(h.name);
		}
		*/
		
		/*
		Worker w = new Worker();
		// Worker(멤버3) -> Human(멤버5) -> Object(멤버9)
		System.out.println(w.toString()); // Object
		w.sleep(); // Human
		w.goToWork(); // Worker
		// 다형성
		Human h1 = new Worker();
		Human h2 = new Student();
		
		// 다형성 코드에서 형변환을 통해 실 객체의 메서드도 호출 가능
		((Worker)h1).goToWork();
		*/
	}
}
