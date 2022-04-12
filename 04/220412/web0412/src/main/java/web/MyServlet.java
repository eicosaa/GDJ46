package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Servlet 구현하여야한다. HttpServlet은 Servlet의 구현체(클래스)

// 보안 때문에 Servlet 자식이라고 해도 아무나 실행시켜주지 않는다 <- 톰캣 안에(web.xml파일 안에) 미리 맵핑된 서블릿 이름-별명 목록에 있는 서블릿만 요청 처리
// JSP는 서블릿으로 변환될 때 jsp 파일이름 자체가 별명이 된다. ex) ex_jsp.class의 별명은 ex.jsp

// 요즘은 직접 web.xml에 목록을 맵핑하지않고 어노테이션의 방법을 많이 사용한다.
@WebServlet("/myServlet")
public class MyServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// super.doGet(request, request); // 부모의 doGet() 먼저 실행하고 추가적으로 내용을 추가
		// 추가 내용
		// 디버깅
		System.out.println("MyServlet 디버깅...");
		
		// JSP는 html 코드 안에 java 삽입
		// Servlet은 java 코드 안에 html을 삽입
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<body>");
		out.print("		<h1>hello</h1>");
		out.print("</body>");
		out.print("</html>");
	}
}

// 클라이언트 pc 기반 -> 네트워킹 -> CS 기반(스마트폰에서는 여전히 많이) -> 인터넷 -> 웹 기반
// 자바로 웹 기반 -> Servlet / JSP