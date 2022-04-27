package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/b/*")
public class EncodingFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 타겟 서블릿 호출 전 실행
		request.setCharacterEncoding("utf-8");
		System.out.println("utf-8 인코딩 필터 실행");
		
		// ServletRequest : 웹 요청이 아닌 일반 요청 처리 가능 (ex : 앱에서 network api를 사용하여 보내는 get / post / put / delete 요청)
		// HttpServletRequest : 웹 요청 처리 가능 (ex : 웹 브ㅏ우저 html 페이지에서 보내는 get / post 요청)
		// 웹 요청인 경우 웹 서버에서 생성된 세션을 반환받을 수 있다.
		/*
		if(request instanceof HttpServletRequest) {
			HttpServletRequest req = (HttpServletRequest)request;
			HttpSession session = ((HttpServletRequest)request).getSession();
			String loginId = (String)session.getAttribute("sessionId");
			if(loginId == null || !loginId.equals("admin")) {
				if(response instanceof HttpServletResponse) {
					((HttpServletResponse)response).sendRedirect(req.getContextPath() + "/Index");
				}
				return;
			}
		}
		*/
		
		chain.doFilter(request, response); // 타겟 서블릿의 메서드를 호출(Servlet.doGet(), Servlet.doPost())
		// 타겟 서블릿 호출 후 실행
		System.out.println("after doFilter");
	}
}
