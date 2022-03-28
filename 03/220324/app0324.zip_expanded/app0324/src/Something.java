
public class Something {
	
	public static void main(String[] args) {
		Something s = new Something();
		int hc = s.hashCode();
		String str = s.toString();
		
		System.out.println(hc);
		System.out.println(str);
	}
}
