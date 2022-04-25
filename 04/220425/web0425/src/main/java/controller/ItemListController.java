package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemDao;
import vo.Item;

@WebServlet("/itemListController")
public class ItemListController extends HttpServlet {
	private ItemDao itemDao; // controller는 dao를 필드로 가진다
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1)
		// this.itemDao = new ItemDao();
		// 2)
		// ItemDao itemDao = new ItemDao();
		itemDao = new ItemDao();
		List<Item> list = itemDao.selectItemListAll();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/view/itemList.jsp").forward(request, response);
		for(Item i : list) {
			System.out.println(i.getName());
		}
	}
}
