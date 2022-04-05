
public class MainTest {

	public static void main(String[] args) {
		int a = 1;
		System2.out2.println(a);
		char b = 'K';
		System2.out2.println(b);
		double c = 3.14;
		System2.out2.println(c);
		boolean d = false;
		System2.out2.println(d);
		Data data = new Data();
		data.x = 7;
		data.y = 10;
		System2.out2.println(data.x);
		System2.out2.println(data.y);
		// System2.out2.println(data);
		// System2.out2.println(data.getClass());
		// System2.out2.println(data.hashCode());
		// System2.out2.println(data.toString());
		System2.out2.println(data);
		data.x = 3;
		data.y = 5;
		System2.out2.println(data);
	}
}
