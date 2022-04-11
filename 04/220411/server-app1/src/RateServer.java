// IN(프로그램 메모리 안으로 InputStream <- Reader) - OUT(프로그램에서 나가는 outputStream <- Writer)
// IO패키지 API
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
// Network프로그램 net패키지 API
import java.net.ServerSocket;
import java.net.Socket;

// client가 넘겨준 operand1값과 opExpression값에 Server에 세팅된 rate값을 연산하여
// 결과값을 다시 client에게 응답한다.
public class RateServer {
	private static final float USD_RATE= 1124.70F;
	private static final float JPY_RATE = 10.113F;
	private static final float CNY_RATE = 163.30F;
	private static final float GBP_RATE = 1444.35F;
	private static final float EUR_RATE = 1295.97F;
	
	public static void main(String[] args){		
		InputStream is = null;
		BufferedReader br = null;
		BufferedWriter bw = null;
		PrintWriter pw = null;
		OutputStream os = null;
		ServerSocket serverSocket = null;
		Socket s1 = null;
		String ipAddrs = null;
		String inMessage = null;
		float outMessage = 0f;
		try{
			// 외부에서 접속할 수 있도록 전용 포트를 열어주는 역할
			serverSocket= new ServerSocket(5434);
			System.out.println("서버 실행 중...");
			
			while(true) { // 서버는 계속해서 실행 중이어야 한다. (-그렇기에 무한루프)
				// 클라이언트가 접속(포트번호)하면 accept메서드가 실행
				// 클라이언트의 접속을 인지 시에 accept()메소드를 호출해서 소켓 객체를 생성한다.
				// 클라이언트의 소켓과 서버의 소켓이 연결되는 역할
				// 연결 후 클라이언트와 서버는 연결된 소켓으로 소켓 통신이 가능해짐
				s1 = serverSocket.accept(); 
				
				// 클라이언트 데이터를 받는 로직
				is = s1.getInputStream(); // 소켓의 InputStream(클라이언트가 보낸 데이터를 읽기 위해서)
				
				// 소켓의 inputstream을 편하고 효율적으로 사용하도록 가공
				// InputStream타입이 BufferedReader으로 가공
				br=new BufferedReader(new InputStreamReader(is)); 
				String data=br.readLine(); // BufferedReader으로 가공 후 글자를 한 줄 단위로 읽어서 가져온다.
				System.out.println("서버 수신 데이터:"+data); // ex) 1000,달러 <- 토큰문자를 사용하여 여러 값을 한 문자열로 받음
				
				String[] token = data.split(","); // 하나의 문자열을 ,문자를 이용하여 여러개 문자배열로 쪼개는 메서드
				
				float won=Float.parseFloat(token[0]);
				String operator=token[1];
				String result=null;
				
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
				
				// String result = calculate(data);
				System.out.println(result + " <-- result");
				
				// 2. 클라이언트 데이터를 보내는 로직
				os = s1.getOutputStream(); // 소켓의 outputstream(클라이언트에게 데이터를 보내기 위해서)
				// getOutputStream -> BufferedWriter타입 -> printWriter타입으로 가공
				bw = new BufferedWriter(new OutputStreamWriter(os));
				pw = new PrintWriter(bw,true);
				pw.println(result);
				
			}
		}catch(IOException ie){
			ie.printStackTrace();
		} finally {
			try {
				is.close();
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			pw.close();
		}
	}
	
	/*
	private static String calculate(String data){
		String []token=data.split(",");
		
		float won=Float.parseFloat(token[0]);
		String operator=token[1];
		String result=null;
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
		
		return result;
	}	
	*/
}