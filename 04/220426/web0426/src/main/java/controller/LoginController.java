package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import vo.Member;

@WebServlet("/a/LoginController")
public class LoginController extends HttpServlet {
	private MemberDao memberDao;
	// 로그인 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("sessionLoginMember");
		if(loginMember != null) { // 이미 로그인 되어 있는 상태
			response.sendRedirect(request.getContextPath()+"/b/Ex2Controller");
			return;
		}
		
		Cookie[] cookies = request.getCookies();
		for(Cookie c : cookies) {
			if(c.getName().equals("cookieId")) {
				request.setAttribute("cookieId", c.getValue());
			}
		}
		
		request.getRequestDispatcher("/WEB-INF/view/a/login.jsp").forward(request, response);
	}
	
	// 로그인 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("sessionLoginMember");
		if(loginMember != null) { // 이미 로그인 되어 있는 상태
			response.sendRedirect(request.getContextPath()+"/b/Ex2Controller");
			return;
		}
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		boolean idSave = false; 
		if(request.getParameter("idSave") != null) {
			idSave = true;
		}
		
		this.memberDao = new MemberDao();
		Member returnMember = this.memberDao.login(new Member(id, pw, 0));
		System.out.println(returnMember);
		if(returnMember == null) {
			response.sendRedirect(request.getContextPath()+"/a/LoginController"); // -msg가능, id, pw넘기기 가능
			return;
		}
		// 세션저장 로그인정보 저장
		session.setAttribute("sessionLoginMember", returnMember);
		// 쿠키저장 id저장
		if(idSave) {
			Cookie cookieId = new Cookie("cookieId", id);
			cookieId.setMaxAge(60*60*24); // cookieId 생명주기가 하루
			response.addCookie(cookieId); // 응답객체에 쿠키를 하나 추가
		}
		
		response.sendRedirect(request.getContextPath()+"/b/Ex2Controller");
	}
}
