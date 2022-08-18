package web.member.filter;

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


@WebFilter( urlPatterns = {"/front-end/Member/Member_Info.jsp","/front-end/Member/Member_InfoAlter.jsp","/front-end/Member/MemberPasswordChange.jsp","/front-end/Member/OrderRecord.jsp"})
public class MemberLoginFilter implements Filter{
    
	private FilterConfig config;

	public void init(FilterConfig config) {
		this.config = config;
	}

	public void destroy() {
		config = null;
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		// 【取得 session】
		HttpSession session = req.getSession();
		// 【從 session 判斷此user是否登入過】
		
		if (session.getAttribute("loginMember") == null) {
			String targetURL = req.getRequestURL().toString();
			session.setAttribute("location", targetURL);
			res.sendRedirect(req.getContextPath() + "/front-end/Member/MemberLogin.jsp");
			
		} else {
			chain.doFilter(request, response);
		}
		
	}

	
}
