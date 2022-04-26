package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.DbUser;

@WebServlet(urlPatterns = "/TxtController")
public class TxtController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext context = this.getServletContext(); // 이클립스 web0426 프로젝트
		// InputStream -> InputStreamReader -> BufferedReader
		InputStream is = context.getResourceAsStream("/WEB-INF/txt/db.txt");
		System.out.println(is);
		InputStreamReader isr = new InputStreamReader(is);
		BufferedReader br = new BufferedReader(isr);
		String str = null;
		List<String> list = new ArrayList<>();
		while((str = br.readLine()) != null) {
			// "=" 문자열을 위치를 찾아서...
			// list.add(str.substring(str.indexOf("=") + 1));
			String[] arr = str.split("=");
			list.add(arr[1]);
		}
		DbUser dbUser = new DbUser(list.get(0), list.get(1));
		System.out.println(dbUser);
		
		context.setAttribute("dbUser", dbUser); // JSP : application.setAttribute("dbUser", dbUser);
	}

}
