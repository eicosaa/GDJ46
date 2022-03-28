
public class Vegetable extends Product {
	public Vegetable() { } // price : 0, name : null, loc : null
	public Vegetable(int pric, String name, String loc) { 
		// -생성자도 메소드니까 동일한 이름이라도 매개변수만 다르면 2개여도 상관없다.
		this.price = price;
		this.name = name;
		this.loc = loc;
	} // Vegetable v1 = new Vegetable(1000, "당근", "대관령");
	
	// 이름이 같고 매개변수가 다른 메서드를 만드는 기법 : 오버로딩
	public String loc;

}
