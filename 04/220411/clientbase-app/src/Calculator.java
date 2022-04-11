// java.awt 패키지안에는 자바로 GUI프로그램을 만들 수 있는 API
import java.awt.Container;
import java.awt.FlowLayout;
// java.awt 하위패키지로 GUI 이벤트 처리를 위한 API
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

// java.awt 패키지의 확장 API
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
// 자바 GUI API HISTORY : awt API -> swing API -> javaFX API
// import java.awt.*; // java.awt 패키지 안에는 자바로 GUI프로그램을 만들 수 있는 API
// import java.awt.event.*; // java.awt 하위패키지로 GUI 이벤트 처리를 위한 API
// import javax.swing.*; // java.awt 패키지의 확장 API


// 상속계층도 :  Object <- ... <- java.awt.Frame <- javax.swing.JFrame <- Calculator
public class Calculator extends JFrame { // Calculator도 JFrame이 만들 수 있는 GUI프로그램을 만들 수 있다.(오버라이딩, 확장,...) 
	// 프로그램내에 고정된 값 -> 상수(대문자로 표현) -> final
	private final float USD_RATE= 1124.70F; // -private으로 캡슐화
	private final float JPY_RATE = 10.113F;
	private final float CNY_RATE = 163.30F;
	private final float GBP_RATE = 1444.35F;
	private final float EUR_RATE = 1295.97F;
	// 환율은 자주 변하는데 변할 때마다 프로그램 수정해서 배포해야 한다. 보안도 취약하다. p27, p28
	
	// GUI 요소(컴포넌트) : HTML의 폼태그 요소와 비슷
	JLabel lblWon = new JLabel("원"); // GUI 글자 
	JTextField operand1 = new JTextField(10); // GUI 입력상자 HTML의 input type="text"
	String[] opExpression = {"선택","달러", "엔화", "위안","파운드","유로"};
	JComboBox<String> opSelection = new JComboBox<String>(opExpression); // HTML의 select 태그
	JTextField txtResult = new JTextField(10);
	JButton btnClear = new JButton("다시입력"); // HTML의 button태그
	
	public static void main(String[] args){
		Calculator calc = new Calculator(); // 생성자 호출
		calc.startFrame();
		// calc.startFrame()메서드 내용을 직접 구현하기 보다는 메서드로 구현하고(추상화) 호출하였다
		/*
		calc.opSelection.addActionListener(new ActionListener() { // 익명 클래스 객체
			@Override
			public void actionPerformed(ActionEvent e) {
				if(e.getSource()==calc.opSelection){
					calc.calculate();
				}else if(e.getSource()==calc.btnClear){
					calc.init();
				}
				
			}
		});
		calc.btnClear.addActionListener(new ActionListener() { // 익명 클래스 객체
			@Override
			public void actionPerformed(ActionEvent e) {
				if(e.getSource()==calc.opSelection){
					calc.calculate();
				}else if(e.getSource()==calc.btnClear){
					calc.init();
				}
				
			}
		});
		//FlowLayout 형태로 배치된다.
		calc.setTitle("환율 계산하기");
		calc.add(calc.title);
		calc.add(calc.operand1);
		calc.add(calc.opSelection);
		calc.add(calc.txtResult);
		calc.add(calc.btnClear);
		calc.setSize(700,200);
		*/
	}
	
	// 생성자
	public Calculator() {
		Container contentPane = this.getContentPane(); // HTML의 body태그
		
		// setLayout()메서드는 Container안에 내용을 채울 때 어떤 레이아웃을 적용
		// FlowLayout Container안 내용물 차례대로 배치, 더 이상 배치할 공간이 없으면 다음줄에...
		contentPane.setLayout(new FlowLayout()); 
		
		// setDefaultCloseOperation()메서드는 JFrame의 우측 "X"를 눌렀을때 호출되는 메서드
		// 매개변수값이 3이면 프로그램을 종료하게 된다. 0, 1, 2, 3 값은 외우기 힘들다
		// WindowConstants.DO_NOTHING_ON_CLOSE 상수는 0값이 매핑된 상수
		// WindowConstants.HIDE_ON_CLOSE 상수는 1값이 매핑된 상수
		// WindowConstants.DISPOSE_ON_CLOSE 상수는 2값이 매핑된 상수
		// WindowConstants.EXIT_ON_CLOSE상수는 3값이 매핑된 상수
		// JFrame은 WindowConstants인터페이스를 구현했다. Frame은 WindowConstants인터페이스의 구현(자식) 클래스다.
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // -JFrame.EXIT_ON_CLOSE -> 3
		// this.pack();
		this.setVisible(true); // Calculator 원도우(창)이 보이게(true) 안보이게(false) 하는 옵션
	}
	
	private void startFrame(){
		/*
		익명 클래스 객체로 구현도 가능하지만 아래 class SelectionHandler implements ActionListener 구현후 클래스를 사용 했다.
		this.opSelection.addActionListener(new ActionListener() { 
			@Override
			public void actionPerformed(ActionEvent e) {
				if(e.getSource()==opSelection){
					calculate();
				}else if(e.getSource()==btnClear){
					init();
				}
				
			}
		});
		*/
		
		this.setTitle("환율 계산하기");
		this.add(this.lblWon); // JLabel lblWon
		this.add(this.operand1); // JTextField operand1
		this.add(this.opSelection); // JcomboBox<String> opSelection
		this.add(this.txtResult); // JTextField txtResult
		this.add(this.btnClear); // JButton btnClear
		this.setSize(700,200);
		
		// 이벤트 기능
		// addActionListener()는 매개변수 ActionListener의 actionPerformed()메서드를 실행
		this.opSelection.addActionListener(new SelectionHandler()); // 다형성 -> 오버라이딩된 자식타입의 메서드를 실행
		this.btnClear.addActionListener(new SelectionHandler()); // 다형성 -> 오버라이딩된 자식타입의 메서드를 실행
	}
	
	// 내부클래스 -> Calculator$SelectionHandler.class이름으로 컴파일된다.
	class SelectionHandler implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e) {
			if(e.getSource()==opSelection){ // opSelection의 값이 변경되었을 때
				calculate();
			}else if(e.getSource()==btnClear){ // btnClear 버튼을 클릭했을 때
				init();
				// operand1.setText("");
				// txtResult.setText("");
			}
			
		}
	}
	// JComboBox의 선택이 변경되었을때 실행되는 로직
	private void calculate(){
		float won=Float.parseFloat(operand1.getText());
		String result=null;
		String operator=opSelection.getSelectedItem().toString();
		if(operator.equals("달러")){
			result=String.format("%.6f",won/USD_RATE);
		}else if(operator.equals("엔화")){
			result=String.format("%.6f",won/JPY_RATE);
		}else if(operator.equals("위안")){
			result=String.format("%.6f",won/CNY_RATE);
		}else if(operator.equals("파운드")) {
			result=String.format("%.6f",won/GBP_RATE);
		}else if(operator.equals("유로")) {
			result=String.format("%.6f",won/EUR_RATE);
		}
		txtResult.setText(result);
	}
	// JButton을 클릭했을때 실행되는 로직
	private void init(){
		operand1.setText("");
		txtResult.setText("");
	}
	
}