package web.cartHotel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import web.getBookedRoom.service.impl.GetBookedRoomServiceImpl;
import web.room.joinbean.GetBookedRoomVO;
import web.room.joinbean.RoomTypeAndRoomListVO;
import web.roomPick.service.impl.RoomPickServiceImpl;

@WebServlet("/CartHotelServlet")
@MultipartConfig
public class CartHotelServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		HttpSession session = req.getSession();
//		Vector<BOOK> buylist = (Vector<BOOK>) session.getAttribute("shoppingcart");

		String action = req.getParameter("action");
		System.out.println(action);

		// 劃位頁面，傳入船號/房號，join Room_Type/ Room_List取資料
		if ("getRoomPickInfo".equals(action)) {
			String shipNo = req.getParameter("shipNo");
			String roomNo = req.getParameter("roomNo");

			RoomPickServiceImpl RPSI = new RoomPickServiceImpl();
			RoomTypeAndRoomListVO foundInfo = RPSI.getRoomInfo(Integer.parseInt(shipNo), roomNo);
			JSONObject obj = new JSONObject();
			obj.put("shipNo", foundInfo.getShipNo());
			obj.put("roomListNo", foundInfo.getRoomListNo());
			obj.put("roomTypeNo", foundInfo.getRoomTypeNo());
			obj.put("roomType", foundInfo.getRoomType());
			obj.put("roomNo", foundInfo.getRoomNo());
			obj.put("roomPrice", foundInfo.getRoomPrice());
			obj.put("maxCapacity", foundInfo.getMaxCapacity());

			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			out.write(obj.toString());
			out.flush();
			out.close();
			return;
		}
		if ("confirmRoomTypeAndShowShip".equals(action)) {
			String packageNo = req.getParameter("packageNo");

			GetBookedRoomServiceImpl GBRSI = new GetBookedRoomServiceImpl();
			List<GetBookedRoomVO> foundInfo = GBRSI.getBookedRoom(Integer.parseInt(packageNo));
			JSONArray array = new JSONArray();

			for (int i = 0; i < foundInfo.size(); i++) {
				String foundBookedRoomNo = foundInfo.get(i).getBookedRoomNo();

				JSONObject obj = new JSONObject();
				obj.put("bookedRoomNo", foundBookedRoomNo);
				array.put(obj);
			}
			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			out.write(array.toString());
			out.flush();
			out.close();
			return;
		}

		if ("goToPayment".equals(action)) {
			String shipNo = req.getParameter("shipNo");
			String[] selectedRoomArray = req.getParameterValues("selectedRoomArray[]");

			RoomPickServiceImpl roomPickServiceImpl = new RoomPickServiceImpl();
			List<RoomTypeAndRoomListVO> seletedRoomInfo = new ArrayList<>();
			for(String roomListNo : selectedRoomArray) {
				seletedRoomInfo.add(roomPickServiceImpl.getRoomInfo(Integer.parseInt(shipNo), roomListNo));
			}

			session.setAttribute("seletedRoomInfo", seletedRoomInfo);

			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			JSONObject obj = new JSONObject();
			out.write(obj.toString());
			out.flush();
			out.close();
			return;
		}
	}
}
