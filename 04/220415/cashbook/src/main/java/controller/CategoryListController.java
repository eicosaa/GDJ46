package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDao;
import vo.Category;

@WebServlet("/CategoryListController")
public class CategoryListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDao categoryDao = new CategoryDao();
		List<Category> list = categoryDao.selectCategoryList();
		request.setAttribute("list", list); 
		
		// <jsp:forward page="./categoryListView.jsp"></jsp:forward>
		
		request.getRequestDispatcher("/WEB-INF/view/category/categoryListView.jsp").forward(request, response);
	}
}
