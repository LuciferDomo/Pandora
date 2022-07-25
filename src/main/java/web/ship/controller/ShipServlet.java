package web.ship.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.ship.bean.RoomTotalVO;
import web.ship.bean.RoomTypeTotalCountVO;
import web.ship.bean.ShipsVO;
import web.ship.service.impl.ShipService;


@WebServlet("/ShipServlet")
public class ShipServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		

		if ("getOne_For_Update_Ship".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);
			
				/***************************1.接收請求參數****************************************/
				Integer shipNo = Integer.valueOf(request.getParameter("shipNo"));
//				System.out.println(request.getParameter("shipNo"));
				
				/***************************2.開始查詢資料****************************************/
				ShipService shipSvc = new ShipService();
				ShipsVO shipsVO = shipSvc.getOneShip(shipNo);
//				System.out.println(shipsVO);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				request.setAttribute("shipsVO", shipsVO);         // 資料庫取出的empVO物件,存入req
				String url = "/shipUpdate.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(request, response);
		}
		
			if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);

				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
String shipname = request.getParameter("shipname");
				if (shipname == null || shipname.trim().length() == 0) {
					errorMsgs.add("郵輪名稱: 請勿空白");
				} 
				
				java.sql.Date shipstart = null;
				try {
shipstart = java.sql.Date.valueOf(request.getParameter("shipstart").trim());
				} catch (IllegalArgumentException e) {
					shipstart=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				java.sql.Date shipmain = null;
				try {
shipmain = java.sql.Date.valueOf(request.getParameter("shipmain").trim());
				} catch (IllegalArgumentException e) {
					shipmain=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				Integer shipfloor = null;
				try {
shipfloor = Integer.parseInt(request.getParameter("shipfloor").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("郵輪樓層請填數字.");
				}
				
				Integer shipstatusNo =null;
				try {	
shipstatusNo = Integer.parseInt(request.getParameter("shipstatusNo").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("郵輪樓層請填數字.");
				}
				
				
//				System.out.println("shipname="+shipname+"shipstart="+shipstart+"shipmain="+shipmain+"shipfloor="+shipfloor+"shipstatusNo="+shipstatusNo);
				
				
				
				
				
				
				ShipsVO shipsVO = new ShipsVO();
				shipsVO.setShipName(shipname);
				shipsVO.setStarStatus(shipstart);
				shipsVO.setLastmaintenanceTime(shipmain);
				shipsVO.setFloorOfShip(shipfloor);
				shipsVO.setShipStatusNo(shipstatusNo);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
request.setAttribute("shipsVO", shipsVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = request
							.getRequestDispatcher("shipInsert.jsp");
					failureView.forward(request, response);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				ShipService shipSvc = new ShipService();
				shipsVO = shipSvc.addShip(shipname,shipstart,shipmain,shipfloor,shipstatusNo);
//				System.out.println("success");
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				
				String url = "/shipLast.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(request, response);				
		}
			if ("insertLast".equals(action)) { // 來自addEmp.jsp的請求  
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				request.setAttribute("errorMsgs", errorMsgs);

					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
//					System.out.println("shipname="+shipname+"shipstart="+shipstart+"shipmain="+shipmain+"shipfloor="+shipfloor+"shipstatusNo="+shipstatusNo);
					
					Integer shipNo = Integer.valueOf(request.getParameter("shipNo"));
//					System.out.println(shipNo);
					RoomTypeTotalCountVO roomTypeTotalCountVO = new RoomTypeTotalCountVO();
					roomTypeTotalCountVO.setShipNo(shipNo);
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
	request.setAttribute("shipNo", shipNo); // 含有輸入格式錯誤的empVO物件,也存入req
						RequestDispatcher failureView = request
								.getRequestDispatcher("/shipInsert");
						failureView.forward(request, response);
						return;
					}
					
					/***************************2.開始新增資料***************************************/
					ShipService shipSvc = new ShipService();
					shipSvc.addRTTCLast(shipNo);
//					System.out.println("success");
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					String url = "/ships.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
					successView.forward(request, response);				
			}
			
			
			if ("insertRTTC".equals(action)) { // 來自addEmp.jsp的請求  
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				request.setAttribute("errorMsgs", errorMsgs);

					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					
					Integer shipNo = null;
					try {
	shipNo = Integer.parseInt(request.getParameter("shipNo").trim());
					} catch (NumberFormatException e) {
						errorMsgs.add("郵輪編號請填數字");
					}
					
					Integer roomTypeNo =null;
					try {	
	roomTypeNo = Integer.parseInt(request.getParameter("roomTypeNo").trim());
					} catch (NumberFormatException e) {
						errorMsgs.add("請選擇房型");
					}
					Integer maxCountOfRoomType = null;
					try {
	maxCountOfRoomType = Integer.parseInt(request.getParameter("maxCountOfRoomType").trim());
					} catch (NumberFormatException e) {
						errorMsgs.add("請填寫房型數量");
					}
					
					
//					System.out.println("shipNo="+shipNo+"roomTypeNo="+roomTypeNo+"maxCountOfRoomType="+maxCountOfRoomType);
					
					
					
					
					
					
					RoomTypeTotalCountVO roomTypeTotalCountVO = new RoomTypeTotalCountVO();
					roomTypeTotalCountVO.setShipNo(shipNo);
					roomTypeTotalCountVO.setRoomTypeNo(roomTypeNo);
					roomTypeTotalCountVO.setMaxCountOfRoomType(maxCountOfRoomType);
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
	request.setAttribute("shipNo", shipNo); // 含有輸入格式錯誤的empVO物件,也存入req
						RequestDispatcher failureView = request
								.getRequestDispatcher("/shipInsertRTTC.jsp");
						failureView.forward(request, response);
						return;
					}
					
					/***************************2.開始新增資料***************************************/
					ShipService shipSvc = new ShipService();
					RoomTypeTotalCountVO check=shipSvc.selectOnly(shipNo, roomTypeNo);
//					System.out.println(check);
//					System.out.println(check.getShipNo());
					Integer abcInteger =check.getrTTCNo();
					if (check.getShipNo()==shipNo && check.getRoomTypeNo()==roomTypeNo) {
						maxCountOfRoomType += check.getMaxCountOfRoomType();
						roomTypeTotalCountVO = shipSvc.updateRTTC(shipNo, roomTypeNo, maxCountOfRoomType,abcInteger);

						request.setAttribute("shipNo", roomTypeTotalCountVO.getShipNo());
						request.setAttribute("roomTypeNo", roomTypeTotalCountVO.getRoomTypeNo());
						String url = "/shipUpdateRe.jsp";
						RequestDispatcher successView = request.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
						successView.forward(request, response);	
						return;
					}
					roomTypeTotalCountVO = shipSvc.addRTTC(shipNo, roomTypeNo, maxCountOfRoomType);
//					System.out.println("success");
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					String url = "/shipLastRTTC.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
					successView.forward(request, response);				
			}
			if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				request.setAttribute("errorMsgs", errorMsgs);
			
					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
					Integer shipNo = Integer.valueOf(request.getParameter("shipNo"));
								
					String shipname = request.getParameter("shipname");
					if (shipname == null || shipname.trim().length() == 0) {
						errorMsgs.add("郵輪名稱: 請勿空白");
					} 
		
					java.sql.Date shipstart = null;
					try {
shipstart = java.sql.Date.valueOf(request.getParameter("shipstart"));
					} catch (IllegalArgumentException e) {
						shipstart=new java.sql.Date(System.currentTimeMillis());
						errorMsgs.add("請輸入日期!");
					}
		
					java.sql.Date shipmain = null;
					try {
shipmain = java.sql.Date.valueOf(request.getParameter("shipmain"));
					} catch (IllegalArgumentException e) {
						shipmain=new java.sql.Date(System.currentTimeMillis());
						errorMsgs.add("請輸入日期!");
					}
					
					Integer shipfloor = null;
					try {
shipfloor = Integer.parseInt(request.getParameter("shipfloor").trim());
					} catch (NumberFormatException e) {
						errorMsgs.add("郵輪樓層請填數字");
					}
					
					Integer shipstatusNo =null;
					try {	
shipstatusNo = Integer.parseInt(request.getParameter("shipstatusNo"));
					} catch (NumberFormatException e) {
						errorMsgs.add("郵輪狀態錯誤");
					}
					
					ShipsVO shipsVO = new ShipsVO();
					shipsVO.setShipNo(shipNo);
					shipsVO.setShipName(shipname);
					shipsVO.setStarStatus(shipstart);
					shipsVO.setLastmaintenanceTime(shipmain);
					shipsVO.setFloorOfShip(shipfloor);
					shipsVO.setShipStatusNo(shipstatusNo);
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
request.setAttribute("shipsVO", shipsVO); // 含有輸入格式錯誤的empVO物件,也存入req
					System.out.println(shipsVO.getShipNo());
						RequestDispatcher failureView = request
								.getRequestDispatcher("shipUpdate.jsp");
						failureView.forward(request, response);
						System.out.println("失敗");
						return; //程式中斷
					}
					
					/***************************2.開始修改資料*****************************************/
					ShipService shipSvc = new ShipService();
					shipsVO = shipSvc.updateShip( shipname, shipstart, shipmain,shipfloor, shipstatusNo,shipNo);
					System.out.println(shipsVO);
					/***************************3.修改完成,準備轉交(Send the Success view)*************/
					request.setAttribute("shipsVO", shipsVO); // 資料庫update成功後,正確的的empVO物件,存入req
					String url = "/ships.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
					successView.forward(request, response);
			}
			
			if ("updateRTTC".equals(action)) { // 來自update_emp_input.jsp的請求
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				request.setAttribute("errorMsgs", errorMsgs);
			
					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
					Integer rTTCNo = Integer.valueOf(request.getParameter("rTTCNo"));
					Integer shipNo = null;
					try {
	shipNo = Integer.parseInt(request.getParameter("shipNo").trim());
					} catch (NumberFormatException e) {
						errorMsgs.add("郵輪編號請填數字");
					}
					
					Integer roomTypeNo =null;
					try {	
	roomTypeNo = Integer.parseInt(request.getParameter("roomTypeNo").trim());
					} catch (NumberFormatException e) {
						errorMsgs.add("請選擇房型");
					}
					Integer maxCountOfRoomType = null;
					try {
	maxCountOfRoomType = Integer.parseInt(request.getParameter("maxCountOfRoomType").trim());
					} catch (NumberFormatException e) {
						errorMsgs.add("請填寫房型數量");
					}
					
					
//					System.out.println("shipNo="+shipNo+"roomTypeNo="+roomTypeNo+"maxCountOfRoomType="+maxCountOfRoomType);
					
					
					RoomTypeTotalCountVO roomTypeTotalCountVO = new RoomTypeTotalCountVO();
					roomTypeTotalCountVO.setShipNo(shipNo);
					roomTypeTotalCountVO.setRoomTypeNo(roomTypeNo);
					roomTypeTotalCountVO.setMaxCountOfRoomType(maxCountOfRoomType);
					roomTypeTotalCountVO.setrTTCNo(rTTCNo);
					RoomTotalVO roomTotalVO = new RoomTotalVO();
					roomTotalVO.setrTTCNo(rTTCNo);
					roomTotalVO.setShipNo(shipNo);
					roomTotalVO.setRoomTypeNo(roomTypeNo);
					roomTotalVO.setMaxCountOfRoomType(maxCountOfRoomType);
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						request.setAttribute("rTTCNo", rTTCNo); 
	request.setAttribute("roomTotalVO", roomTotalVO); // 含有輸入格式錯誤的empVO物件,也存入req
						RequestDispatcher failureView = request
								.getRequestDispatcher("/shipUpdateRTTC.jsp");
						failureView.forward(request, response);
						return;
					}
					
					/***************************2.開始新增資料***************************************/
					ShipService shipSvc = new ShipService();
					roomTypeTotalCountVO = shipSvc.updateRTTC(shipNo, roomTypeNo, maxCountOfRoomType, rTTCNo);
//					System.out.println("success");
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					request.setAttribute("rTTCNo", rTTCNo); 
					String url = "/shipUpdateRTTCSuccess.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
					successView.forward(request, response);	
			}
			if ("delete".equals(action)) { // 來自listAllEmp.jsp

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				request.setAttribute("errorMsgs", errorMsgs);
		
					/***************************1.接收請求參數***************************************/
					Integer shipNo = Integer.valueOf(request.getParameter("shipNo"));
					
					/***************************2.開始刪除資料***************************************/
					ShipService shipSvc = new ShipService();
					shipSvc.deleteShip(shipNo);
					
					/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
					String url = "ships.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
					successView.forward(request, response);
			}
			
			if ("deleteRTTC".equals(action)) { // 來自listAllEmp.jsp

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				request.setAttribute("errorMsgs", errorMsgs);
		
					/***************************1.接收請求參數***************************************/
					Integer rTTCNo = Integer.valueOf(request.getParameter("rTTCNo"));
					Integer shipNo = Integer.valueOf(request.getParameter("shipNo"));
					/***************************2.開始刪除資料***************************************/
					ShipService shipSvc = new ShipService();
					shipSvc.deleteRTTC(rTTCNo);
					
					/***************************3.刪除完成,準備轉交(Send the Success view)***********/
					request.setAttribute("shipNo", shipNo);
					String url = "/shipDeleteRTTCSucccess.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
					successView.forward(request, response);
			}
			
			if ("insertRTTCBefore".equals(action)) { // 來自listAllEmp.jsp的請求

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				request.setAttribute("errorMsgs", errorMsgs);
				
					/***************************1.接收請求參數****************************************/
					Integer shipNo = Integer.valueOf(request.getParameter("shipNo"));
//					System.out.println(request.getParameter("shipNo"));
					
					/***************************2.開始查詢資料****************************************/
//					ShipService shipSvc = new ShipService();
//					ShipsVO shipsVO = shipSvc.getOneShip(shipNo);
//					System.out.println(shipsVO);
									
					/***************************3.查詢完成,準備轉交(Send the Success view)************/
					request.setAttribute("shipNo", shipNo);         // 資料庫取出的empVO物件,存入req
					String url = "/shipInsertRTTC.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
					successView.forward(request, response);
			}
			
			if ("updateRTTCBefore".equals(action)) { // 來自listAllEmp.jsp的請求

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				request.setAttribute("errorMsgs", errorMsgs);
				
					/***************************1.接收請求參數****************************************/
					Integer rTTCNo = Integer.valueOf(request.getParameter("rTTCNo"));
//					System.out.println(request.getParameter("shipNo"));
					
					/***************************2.開始查詢資料****************************************/
					ShipService shipSvc = new ShipService();
					RoomTotalVO roomTotalVO = shipSvc.getRTTC(rTTCNo);
//					System.out.println(shipsVO);
									
					/***************************3.查詢完成,準備轉交(Send the Success view)************/
					request.setAttribute("roomTotalVO", roomTotalVO);         // 資料庫取出的empVO物件,存入req
					String url = "/shipUpdateRTTC.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
					successView.forward(request, response);
			}
		
	}

	
}