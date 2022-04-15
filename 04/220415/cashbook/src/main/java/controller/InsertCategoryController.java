package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDao;
import vo.Category;
/*
	MVC(모델2)
	1) View만 존재 - ex) form만 호출
	2) Controller, Model만 존재 - ex) insert / delete / update
	3) Controller, Model, View - ex) select
*/

// Controller(o) - Model(o) - View(x, 뷰는 없음)
@WebServlet("/category/InsertCategoryController")
public class InsertCategoryController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String categoryTitle = request.getParameter("categoryTitle");
		Category category = new Category();
		category.setCategoryTitle(categoryTitle);
		System.out.println(category); // 끝 -> 뷰가 없다 -디버깅 toString 호출
		
		CategoryDao categoryDao = new CategoryDao();
		categoryDao.insertCategory(category);
		
		// redirect : 클라이언트에게 새로운 요청(새로운 컨트롤러)을 명령
		response.sendRedirect(request.getContextPath()+"/CategoryListController");
	}
}
