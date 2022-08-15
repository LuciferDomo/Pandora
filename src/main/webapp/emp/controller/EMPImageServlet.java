package web.emp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.emp.bean.EmpVO;
import web.emp.service.EmpService;
import web.emp.service.impl.EmpServiceImpl;

/**
 * Servlet implementation class EMPImageServlet
 */
@WebServlet("/EMPImageServlet")
public class EMPImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EMPImageServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if ("usesrImage".equals(action)) {
			response.setContentType("image/jpeg");
			ServletOutputStream out;
			out = response.getOutputStream();
			HttpSession session = request.getSession();
			EmpVO empVO = (EmpVO) (session.getAttribute("loginUser"));
			out.write(empVO.getEmpPictureId());
		}

		if ("empVOUpdate".equals(action)) {
			response.setContentType("image/jpeg");
			ServletOutputStream out;
			out = response.getOutputStream();
			EmpService service = new EmpServiceImpl();
			System.out.println(request.getParameter("employeeId"));
			EmpVO empVO = service.getOneEmp(Integer.valueOf(request.getParameter("employeeId")));

			out.write(empVO.getEmpPictureId());
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
