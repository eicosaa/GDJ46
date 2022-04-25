package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Item;

@WebServlet("/addCartController")
public class AddCartController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = (Integer.parseInt(request.getParameter("id")));
		String name = request.getParameter("name");
		int price = (Integer.parseInt(request.getParameter("price")));
		
		HttpSession session = request.getSession();
		List<Item> cartList = new ArrayList<Item>();
		if(session.getAttribute("cartList") != null) {
			cartList = (List<Item>)session.getAttribute("cartList");
		} else {
			session.setAttribute("cartList", cartList);
		}
		cartList.add(new Item(id, name, price));
		
		// 새로운 컨트롤러를 재요청
		response.sendRedirect(request.getContextPath() + "/cartListController");
	}
}
