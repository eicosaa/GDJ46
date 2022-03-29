// 4. Player클래스의 접근제한자(주석참고)를 다음과 같이 했을때 장점을 서술하시오.

public class Q4 {
	public static void main(String[] args) {
		Player luffy = new Player();
		Player zoro = new Player();
		Player nami = new Player();
		
		System.out.println(luffy.getId());
		System.out.println(zoro.getId());
		System.out.println(nami.getId());
	}
}

class Player {
	// static Player.nextId
	private static int nextId = 1; // 1) Why static and private? 
	
	private int id; // 2) Why private?
	
	public Player() { // 3) Why public?
		// this.id = Player.nextId++;
		this.id = Player.nextId;
		Player.nextId = Player.nextId + 1;
	}
	protected int getId() { // 4) Why protected?
		return id;
	}
	private void setId(int id) { // 5) Why private?
		this.id = id;
	}
}
/*
	1) Why static and private?
	-> 
	
	2) Why private?
	-> id 값을 직접적으로 수정하는 것을 막기 위해서이다.
	
	3) Why public?
	-> 
	
	4) Why protected?
	-> 같은 패키지에서 읽을 수 있다. (default와 같음, 그러나 상속할 수 있기에 protected 사용)
	
	5) Why private?
	-> 1, 2, 3이라는 id 값은 
*/


/*
	4번 문제 원본 코드
	public class Q4 {
	public static void main(String[] args) {
		Player luffy = new Player();
		Player zoro = new Player();
		Player nami = new Player();
		
		System.out.println(luffy.getId());
		System.out.println(zoro.getId());
		System.out.println(nami.getId());
	}
}

class Player {
	private static int nextId = 1; // 1) Why static and private? 
	private int id; // 2) Why private?
	public Player() { // 3) Why public?
		this.id = Player.nextId++;
	}
	protected int getId() { // 4) Why protected?
		return id;
	}
	private void setId(int id) { // 5) Why private?
		this.id = id;
	}
}
*/