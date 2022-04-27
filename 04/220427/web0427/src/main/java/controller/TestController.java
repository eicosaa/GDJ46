package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/a/Test1") 
// -@WebServlet("/guest/*") guest로 시작하는 모든 곳 (주소창에 /guest/abc를 쳐도 실행된다.)
// -@WebServlet("/guest/Test2Controller") 이름이 같은 매핑이 있으면 톰캣이 실행되지 않는다. (에러 발생)
public class TestController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Test1");
	}
}
