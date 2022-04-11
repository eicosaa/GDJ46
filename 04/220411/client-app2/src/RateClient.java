import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;


public class RateClient extends JFrame{
	JLabel title = new JLabel("원화");
	JTextField operand1 = new JTextField(10);
	String[] opExpression = {"선택","달러", "엔화", "위안","파운드","유로"};
	JComboBox<String> opSelection = new JComboBox<String>(opExpression);
	JTextField txtResult = new JTextField(10);
	JButton btnClear = new JButton("다시입력");
	
	public RateClient() {
		Container contentPane = this.getContentPane();
		contentPane.setLayout(new FlowLayout());
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.pack();
		this.setVisible(true);
	}

	private void startFrame(){
		opSelection.addActionListener(new SelectionHandler());
		btnClear.addActionListener(new SelectionHandler());
		this.setTitle("클라이언트 프로그램");
		this.add(operand1);
		this.add(opSelection);
		this.add(txtResult);
		this.add(btnClear);
		this.setSize(700,200);
		
	}
	
	class SelectionHandler implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e) {
			if(e.getSource()==opSelection){
				calculate();
			}else if(e.getSource()==btnClear){
			  init();
			}
			
		}
	}
	
	private void init(){
		operand1.setText("");
		txtResult.setText("");
	}
	private void calculate(){
		// 입력한 숫자
		float won=Integer.parseInt(operand1.getText());
		// 선택한 나라
		String operator=opSelection.getSelectedItem().toString();
		String result=null;
		
		 InputStream is = null;
		 BufferedReader br = null;
		 BufferedWriter bw = null;
		 OutputStream os = null;
		 PrintWriter pw=null;
		 
		try{
			Socket s1=new Socket("127.0.0.1",5434);
			os = s1.getOutputStream();
			is=s1.getInputStream();
			String sendMsg = won + "," + operator; // ,는 토큰문자 : 읽을 때 두 값을 구분하기 위한 문자
			System.out.println("전송데이터:"+ sendMsg);
			
			// outputstream
			// won + , + operator 문자열을 서버로 보내는 로직
			bw = new BufferedWriter(new OutputStreamWriter(os));
			pw=new PrintWriter(bw,true);
		    pw.println(won+","+operator);
		    
		    // inputstream
		    // 서버의 결과 문자열을 받는 로직
		    br=new BufferedReader(new InputStreamReader(is));
			result=br.readLine();
			System.out.println("클라이언트 수신 데이터:"+result);
			txtResult.setText(result);
			s1.close();
		}catch(Exception e){
			e.printStackTrace();
		} finally {
			try {
				br.close();
				is.close();
				pw.close();
				bw.close();
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
	}
	
	public static void main(String[] args){
		RateClient calc=new RateClient();
		calc.startFrame();
		
	}	
}