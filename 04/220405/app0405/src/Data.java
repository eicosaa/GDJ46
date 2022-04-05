
public class Data { // 5) 상속 (extends Object 생략)
	public int x;
	public int y;
	// 6) 오버라이딩
	@Override
	public String toString() {
		return "Data [x=" + this.x + ", y=" + this.y + "]";
	}
}
