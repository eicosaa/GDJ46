package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AddressDao;

@WebServlet("/SearchAddressController")
public class SearchAddressController extends HttpServlet {
	private AddressDao addressDao;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchAddr = request.getParameter("searchAddr");
		
		this.addressDao = new AddressDao();
		List<Map<String, Object>> list = this.addressDao.selectAddressListBySearch(searchAddr);
		
		request.setAttribute("searchList", list);
		
		request.getRequestDispatcher("/WEB-INF/view/address.jsp").forward(request, response);
	}
}
