package web.filter;

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

import web.emp.bean.EmpVO;

@WebFilter(urlPatterns = { "/back-end/emp/EMP_Register.jsp"})
public class EmployeeJobLevelFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

//		String[] urls = { "/front-end/css/", "/js/", "/img/", "/member/", "/seller/", "/login", "/loginSeller", "/register-member",
//				"/register-seller", "/forget", "/checkVerification", "/changePassword", "/index", "/logout" };
//
//		String url = req.getRequestURL().toString();
//		//  System.out.println(url);
//		for (String u : urls) {
//			if (url.contains(u)) {
//				chain.doFilter(request, response);
//				return;
//			}
//		}

		// 【取得 session】
		HttpSession session = req.getSession();
		// 【從 session 判斷此user是否登入過】
		Object user = session.getAttribute("loginUser");
	
		System.out.println("user " + user);
		if (user != null) {
			// 放行
			EmpVO userEmpVO = (EmpVO) user;
			String jobLevel = userEmpVO.getJobLevels();
			if (!"Manger".equals(jobLevel)) {
				res.sendRedirect(req.getContextPath() + "/back-end/emp/EMP_HomePageLowerLevel.jsp");
				return;
			}

			chain.doFilter(request, response);
		} else {
			req.getSession().invalidate();
//			session.setAttribute("location", req.getRequestURI());
			res.sendRedirect(req.getContextPath() + "/back-end/emp/EMP_login.jsp");
			return;
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}