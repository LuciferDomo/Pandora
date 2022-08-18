package web.cartHotel.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import web.member.bean.MemberVO;
import web.member.service.MemberService;
import web.member.service.impl.MemberServiceImpl;

@WebServlet("/CartMemberLoginServlet")
@MultipartConfig
public class CartMemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println(req.getContextPath());

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
//登入
		if ("MemberLogin".equals(action)) {

			String email = req.getParameter("email");
			String password = req.getParameter("password");

			MemberVO selectMemberVO = new MemberVO();
			selectMemberVO.setMemberEmail(email);
			selectMemberVO.setMemberPassword(password);
			MemberService memberService = new MemberServiceImpl();
			
			MemberVO memberVO = memberService.selectByEmailAndPassword(selectMemberVO);
			req.getSession().setAttribute("loginMember", memberVO);
//			System.out.println(memberVO.toString());
			
			HttpSession session = req.getSession();
			if (memberVO != null) {
				String url = (String)session.getAttribute("location");
				if(url == "" || url == null) {
					url = "/front-end/package/homepage.jsp";
				}
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);
				return;
			} else {
				req.setAttribute("errorMsg", "帳號密碼錯誤");
				RequestDispatcher failView = req.getRequestDispatcher("/front-end/cart/CartMemberLogin.jsp");
				failView.forward(req, resp);
				return;
			}
		}
		
//登出	
		if ("MemberSignOut".equals(action)) {
			String url = req.getContextPath() + "/front-end/Member/MemberHomePage.jsp";
			req.getSession().invalidate();
			resp.sendRedirect(url);

		}
		
//全部會員資料
//		if ("MemberAllList".equals(action)) {
//
//			MemberService memberSerive = new MemberServiceImpl();
//			List<MemberVO> memberAllList = memberSerive.getAll();
//			req.setAttribute("memberAllList", memberAllList);
//			RequestDispatcher successView = req.getRequestDispatcher("/Member_InfoAll.jsp");
//			successView.forward(req, resp);
//			return;
//		}
//個別會員資料

//會員資料修改
		if ("MemberUpdate".equals(action)) {
			resp.setContentType("image/jpeg");
			String url = req.getContextPath() + "<%=request.getContextPath()%>/front-end/Member/Member_Info.jsp";
			List<String> errorMsgs = new LinkedList<String>();
			Map<String, String> errorMsgsMap = new LinkedHashMap<>();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("errorMsgsMap", errorMsgsMap);
			
			MemberServiceImpl memberSvc = new MemberServiceImpl();
					
			
			Integer memberId = Integer.valueOf(req.getParameter("memberId").trim());
			
			Part fileMemberPictureId = req.getPart("memberPictureId"); // Retrieves <input type="file" name="empPictureId">
			byte[] memberPictureId = fileMemberPictureId.getInputStream().readAllBytes();
			
			String chineseName = req.getParameter("chineseName");
			String chineseNameReg = "^[(\u4e00-\u9fa5)]{2,10}$";
			if (chineseName == null || chineseName.trim().length() == 0) {
				errorMsgs.add("中文姓名: 請勿空白");
				errorMsgsMap.put("chineseName", "中文姓名: 請勿空白");
			} else if (!chineseName.trim().matches(chineseNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("中文姓名: 限輸入中文");
				errorMsgsMap.put("chineseName", "中文姓名: 限輸入中文");
			}
			
//			LocalDate memberBirthday = null;
//			try {
//				memberBirthday = java.sql.Date.valueOf(req.getParameter("memberBirthday").trim()).toLocalDate();
//			} catch (IllegalArgumentException e) {
//				memberBirthday = new java.sql.Date(System.currentTimeMillis()).toLocalDate();
//				errorMsgs.add("請輸入生日日期!");
//				errorMsgsMap.put("memberBirthday", "請輸入生日日期!");
//			}
			
			String memberEnglishFirstName = req.getParameter("memberEnglishFirstName");
			String memberEnglishFirstNameReg = "[A-Za-z]{1,50}";
			if (memberEnglishFirstName == null || memberEnglishFirstName.trim().length() == 0) {
				errorMsgs.add("英文姓名: 請勿空白");
				errorMsgsMap.put("memberEnglishFirstName", "英文姓名: 請勿空白");
			} else if (!memberEnglishFirstName.trim().matches(memberEnglishFirstNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("英文姓名: 限輸入英文字母");
				errorMsgsMap.put("memberEnglishFirstName", "英文姓名: 限輸入英文字母");
			}

			String memberEnglishLastName = req.getParameter("memberEnglishLastName");
			String memberEnglishLastNameReg = "[A-Za-z]{1,50}";
			if (memberEnglishLastName == null || memberEnglishLastName.trim().length() == 0) {
				errorMsgs.add("英文姓氏: 請勿空白");
				errorMsgsMap.put("memberEnglishLastName", "英文姓氏: 請勿空白");
			} else if (!memberEnglishLastName.trim().matches(memberEnglishLastNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("英文姓氏: 限輸入英文字母");
				errorMsgsMap.put("memberEnglishLastName", "英文姓氏: 限輸入英文字母");
			}

			
//			String memberPassportNo = req.getParameter("memberPassportNo");
//			String memberPassportNoReg = "^[0-9]{9}$";
//			if (memberPassportNo == null || memberPassportNo.trim().length() == 0) {
//				errorMsgs.add("護照號碼: 請勿空白");
//				errorMsgsMap.put("memberPassportNo", "護照號碼: 請勿空白");
//			} else if (!memberPassportNo.trim().matches(memberPassportNoReg)) { // 以下練習正則(規)表示式(regular-expression)
//				errorMsgs.add("護照號碼: 請輸入9碼的數字");
//				errorMsgsMap.put("memberPassportNo", "護照號碼: 請輸入9碼的數字");
//			}
			
//			String memberIdNo = req.getParameter("memberIdNo");
//			String memberIdNoReg = "^[A-Z]{1}[1-2]{1}[0-9]{8}$";
//			if (memberIdNo == null || memberIdNo.trim().length() == 0) {
//				errorMsgs.add("身分證字號: 請勿空白");
//				errorMsgsMap.put("memberIdNo", "護照號碼: 請勿空白");
//			} else if (!memberIdNo.trim().matches(memberIdNoReg)) { // 以下練習正則(規)表示式(regular-expression)
//				errorMsgs.add("身分證字號: 請以英文大寫開頭並接上9碼數字");
//				errorMsgsMap.put("memberIdNo", "身分證字號: 請以英文大寫開頭並接上9碼數字");
//			}
			
//			String memberPhoneNumber = req.getParameter("memberPhoneNumber");
//			String memberPhoneNumberReg = "^[0-9]{10}$";
//			if (memberPhoneNumber == null || memberPhoneNumber.trim().length() == 0) {
//				errorMsgs.add("手機號碼:請勿空白");
//				errorMsgsMap.put("empCellphoneNo", "手機號碼:請勿空白");
//			} else if (!memberPhoneNumber.trim().matches(memberPhoneNumberReg)) {
//				errorMsgs.add("手機號碼:請輸入10碼的數字 ");
//				errorMsgsMap.put("memberPhoneNumber", "手機號碼:請輸入10碼的數字 ");
//			}
			
//			String gender = req.getParameter("gender");
//			if (gender == null || gender.trim().length() == 0) {
//				errorMsgs.add("是個人都會有性別");
//				errorMsgsMap.put("gender", "人都會有性別!");
//			}
			
			String memberAddress = req.getParameter("memberAddress");
			if (memberAddress == null || memberAddress.trim().length() == 0) {
				errorMsgs.add("地址:請勿空白");
				errorMsgsMap.put("memberAddress", "地址:請勿空白");
			}
			
//			String memberEmail = req.getParameter("memberEmail");
//			String memberEmailReg = "^([a-zA-Z0-9_\\-.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
//
//			if (memberEmail == null || memberEmail.trim().length() == 0) {
//				errorMsgs.add("Email: 請勿空白");
//				errorMsgsMap.put("memberEmail", "Email: 請勿空白");
//			} else if (!memberEmail.trim().matches(memberEmailReg)) {
//				errorMsgs.add("Email: 格式輸入錯誤");
//				errorMsgsMap.put("memberEmail", "Email: 格式輸入錯誤");
//			}
//			if (memberSvc.isExistEmail(memberEmail)) {
//				errorMsgsMap.put("memberEmail", "帳號已存在");
//			}	

			
			LocalDateTime lastUpdateDate = LocalDateTime.now();
			
			MemberVO memberVO = new MemberVO();
			memberVO.setMemberId(memberId);
			memberVO.setMemberPictureId(memberPictureId);
			memberVO.setChineseName(chineseName);
//			memberVO.setMemberBirthday(memberBirthday);
			memberVO.setMemberEnglishFirstName(memberEnglishFirstName);
			memberVO.setMemberEnglishLastName(memberEnglishLastName);
//			memberVO.setMemberPassportNo(memberPassportNo);
//			memberVO.setMemberIdNo(memberIdNo);
//			memberVO.setMemberPhoneNumber(memberPhoneNumber);
			memberVO.setMemberAddress(memberAddress);
			memberVO.setLastUpdateDate(lastUpdateDate);
			
//			System.out.println(memberId);
//			System.out.println(chineseName);
//			System.out.println(memberEnglishFirstName);
//			System.out.println(memberVO.toString());
			
	// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty() || !errorMsgsMap.isEmpty()) {
				req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的empVO物件,也存入req
System.out.println("err");
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/Member/Member_InfoAlter.jsp");
				failureView.forward(req, resp);
				return;
			}                                                           

	/*************************** 2.開始修改資料 ***************************************/
			memberVO = memberSvc.updateMember(memberVO);
			MemberVO memberVO2 = memberSvc.getOneMember(memberId);
//			MemberVO memberVO2=new MemberDAOImpl().findByPrimaryKey(memberId);
			req.getSession().setAttribute("loginMember", memberVO2);
	/*************************** 3.完成,準備轉交(Send the Success view) ***********/	
			req.setAttribute("memberVO", memberVO); // 資料庫update成功後,正確的的empVO物件,存入req
			RequestDispatcher successView = req.getRequestDispatcher("/front-end/Member/Member_Info.jsp");
			successView.forward(req, resp);
			}	
		
//新增
			if ("MemberAdd".equals(action)) {
			String url = req.getContextPath() + "/MemberRegister.jsp";
			List<String> errorMsgs = new LinkedList<String>();
			Map<String, String> errorMsgsMap = new LinkedHashMap<>();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("errorMsgsMap", errorMsgsMap);
			
			MemberServiceImpl memberSvc = new MemberServiceImpl();
					
			Part fileMemberPictureId = req.getPart("memberPictureId"); // Retrieves <input type="file" name="empPictureId">
			byte[] memberPictureId = fileMemberPictureId.getInputStream().readAllBytes();

			
			
			String chineseName = req.getParameter("chineseName");
			String chineseNameReg = "^[(\u4e00-\u9fa5)]{2,10}$";
			if (chineseName == null || chineseName.trim().length() == 0) {
				errorMsgs.add("中文姓名: 請勿空白");
				errorMsgsMap.put("chineseName", "中文姓名: 請勿空白");
			} else if (!chineseName.trim().matches(chineseNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("中文姓名: 限輸入中文");
				errorMsgsMap.put("chineseName", "中文姓名: 限輸入中文");
			}
			
			LocalDate memberBirthday = null;
			try {
				memberBirthday = java.sql.Date.valueOf(req.getParameter("memberBirthday").trim()).toLocalDate();
			} catch (IllegalArgumentException e) {
				memberBirthday = new java.sql.Date(System.currentTimeMillis()).toLocalDate();
				errorMsgs.add("請輸入生日日期!");
				errorMsgsMap.put("memberBirthday", "請輸入生日日期!");
			}
			
			String memberEnglishFirstName = req.getParameter("memberEnglishFirstName");
			String memberEnglishFirstNameReg = "[A-Za-z]{1,50}";
			if (memberEnglishFirstName == null || memberEnglishFirstName.trim().length() == 0) {
				errorMsgs.add("英文姓名: 請勿空白");
				errorMsgsMap.put("memberEnglishFirstName", "英文姓名: 請勿空白");
			} else if (!memberEnglishFirstName.trim().matches(memberEnglishFirstNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("英文姓名: 限輸入英文字母");
				errorMsgsMap.put("memberEnglishFirstName", "英文姓名: 限輸入英文字母");
			}

			String memberEnglishLastName = req.getParameter("memberEnglishLastName");
			String memberEnglishLastNameReg = "[A-Za-z]{1,50}";
			if (memberEnglishLastName == null || memberEnglishLastName.trim().length() == 0) {
				errorMsgs.add("英文姓氏: 請勿空白");
				errorMsgsMap.put("memberEnglishLastName", "英文姓氏: 請勿空白");
			} else if (!memberEnglishLastName.trim().matches(memberEnglishLastNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("英文姓氏: 限輸入英文字母");
				errorMsgsMap.put("memberEnglishLastName", "英文姓氏: 限輸入英文字母");
			}

			
			String memberPassportNo = req.getParameter("memberPassportNo");
			String memberPassportNoReg = "^[0-9]{9}$";
			if (memberPassportNo == null || memberPassportNo.trim().length() == 0) {
				errorMsgs.add("護照號碼: 請勿空白");
				errorMsgsMap.put("memberPassportNo", "護照號碼: 請勿空白");
			} else if (!memberPassportNo.trim().matches(memberPassportNoReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("護照號碼: 請輸入9碼的數字");
				errorMsgsMap.put("memberPassportNo", "護照號碼: 請輸入9碼的數字");
			}
			
			String memberIdNo = req.getParameter("memberIdNo");
			String memberIdNoReg = "^[A-Z]{1}[1-2]{1}[0-9]{8}$";
			if (memberIdNo == null || memberIdNo.trim().length() == 0) {
				errorMsgs.add("身分證字號: 請勿空白");
				errorMsgsMap.put("memberIdNo", "護照號碼: 請勿空白");
			} else if (!memberIdNo.trim().matches(memberIdNoReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("身分證字號: 請以英文大寫開頭並接上9碼數字");
				errorMsgsMap.put("memberIdNo", "身分證字號: 請以英文大寫開頭並接上9碼數字");
			}
			
			String memberPhoneNumber = req.getParameter("memberPhoneNumber");
			String memberPhoneNumberReg = "^[0-9]{10}$";
			if (memberPhoneNumber == null || memberPhoneNumber.trim().length() == 0) {
				errorMsgs.add("手機號碼:請勿空白");
				errorMsgsMap.put("empCellphoneNo", "手機號碼:請勿空白");
			} else if (!memberPhoneNumber.trim().matches(memberPhoneNumberReg)) {
				errorMsgs.add("手機號碼:請輸入10碼的數字 ");
				errorMsgsMap.put("memberPhoneNumber", "手機號碼:請輸入10碼的數字 ");
			}
			
			String gender = req.getParameter("gender");
			if (gender == null || gender.trim().length() == 0) {
				errorMsgs.add("是個人都會有性別");
				errorMsgsMap.put("gender", "人都會有性別!");
			}
			
			String memberAddress = req.getParameter("memberAddress");
			if (memberAddress == null || memberAddress.trim().length() == 0) {
				errorMsgs.add("地址:請勿空白");
				errorMsgsMap.put("memberAddress", "地址:請勿空白");
			}
			
			String memberEmail = req.getParameter("memberEmail");
			String memberEmailReg = "^([a-zA-Z0-9_\\-.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";

			if (memberEmail == null || memberEmail.trim().length() == 0) {
				errorMsgs.add("Email: 請勿空白");
				errorMsgsMap.put("memberEmail", "Email: 請勿空白");
			} else if (!memberEmail.trim().matches(memberEmailReg)) {
				errorMsgs.add("Email: 格式輸入錯誤");
				errorMsgsMap.put("memberEmail", "Email: 格式輸入錯誤");
			}
			if (memberSvc.isExistEmail(memberEmail)) {
				errorMsgsMap.put("memberEmail", "帳號已存在");
			}	
//			try {
//				if (memberSvc.isExistEmail(memberEmail)) {
//					errorMsgsMap.put("memberEmail", "帳號已存在1");
//				}
//			} catch (Exception e) {
//				errorMsgsMap.put("memberEmail", "帳號已存在2");
//			}
			
			String memberPassword = req.getParameter("memberPassword");
			if (memberPassword == null || memberPassword.trim().length() == 0) {
				errorMsgs.add("密碼:請勿空白");
				errorMsgsMap.put("memberPassword", "密碼:請勿空白");
			}
			
			String memberPasswordRp = req.getParameter("memberPasswordRp");
			if (memberPasswordRp == null || memberPasswordRp.trim().length() == 0) {
				errorMsgs.add("確認密碼:請勿空白");
				errorMsgsMap.put("memberPasswordRp", "確認密碼:請勿空白");
			}		

			if (!memberPassword.equals(memberPasswordRp)) {
				errorMsgsMap.put("PwErr", "密碼不相同");
			}

			MemberVO memberVO = new MemberVO();
			memberVO.setMemberPictureId(memberPictureId);
			memberVO.setChineseName(chineseName);
			memberVO.setMemberBirthday(memberBirthday);
			memberVO.setMemberEnglishFirstName(memberEnglishFirstName);
			memberVO.setMemberEnglishLastName(memberEnglishLastName);
			memberVO.setMemberPassportNo(memberPassportNo);
			memberVO.setMemberIdNo(memberIdNo);
			memberVO.setMemberPhoneNumber(memberPhoneNumber);
			memberVO.setGender(gender);
			memberVO.setMemberAddress(memberAddress);
			memberVO.setMemberEmail(memberEmail);
			memberVO.setMemberPassword(memberPassword);

	// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty() || !errorMsgsMap.isEmpty()) {

				req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的empVO物件,也存入req

				RequestDispatcher failureView = req.getRequestDispatcher("<%=request.getContextPath()%>/front-end/Member/MemberRegister.jsp");
				failureView.forward(req, resp);
				return;
			}

	/*************************** 2.開始新增資料 ***************************************/
			
			
			memberSvc.addMember(memberVO);
	/*************************** 3.完成,準備轉交(Send the Success view) ***********/		
			RequestDispatcher successView = req.getRequestDispatcher("<%=request.getContextPath()%>/front-end/Member/MemberLogin.jsp");
			successView.forward(req, resp);
			}		
	}

}

	
