package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LoginService;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	// C - V 형태로 서비스
	// /login 요청에 get 방식은 login.jsp 페이지를 서비스
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/login.jsp");
		rd.forward(request, response);
	}
	
	// C - M - V 형태로 서비스
	// /login 요청에 post 방식은 action 처리
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1), 2), 3)을 물리적 파일로 완전히 분리하는 구조 -> 모델2(MVC패턴) 구조
		
		// 1) request 분석(C)
		request.setCharacterEncoding("utf-8"); // 폼값(POST)에 한글이 있는데 한글 utf-8 방식 인코딩 
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		String[] hobby = request.getParameterValues("hobby");
		String[] interest = request.getParameterValues("interest");
		// 디버깅
		
		// 2) 
		LoginService loginService = new LoginService();
		List<String> list = loginService.getLoginResult(id, pw, hobby, interest);
		request.setAttribute("list", list); // request 안의 attribute라는 공간의 map<String, Object>을 확장해서 만든 공간
		// -("list", list) -> (문자열, 무슨 타입이던지 상관없음);
		
		// 3) include / forward
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/loginView.jsp");
		rd.forward(request, response);
		
		// C		 -> redirect : V가 있는 다른 C를 요청
		// C - M	 -> redirect : V가 있는 다른 C를 요청
		
		// C - V	 -> forward ex) login 폼
		// C - M - V -> forward ex) login 액션
		
		// ISSUE) login.jsp는 View만 존재하는 것 아닌가?
		//        -> 인위적으로 컨트롤러(/login get방식)를 만든다 
		//		  -> login.jsp 직접 호출이 된다 -> 뷰 페이지를 /WEB-INF/폴더 아래로 이동
		// ISSUE) loginView.jsp 바로 호출하면 500번대 에러가 난다. (-500번은 코드에 의한 에러 / 400번은 사용자에 의한 에러)
		//        -> 뷰 페이지를 /WEB-INF/폴더 아래로 이동
	}
}
