
public class Y extends X {
	public static int m = 2;
	
	public static void main(String[] args) {
		System.out.println(X.m);
		System.out.println(Y.m);
		
		X x = new X();
		System.out.println(x.m); // X.m -> 1
	}
}
