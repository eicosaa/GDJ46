package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class DriverListener implements ServletContextListener {
	@Override
    public void contextInitialized(ServletContextEvent sce)  { 
		// 현재 접속자 카운트 속성
		sce.getServletContext().setAttribute("currentCount", 0);
         System.out.println("db드라이버 로딩");
         try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
    }
	// -톰캣이 꺼지기 전까지 유지되어 있다.
}
