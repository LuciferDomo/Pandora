package web.cruiseline.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import web.cruiseline.bean.CruiseLineVO;
import web.cruiseline.bean.PortNameListVO;
import web.cruiseline.bean.PortsOfCallListVO;
import web.cruiseline.dao.CruiseLineDAO;
import web.cruiseline.dao.impl.CruiseLineDAOImpl;
import web.cruiseline.service.impl.CruiseLineServiceImpl;
import web.emp.bean.EmpVO;

@WebServlet("/CruiseLineServlet")
@MultipartConfig
public class CruiseLineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if ("cruiseLineVOUpdate".equals(action)) {
			response.setContentType("image/jpeg");
			ServletOutputStream out;
			out = response.getOutputStream();
			Integer cruiseLineNo = Integer.valueOf(request.getParameter("cruiseLineNo"));
			CruiseLineServiceImpl clsSvc = new CruiseLineServiceImpl();
			CruiseLineVO cruiseLineVO = clsSvc.selectCruiseNo(cruiseLineNo);
			out.write(cruiseLineVO.getCruiseLinePicture());
		}
		if ("usesrImage".equals(action)) {
			response.setContentType("image/jpeg");
			ServletOutputStream out;
			out = response.getOutputStream();
			HttpSession session = request.getSession();
			EmpVO empVO = (EmpVO) (session.getAttribute("loginUser"));
			out.write(empVO.getEmpPictureId());
		}
		if ("getImage".equals(action)) {
			response.setContentType("image/jpeg");
			String cruiseLineNo = request.getParameter("cruiseLineNo");
			System.out.println("cruise = " + cruiseLineNo);
			CruiseLineDAO dao = new CruiseLineDAOImpl();
			CruiseLineVO vo = dao.selectNo(Integer.parseInt(cruiseLineNo));
			ServletOutputStream out = response.getOutputStream();
			out.write(vo.getCruiseLinePicture());
			out.close();
		}
		
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if ("selectCruiseNo".equals(action)) { // 來自ships.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
				/***************************1.接收請求參數****************************************/
				Integer cruiseLineNo = Integer.valueOf(request.getParameter("cruiseLineNo"));
				/***************************2.開始查詢資料****************************************/
				CruiseLineServiceImpl cruiseLineSvc = new CruiseLineServiceImpl();
				//抽出單艘船的資料
				CruiseLineVO cruiseLineVO = cruiseLineSvc.selectCruiseNo(cruiseLineNo);
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				request.setAttribute("cruiseLineVO", cruiseLineVO);    
				String url = "/back-end/cruiseline/cruiselineUpdate.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);// 成功轉交 shipUpdate.jsp
				successView.forward(request, response);
		}
		if ("updatePCLBefore".equals(action)) { // 來自update_emp_input.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer portsOfCallListNo = Integer.valueOf(request.getParameter("portsOfCallListNo"));
				Integer cruiseLineNo = Integer.valueOf(request.getParameter("cruiseLineNo"));
				String cruiseLines =request.getParameter("cruiseLines");
				/***************************2.開始修改資料*****************************************/
				CruiseLineServiceImpl clSvc = new CruiseLineServiceImpl();
				PortNameListVO portNameListVO = new PortNameListVO();
				portNameListVO = clSvc.selectPortNameListPNL(portsOfCallListNo);
				//抽出單艘船的資料
				/***************************3.修改完成,準備轉交(Send the Success view)*************/				
				request.setAttribute("portNameListVO", portNameListVO);
				request.setAttribute("cruiseLines", cruiseLines);
				request.setAttribute("cruiseLineNo", cruiseLineNo);
                String url = "/back-end/cruiseline/cruiselinePNLUpdate.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(request, response);
		}
		if ("updatePCL".equals(action)) { // 來自update_emp_input.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer portsOfCallListNo = Integer.valueOf(request.getParameter("portsOfCallListNo").trim());
				Integer cruiseLinesNo = Integer.valueOf(request.getParameter("cruiseLinesNo").trim());
				Integer portOfCallNo = Integer.valueOf(request.getParameter("portOfCallNo").trim());
				Integer portOfCallSequence = Integer.valueOf(request.getParameter("portOfCallSequence").trim());
				/***************************2.開始修改資料*****************************************/
				CruiseLineServiceImpl clSvc = new CruiseLineServiceImpl();
				PortsOfCallListVO portsOfCallListVO = clSvc.updatePCL(cruiseLinesNo, portOfCallNo, portOfCallSequence, portsOfCallListNo);
				CruiseLineVO cruiseLineVO = clSvc.selectCruiseNo(cruiseLinesNo);
				String lastname = clSvc.updateCLNames(portsOfCallListVO.getCruiseLinesNo()).getCruiseLines();
				cruiseLineVO.setCruiseLines(lastname);
				clSvc.selectCNLAll(cruiseLinesNo);
				//抽出單艘船的資料
				/***************************3.修改完成,準備轉交(Send the Success view)*************/				
				request.setAttribute("cruiseLineVO", cruiseLineVO);
                String url = "/back-end/cruiseline/cruiselineUpdate.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(request, response);
		}
			if ("insertPCL".equals(action)) { // 來自update_emp_input.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer portOfCallNo = Integer.valueOf(request.getParameter("portOfCallNo").trim());
				Integer cruiseLineNo = Integer.valueOf(request.getParameter("cruiseLineNo").trim());
				/***************************2.開始修改資料*****************************************/
				CruiseLineServiceImpl clSvc = new CruiseLineServiceImpl();
				CruiseLineVO cruiseLineVO = clSvc.selectCruiseNo(cruiseLineNo);
				//抽出單艘船的資料
				Integer portOfCallSequence = clSvc.selectPortNameListLast(cruiseLineNo).getPortOfCallSequence() + 1;
				PortsOfCallListVO portsOfCallListVO = clSvc.insertPCL(cruiseLineNo, portOfCallNo, portOfCallSequence);
				String lastname = clSvc.updateCLNames(portsOfCallListVO.getCruiseLinesNo()).getCruiseLines();
				cruiseLineVO.setCruiseLines(lastname);
				/***************************3.修改完成,準備轉交(Send the Success view)*************/				
				request.setAttribute("cruiseLineVO", cruiseLineVO);
                String url = "/back-end/cruiseline/cruiselineUpdate.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(request, response);
		}
		
			if ("deletePCL".equals(action)) { // 來自listAllEmp.jsp
				List<String> errorMsgs = new LinkedList<String>();
				request.setAttribute("errorMsgs", errorMsgs);
					/***************************1.接收請求參數***************************************/
					Integer portsOfCallListNo = Integer.valueOf(request.getParameter("portsOfCallListNo"));
					Integer cruiseLineNo = Integer.valueOf(request.getParameter("cruiseLineNo"));
					/***************************2.開始刪除資料***************************************/
					CruiseLineServiceImpl clSvc = new CruiseLineServiceImpl();
					clSvc.deletePCL(portsOfCallListNo);
					CruiseLineVO cruiseLineVO = clSvc.selectCruiseNo(cruiseLineNo);
					String lastname = clSvc.updateCLNames(cruiseLineNo).getCruiseLines();
					cruiseLineVO.setCruiseLines(lastname);
					/***************************3.刪除完成,準備轉交(Send the Success view)***********/
					//要跳回到shipUpdate.jsp需經過一個頁面，再傳入action=getOne_For_Update_Ship
					//資料庫取出的shipNo參數,存入req
					request.setAttribute("cruiseLineVO", cruiseLineVO);
					String url = "/back-end/cruiseline/cruiselineUpdate.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url);// 刪除成功後,轉交到刪除成功的網頁shipUpdate.jsp
					successView.forward(request, response);
			}
			if ("updateCL".equals(action)) {
				response.setContentType("image/jpeg");
				List<String> errorMsgs = new LinkedList<String>();
				request.setAttribute("errorMsgs", errorMsgs);
				Integer cruiseLineNo = Integer.valueOf(request.getParameter("cruiseLineNo"));
				String cruiseLines = request.getParameter("cruiseLines");
				Part fileEmpPictureId = request.getPart("cruiselinePic"); // Retrieves <input type="file" name="empPictureId">
				byte[] cruiselinePic = fileEmpPictureId.getInputStream().readAllBytes();
				LocalDate time = LocalDate.now();
				CruiseLineVO cruiseLineVO = new CruiseLineVO();
				cruiseLineVO.setCruiseLineNo(cruiseLineNo);
				cruiseLineVO.setCruiseLines(cruiseLines);
				cruiseLineVO.setCruiseLinePicture(cruiselinePic);
				cruiseLineVO.setTime(time);
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("cruiseLineVO", cruiseLineVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = request.getRequestDispatcher("/back-end/cruiseline/cruiselineUpdate.jsp");
					failureView.forward(request, response);
					return;
				}
				CruiseLineServiceImpl cLSSVC = new CruiseLineServiceImpl();
				cruiseLineVO=cLSSVC.updateCL(cruiseLines, cruiselinePic, time, cruiseLineNo); 
				String lastname = cLSSVC.updateCLNames(cruiseLineNo).getCruiseLines();
				cruiseLineVO.setCruiseLines(lastname);
				String url = "/back-end/cruiseline/cruiseline.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);// 編輯成功重載 EMP_GetOneEdiotrByManger.jsp
				successView.forward(request, response);
			}
			if ("cruiselineInsert".equals(action)) { // 來自update_emp_input.jsp的請求
				List<String> errorMsgs = new LinkedList<String>();
				request.setAttribute("errorMsgs", errorMsgs);
					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
					Part fileEmpPictureId = request.getPart("cruiselinePic"); // Retrieves <input type="file" name="empPictureId">
					byte[] cruiselinePic = fileEmpPictureId.getInputStream().readAllBytes();
					LocalDate time = null;
					try {
						time = java.sql.Date.valueOf(request.getParameter("time").trim()).toLocalDate();
					} catch (IllegalArgumentException e) {
						time = new java.sql.Date(System.currentTimeMillis()).toLocalDate();
						errorMsgs.add("請輸入日期!");
					}
					/***************************2.開始修改資料*****************************************/
					CruiseLineServiceImpl clSvc = new CruiseLineServiceImpl();
					clSvc.insertCL(cruiselinePic, time);
					clSvc.cruiseLineLast();
					/***************************3.修改完成,準備轉交(Send the Success view)*************/				
	                String url = "/back-end/cruiseline/cruiseline.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
					successView.forward(request, response);
			}
			if ("cruiselineInsertBefore".equals(action)) {
				String url = "/back-end/cruiseline/cruiselineInsert.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
			}
			if ("deleteCruiseNo".equals(action)) {
					/***************************1.接收請求參數***************************************/
					Integer cruiseLineNo = Integer.valueOf(request.getParameter("cruiseLineNo"));
					/***************************2.開始刪除資料***************************************/
					CruiseLineServiceImpl clSvc = new CruiseLineServiceImpl();
					clSvc.deleteCruiseLineNo(cruiseLineNo);
					/***************************3.刪除完成,準備轉交(Send the Success view)***********/
					//要跳回到shipUpdate.jsp需經過一個頁面，再傳入action=getOne_For_Update_Ship
					//資料庫取出的shipNo參數,存入req
					String url = "/back-end/cruiseline/cruiseline.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url);// 刪除成功後,轉交到刪除成功的網頁shipUpdate.jsp
					successView.forward(request, response);
			}
	}
}
