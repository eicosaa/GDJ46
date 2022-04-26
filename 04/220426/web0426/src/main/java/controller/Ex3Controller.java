package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Member;

@WebServlet("/Ex3Controller")
public class Ex3Controller extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("sessionLoginMember");
		// 로그인이 안되었거나, 로그인 되었어도 레벨값이 6보다 작으면 
		if(loginMember == null || loginMember.getLevel() < 6) {
			response.sendRedirect(request.getContextPath() + "/b/Ex2Controller");
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/view/c/ex3.jsp").forward(request, response);
	}
}
