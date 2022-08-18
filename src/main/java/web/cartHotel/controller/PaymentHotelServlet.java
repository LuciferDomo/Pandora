package web.cartHotel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.util.CollectionUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
import ecpay.payment.integration.domain.InvoiceObj;
import web.discount.bean.DiscountVO;
import web.grouppinglist.service.GrouppingListService;
import web.grouppinglist.service.impl.GrouppingListServiceImpl;
import web.mailservice.MailService;
import web.member.bean.MemberVO;
import web.member.service.MemberService;
import web.member.service.impl.MemberServiceImpl;
import web.order.service.OrderService;
import web.order.service.impl.OrderServiceImpl;
import web.orderdetail.service.OrderDetailService;
import web.orderdetail.service.impl.OrderDetailServiceImpl;
import web.packages.bean.PackagesVO;
import web.room.joinbean.RoomTypeAndRoomListVO;

@WebServlet("/PaymentHotelServlet")
@MultipartConfig
public class PaymentHotelServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();

		String action = req.getParameter("action");

		if ("orderEcpay".equals(action)) {
			String mainOrdererInfo = req.getParameter("mainOrdererInfo");
			Map<String, String> mainOrdererInfoMap = new ObjectMapper().readValue(mainOrdererInfo, HashMap.class);

			String[] peerPeoleInfoArray = req.getParameterValues("peerPeoleInfoArray[]");
			List<Map<String, String>> peerPeoleInfoMapList = new ArrayList<>();
			if (peerPeoleInfoArray != null) {
				for (String peerPeoleInfo : peerPeoleInfoArray) {
					Map<String, String> peerPeoleInfoMap = new ObjectMapper().readValue(peerPeoleInfo, HashMap.class);
					peerPeoleInfoMapList.add(peerPeoleInfoMap);
				}
			}

			session.setAttribute("mainOrdererInfoMap", mainOrdererInfoMap);
			session.setAttribute("peerPeoleInfoMapList", peerPeoleInfoMapList);

			// 參數列印用
			for (Map.Entry<String, String> entry : mainOrdererInfoMap.entrySet()) {
				System.out.println(entry.getKey() + ":" + entry.getValue());
			}

			System.out.println("---------------------------------------");

			for (Map<String, String> map : peerPeoleInfoMapList) {
				for (Map.Entry<String, String> entry : map.entrySet()) {
					System.out.println(entry.getKey() + ":" + entry.getValue());
				}
				System.out.println("---------------------------------------");
			}

			// 綠界
			PackagesVO packagesVO = (PackagesVO) session.getAttribute("packagesVO");
			MemberVO loginMemVO = (MemberVO) session.getAttribute("loginMember");
		
			String form = ecpay(packagesVO, loginMemVO, req);
			
			res.setContentType("text/html; charset=UTF-8");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("text", form);
			out.write(jsonObj.toString());

			out.flush();
			out.close();
		}

		if ("tradeSuccess".equals(action)) {
			// 1 .訂購人資料更新
				// 主要訂購人資訊
			Map<String, String> mainOrdererInfoMap = (Map<String, String>) session.getAttribute("mainOrdererInfoMap");
				// 登入會員資訊
			MemberVO loginMemVO = (MemberVO) session.getAttribute("loginMember");
			updateMemberInfo(mainOrdererInfoMap, loginMemVO);
			
			// 2. 同行人新增會員
				// 同行人資訊
			List<MemberVO> newMemberList = null;
			List<Map<String, String>> peerPeoleInfoMapList = (List<Map<String, String>>) session.getAttribute("peerPeoleInfoMapList");
			if (!CollectionUtils.isEmpty(peerPeoleInfoMapList)) {
				newMemberList = addNewMember(peerPeoleInfoMapList);
			}
			
			// 3. 訂單成立
				// 訂購行程資訊
			PackagesVO packagesVO = (PackagesVO) session.getAttribute("packagesVO");
			Integer afterDiscountTotalPrice = (Integer) session.getAttribute("afterDiscountTotalPrice");
			Integer totalPirce = (Integer) session.getAttribute("totalPirce");
			DiscountVO discountVO = (DiscountVO) session.getAttribute("discountVO");
			List<RoomTypeAndRoomListVO> seletedRoomInfoList = (List<RoomTypeAndRoomListVO>) session.getAttribute("seletedRoomInfo");	
				// order table insert
			OrderService orderSvc = new OrderServiceImpl();
			Integer totalNumberOfPeople = 1 + (CollectionUtils.isEmpty(peerPeoleInfoMapList) ? 0 : peerPeoleInfoMapList.size());
			Integer newOrderNo = orderSvc.createOrder(totalNumberOfPeople, loginMemVO, packagesVO, afterDiscountTotalPrice, totalPirce, discountVO);
				
				// order detail table insert
			OrderDetailService orderDetailSvc = new OrderDetailServiceImpl();
			for (RoomTypeAndRoomListVO roomInfo : seletedRoomInfoList) {
				orderDetailSvc.createOrderDetail(newOrderNo, packagesVO.getPackageNo(), roomInfo.getRoomListNo());
			}
				
				// groupping list insert
			MemberService memberSvc = new MemberServiceImpl();
			List<MemberVO> memberVOList = memberSvc.getAll();
			
					// 取得訂單人員會員ID
			List<String> memberNameList = new ArrayList<>();
			memberNameList.add(mainOrdererInfoMap.get("chineseName"));
			if (!CollectionUtils.isEmpty(peerPeoleInfoMapList)) {
				for(Map<String, String> peerPeoleInfoMap : peerPeoleInfoMapList) {
					memberNameList.add(peerPeoleInfoMap.get("peerChineseName"));
				}
			}
			
			List<MemberVO> orderMemberInfo = memberVOList.stream()
														 .filter(memberVO -> memberNameList.contains(memberVO.getChineseName()))
														 .collect(Collectors.toList());
			
			GrouppingListService grouppingListSvc = new GrouppingListServiceImpl();
			for (MemberVO memberVO : orderMemberInfo) {
				grouppingListSvc.createGrouppingList(1, newOrderNo, memberVO.getMemberId(), 1);
			}
			
			// 4. email service (for new member)
			if(!CollectionUtils.isEmpty(newMemberList)) {
				MailService mailService = new MailService();
				for(MemberVO memberVO : newMemberList) {
					String info = "<div><h3>感謝您的訂購!</h3></div>" +
								  "<div><p>以下是"+ loginMemVO.getChineseName() +"為您預定的假期，請協助核對確認。<br />有需任何協助之處，請不吝聯繫我們。</p></div>" +
								  "<div><h3><strong></strong>您的訂購內容</h3></div>" +
								  "<div class='step'><table width='200'><tbody>" +
								  "<tr><td><strong>訂購人姓名</strong></td><td>" + loginMemVO.getChineseName() + "</td></tr>" +
								  "<tr><td><strong>行程名稱</strong></td><td>" + packagesVO.getPackageName() + "</td></tr>" +
								  "<tr><td><strong>出發日期</strong></td><td>" + packagesVO.getRegistrationStartTime() + "</td></tr>" +
								  "<tr><td><strong>行程天數</strong></td><td>" + calculateDays(packagesVO) + "</td></tr>" +
								  "<tr><td><strong>房間數量</strong></td><td>" + seletedRoomInfoList.size() + "</td></tr>" +
								  "<tr><td><strong>人數</strong></td><td>" + totalNumberOfPeople + "</td></tr>" +
								  "<tr><td><strong>付款方式</strong></td><td>Credit card</td></tr>" +
								  "<tr><td><strong>總計</strong></td><td>$" + afterDiscountTotalPrice + "</td></tr>" +
								  "</tbody></table></div>" + 
								  "<div><h3 style='color: red;'>系統通知</h3></div>" + 
								  "<div><p>系統已自動將您加入會員，請使用您的信箱地址與隨機生成密碼進行登入。</p></div>" +
								  "<div><p>隨機密碼為：" + memberVO.getMemberPassword() + "</p></div>" +
								  "<div><a href='http://localhost:8081/pandora/front-end/Member/MemberLogin.jsp'><img src='cid:image'></a></div>";
					mailService.sendMail(memberVO.getMemberEmail(), "Royal Pandora行程通知信", info);
				}
			}
			
			// 5. 轉交
			session.setAttribute("totalNumberOfPeople", totalNumberOfPeople);
			session.setAttribute("seletedRoomInfoList", seletedRoomInfoList);
			session.setAttribute("afterDiscountTotalPrice", afterDiscountTotalPrice);
			session.setAttribute("newOrderNo", newOrderNo);
			
			String url = "/front-end/cart/Confirmation_Hotel.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);  
			successView.forward(req, res);
		}
	}
	
	private String ecpay(PackagesVO packagesVO, MemberVO memVO, HttpServletRequest req) {
		AllInOne allInOne = new AllInOne("");
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		InvoiceObj invoice = null;

		Date date = new Date();
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		DateFormat tradeNoDate = new SimpleDateFormat("yyyyMMddhhmmss");


		obj.setMerchantTradeNo("P" + packagesVO.getPackageNo() + "M" + memVO.getMemberId() + tradeNoDate.format(date));
		obj.setMerchantTradeDate(sdf.format(date));
		obj.setTotalAmount(((Integer) req.getSession().getAttribute("afterDiscountTotalPrice")).toString());
		obj.setTradeDesc("謝謝大小吳的教導!!");
		obj.setItemName(packagesVO.getPackageName());
		obj.setReturnURL(new String(req.getRequestURL()));
		obj.setNeedExtraPaidInfo("N");
		obj.setRedeem("N");
		obj.setClientBackURL(req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath() + "/PaymentHotelServlet?action=tradeSuccess");
		obj.setChooseSubPayment("Credit");
		return allInOne.aioCheckOut(obj, invoice);
	}
	
	private void updateMemberInfo(Map<String, String> mainOrdererInfoMap, MemberVO loginMemberInfo) {
		System.out.println("updateMemberInfo in");
		MemberService memSvc = new MemberServiceImpl();
		// 訂購人資料更新
		loginMemberInfo.setChineseName(mainOrdererInfoMap.get("chineseName"));
		loginMemberInfo.setMemberAddress(mainOrdererInfoMap.get("county") + 
									mainOrdererInfoMap.get("district") + 
									mainOrdererInfoMap.get("zipcode") + 
									mainOrdererInfoMap.get("address"));
		loginMemberInfo.setMemberEmail(mainOrdererInfoMap.get("email"));
		loginMemberInfo.setMemberEnglishFirstName(mainOrdererInfoMap.get("firstName"));
		loginMemberInfo.setMemberEnglishLastName(mainOrdererInfoMap.get("lastName"));
		loginMemberInfo.setMemberPassportNo(mainOrdererInfoMap.get("passportNumber"));
		loginMemberInfo.setGender(mainOrdererInfoMap.get("sex"));
		loginMemberInfo.setMemberBirthday(LocalDate.parse(mainOrdererInfoMap.get("birthday")));
		loginMemberInfo.setLastUpdateDate(LocalDateTime.now());
		
		memSvc.updateMemberSe(loginMemberInfo);
	}
	
	private List<MemberVO> addNewMember(List<Map<String, String>> peerPeoleInfoMapList) {
		System.out.println("addNewMember in");
		MemberService memSvc = new MemberServiceImpl();
		
		List<MemberVO> newMemberList = new ArrayList<>();
		List<String> allMemberNameList = memSvc.getAll().stream().map(MemberVO::getChineseName).collect(Collectors.toList());
		for(Map<String, String> peerPeoleInfoMap : peerPeoleInfoMapList) {
			String chineseName = peerPeoleInfoMap.get("peerChineseName");
				if(!allMemberNameList.contains(chineseName)) {
					MemberVO newMemberVO = new MemberVO();
					newMemberVO.setChineseName(peerPeoleInfoMap.get("peerChineseName"));
					newMemberVO.setDiscountNo(1);
					newMemberVO.setMemberEnglishFirstName(peerPeoleInfoMap.get("peerFirstName"));
					newMemberVO.setMemberEnglishLastName(peerPeoleInfoMap.get("peerLastName"));
					newMemberVO.setMemberPassportNo(peerPeoleInfoMap.get("peerPassportNumber"));
					newMemberVO.setGender(peerPeoleInfoMap.get("peerSex"));
					newMemberVO.setMemberBirthday(LocalDate.parse(peerPeoleInfoMap.get("peerBirthday")));
					newMemberVO.setAccumulatedConsumption(0);
					newMemberVO.setRegistrationTime(LocalDateTime.now());
					newMemberVO.setLastUpdateDate(LocalDateTime.now());
					newMemberVO.setMemberPassword(getAuthCode());
					newMemberVO.setMemberEmail(peerPeoleInfoMap.get("peerEmail"));
					newMemberVO.setMemberPhoneNumber(peerPeoleInfoMap.get("peerTelephone"));
					
					newMemberList.add(newMemberVO);
				}
		}
		
		for(MemberVO memberVO : newMemberList) {
			memSvc.insertMember(memberVO);
		}
		return newMemberList;
	}
	
	private String getAuthCode() {
		int count = 0;
		StringBuilder autoCode = new StringBuilder();
		while (count < 8) {
			int rdNumber = (int) (Math.random() * 75 + 48);
			if ((rdNumber >= 48 && rdNumber <= 57) || (rdNumber >= 65 && rdNumber <= 90 || (rdNumber >= 97 && rdNumber <= 122))) {
				autoCode.append((char) rdNumber);
				count++;
			}
		}
		return autoCode.toString();
	}
	
	private int calculateDays(PackagesVO packagesVO) {
		// 計算行程天數
		ZoneId defaultZoneId = ZoneId.systemDefault();
		DateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = Date.from(packagesVO.getDepartureTime().toLocalDate().atStartOfDay(defaultZoneId).toInstant());
		Date endDate = Date.from(packagesVO.getArrivalTime().toLocalDate().atStartOfDay(defaultZoneId).toInstant());
		long startTime = startDate.getTime();
		long endTime = endDate.getTime();
		int days = (int) ((endTime - startTime) / (1000 * 60 * 60 * 24));
		
		return days;
	}
}
