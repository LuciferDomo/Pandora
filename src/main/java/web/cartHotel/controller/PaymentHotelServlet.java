package web.cartHotel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
import web.member.bean.MemberVO;
import web.member.service.MemberService;
import web.member.service.impl.MemberServiceImpl;
import web.packages.bean.PackagesVO;

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

		if ("test".equals(action)) {
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
			MemberVO loginMemVO = (MemberVO) session.getAttribute("memVO");
		
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
			// 主要訂購人資訊
			Map<String, String> mainOrdererInfoMap = (Map<String, String>) session.getAttribute("mainOrdererInfoMap");
			// 同行人資訊
			List<Map<String, String>> peerPeoleInfoMapList = (List<Map<String, String>>) session.getAttribute("peerPeoleInfoMapList");
			// 訂購行程資訊
			PackagesVO packagesVO = (PackagesVO) session.getAttribute("packagesVO");
			// 登入會員資訊
			MemberVO loginMemVO = (MemberVO) session.getAttribute("memVO");
			
			// 訂購人資料更新
			updateMemberInfo(mainOrdererInfoMap, loginMemVO);
			
			// 同行人新增會員
			if (!CollectionUtils.isEmpty(peerPeoleInfoMapList)) {
				addNewMember(peerPeoleInfoMapList);
			}
			
			// 訂單成立
				// order table insert
				// order detail table insert
				// groupping list insert
		
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
		obj.setTotalAmount(((Integer) req.getSession().getAttribute("totalPrice")).toString());
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
		loginMemberInfo.setMemberPassportNo(mainOrdererInfoMap.get("memberPassportNo"));
		loginMemberInfo.setGender(mainOrdererInfoMap.get("sex"));
		loginMemberInfo.setMemberBirthday(LocalDate.parse(mainOrdererInfoMap.get("birthday")));
		loginMemberInfo.setLastUpdateDate(LocalDateTime.now());
		
		memSvc.updateMember(loginMemberInfo);
	}
	
	private void addNewMember(List<Map<String, String>> peerPeoleInfoMapList) {
		MemberService memSvc = new MemberServiceImpl();
		
		List<MemberVO> newMemberList = new ArrayList<>();
		List<String> allMemberNameList = memSvc.getAll().stream().map(MemberVO::getChineseName).collect(Collectors.toList());
		for(Map<String, String> peerPeoleInfoMap : peerPeoleInfoMapList) {
			String chineseName = peerPeoleInfoMap.get("peerChineseName");
				if(!allMemberNameList.contains(chineseName)) {
					MemberVO newMemberVO = new MemberVO();
					newMemberVO.setChineseName(peerPeoleInfoMap.get("peerChineseName"));
					newMemberVO.setDiscountNo(1);
					newMemberVO.setMemberEnglishFirstName(peerPeoleInfoMap.get("peerfirstName"));
					newMemberVO.setMemberEnglishLastName(peerPeoleInfoMap.get("peerlastName"));
					newMemberVO.setMemberPassportNo(peerPeoleInfoMap.get("peermemberPassportNo"));
					newMemberVO.setGender(peerPeoleInfoMap.get("peerSex"));
					newMemberVO.setMemberBirthday(LocalDate.parse(peerPeoleInfoMap.get("peerBirthday")));
					newMemberVO.setRegistrationTime(LocalDateTime.now());
					newMemberVO.setLastUpdateDate(LocalDateTime.now());
					newMemberVO.setMemberPassword(getAuthCode());
					
					newMemberList.add(newMemberVO);
				}
		}
		
		for(MemberVO memberVO : newMemberList) {
			memSvc.insertMember(memberVO);
		}
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
}
