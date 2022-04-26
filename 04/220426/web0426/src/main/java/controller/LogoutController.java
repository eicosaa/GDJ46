package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Member;

@WebServlet("/b/LogoutController")
public class LogoutController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("sessionLoginMember");
		session.invalidate(); // 세션 갱신 (기존 세션 내용은 삭제)
		response.sendRedirect(request.getContextPath() + "/a/LoginController");
	}
}
