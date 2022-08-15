package web.emp.controller;

import java.io.IOException;
import java.io.ObjectInputFilter.Status;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.jsp.PageContext;

import web.emp.bean.EmpVO;
import web.emp.service.EmpService;
import web.emp.service.impl.EmpServiceImpl;
import web.util.EmpStatusUtil;

@WebServlet("/EmpLoginUserOnly")
@MultipartConfig
public class EmpLoginUserOnly extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(req.getContextPath());

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("EMPLogin".equals(action)) {

			String email = req.getParameter("email");
			String password = req.getParameter("password");

			System.out.println("email:" + email);
			System.out.println("password:" + password);

			EmpVO slectEmpVO = new EmpVO();
			slectEmpVO.setEmail(email);
			slectEmpVO.setPassword(password);
			EmpService empService = new EmpServiceImpl();
			EmpVO empVO = empService.selectByEmailAndPassword(slectEmpVO);
			req.getSession().setAttribute("loginUser", empVO);

			if (empVO != null) {
				String url = "back-end/emp/EMP_HomePage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);
				return;
			} else {
				req.setAttribute("errorMsg", "帳號密碼錯誤");
				RequestDispatcher failView = req.getRequestDispatcher("back-end/emp/EMP_login.jsp");
				failView.forward(req, resp);
				return;
			}
		}
	}
}
