package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Member;

@WebServlet("/b/Ex2Controller")
public class Ex2Controller extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("sessionLoginMember");
		if(loginMember == null) { // 로그인 되어있지 않은 접근
			response.sendRedirect(request.getContextPath() + "/a/LoginController");
			return;
		}
		request.getRequestDispatcher("/WEB-INF/view/b/ex2.jsp").forward(request, response);
	}

}
