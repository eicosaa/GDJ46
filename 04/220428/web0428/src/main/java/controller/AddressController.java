package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AddressDao;
import vo.Address;

@WebServlet("/AddressController")
public class AddressController extends HttpServlet {
	private AddressDao addressDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/address.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String detailAddr = request.getParameter("detailAddr");
		System.out.println("[AddressController.doPost()] id : " + id);
		System.out.println("[AddressController.doPost()] detailAddr : " + detailAddr);
		
		Address address = new Address();
		address.setId(id);
		address.setDetailAddr(detailAddr);
		System.out.println("[AddressController.doPost()] address.id : " + address.getId());
		System.out.println("[AddressController.doPost()] address.detailAddr : " + address.getDetailAddr());
		this.addressDao = new AddressDao();
		this.addressDao.insertAddress3(address);
		response.sendRedirect(request.getContextPath() + "/AddressController");
	}
}
