import java.sql.*;
import java.util.*;

import dao.GuestbookDao;
import vo.Guestbook;

public class GuestbookList {

	public static void main(String[] args) throws Exception { 
		// throws Exception 실행 코드 중 예외가 발생하면 무시
		// jsp 페이지는 기본값이 예외를 무시
		
		// 비지니스 로직(모델 계층)
		GuestbookDao guestbookDao = new GuestbookDao();
		ArrayList<Guestbook> list = guestbookDao.selectGuestbookList(0, 5); // -메소드 호출 / selectGuestbookList호출하면 ArrayList<Guestbook> 받을 수 있다.
		
		// 출력
		for(Guestbook g : list) {
			System.out.println(g.guestbookNo + ", " + g.guestbookContent + "\n");
		}
		
	}
}
