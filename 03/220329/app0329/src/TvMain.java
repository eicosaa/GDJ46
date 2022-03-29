
public class TvMain {
	public static void main(String[] args) {
		// 익명 클래스를 사용
		Tv tv = new Tv() { // 부모의 생성자(클래스, 추상클래스, 인터페이스)를 이용해서 객체를 만들면서 오버라이딩
			@Override
			public void onOff() {
				System.out.println("전원onOff");
			}
		};
		tv.onOff(); // 전원onOff + 인터넷onOff
		// 익명 클래스
		IAi iai = new IAi() {
			
			@Override
			public void ai() {
				
			}
		};
		iai.ai(); // 인공지능을 가진 TV
	}
}

class Tv {
	public void onOff() {
		System.out.println("전원onOff");
	}
}


interface IAi {
	public abstract void ai();
}

/*
public class TvMain {
	public void onOff() {
		System.out.println("전원onOff");
	}
	
	public static void main(String[] args) {
		TvMain tv = new SmartTv(); // 다형성
		tv.onOff();
		IAi iai = new AiTv(); // 다형성
		iai.ai();
	}
}

class Tv {
	public void onOff() {
		System.out.println("전원onOff");
	}
}

class SmartTv extends TvMain {
	@Override
	public void onOff() {
		System.out.println("전원onOff + 인터넷 onOff");
	}
}

interface IAi {
	public abstract void ai();
}

class AiTv implements IAi{
	@Override
	public void ai() {
		System.out.println("인공지능을 가진 TV");
	}
	
}
*/
