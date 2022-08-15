package web.forum.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.UnavailableException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.cruiseline.bean.CruiseLineVO;
import web.cruiseline.service.impl.CruiseLineServiceImpl;
//import web.emp.bean.EmpVO;
import web.forum.bean.ForumVO;
import web.forum.service.impl.ForumServiceImpl;
@WebServlet("/GetPic")
@MultipartConfig
public class GetPic extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if ("forumVOUpdate".equals(action)) {
			response.setContentType("image/jpeg");
			ServletOutputStream out;
			out = response.getOutputStream();
			Integer postId = Integer.valueOf(request.getParameter("postId"));
//			System.out.println(cruiseLineNo);
			ForumServiceImpl forumSvc = new ForumServiceImpl();
			ForumVO forumVO = forumSvc.getOneForum(postId);
//			byte[] img64 = Base64.encode(new String(cruiseLineVO.getCruiseLinePicture()));
			out.write(forumVO.getPostPic());
		}

//		if ("usesrImage".equals(action)) {
//			response.setContentType("image/jpeg");
//			ServletOutputStream out;
//			out = response.getOutputStream();
//			HttpSession session = request.getSession();
//			EmpVO empVO = (EmpVO) (session.getAttribute("loginUser"));
//			out.write(empVO.getEmpPictureId());
//		}
	}

}
