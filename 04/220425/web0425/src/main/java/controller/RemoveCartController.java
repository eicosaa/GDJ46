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

@WebServlet("/removeCartController")
public class RemoveCartController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = (Integer.parseInt(request.getParameter("id")));
		HttpSession session = request.getSession();
		List<Item> cartList = (List<Item>)session.getAttribute("cartList");
		for(int i = 0; i < cartList.size(); i += 1) {
			if(cartList.get(i).getId() == id) {
				cartList.remove(i);
			}
		}
		
		// 삭제 시 cartList로 새로운 컨트롤러를 재요청
		response.sendRedirect(request.getContextPath() + "/cartListController");
	}
}
