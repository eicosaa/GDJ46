import javax.swing.JOptionPane;
public class Ex7 {

	public static void main(String[] args) {
		// system.out.print(), System.out.println()
		String name = "java";
		System.out.print(name + "\n");
		System.out.print(name);
		
		System.out.println(name); // 출력 후 줄 바꿈 글자("\n") 추가 
		System.out.print(name);
		
		System.out.println();
		System.out.println("");
		
		// System.out.printf()
		int age = 20;
		System.out.println(name + "의 나이는 " + age + " 입니다.");
		System.out.printf("%s의 나이는 %d 입니다. \n", name, age);

		// GUI 출력 방식 (C# 영역, WEB : JAVA 비중이 큰)
		JOptionPane.showMessageDialog(null, name);
	}

}
