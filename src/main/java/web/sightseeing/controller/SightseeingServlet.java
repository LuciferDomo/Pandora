package web.sightseeing.controller;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import web.cruiseline.bean.CruiseLineVO;
import web.cruiseline.service.impl.CruiseLineServiceImpl;

@WebServlet("/SightseeingServlet")
public class SightseeingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
				response.setContentType("application/json;charset=UTF-8");
				CruiseLineServiceImpl svc=new CruiseLineServiceImpl();
				List<CruiseLineVO> cruiseLineVO= svc.getCruiseLineALL();
				List<String>  cruiseName = cruiseLineVO.stream().map(vo -> vo.getCruiseLines()).collect(Collectors.toList());
				List<Integer> cruiseNo = cruiseLineVO.stream().map(vo -> vo.getCruiseLineNo()).collect(Collectors.toList());
				response.getWriter().print(cruiseName);
				response.getWriter().print(cruiseNo);
			} catch (Exception e) {
				// TODO: handle exception
			}
	}

}
