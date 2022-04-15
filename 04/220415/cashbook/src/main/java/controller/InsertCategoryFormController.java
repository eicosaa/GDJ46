package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// -모든 요청은 컨트롤러에서 / 통일하려고 생성
@WebServlet("/category/InsertCategoryFormController")
public class InsertCategoryFormController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/category/insertCategoryForm.jsp").forward(request, response); // -request.getContextPath()사용 x
	}
}

/*
 
	 1. 입력 폼을 호출
	 get
	 Controller - View
	 
	 2. 입력 액션 호출
	 post
	 Controller - Model <--- View 없이 끝이나는 프로세스 마지막에 View가 있는 다른 Controller 호출하는 코드가 필요 -> response.sendRedirect()
	 
	 3. 리스트를 호출
	 get
	 Controller - Model - View
*/
