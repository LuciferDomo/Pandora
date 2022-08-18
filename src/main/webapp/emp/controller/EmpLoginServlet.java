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

@WebServlet("/EmpLoginServlet")
@MultipartConfig
public class EmpLoginServlet extends HttpServlet {
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

		if ("EMPSignOut".equals(action)) {
			String url = req.getContextPath() + "/back-end/emp/EMP_login.jsp";
			req.getSession().invalidate();
			resp.sendRedirect(url);

		}

		if ("EMPAllList".equals(action)) {

			EmpService empSerive = new EmpServiceImpl();
			List<EmpVO> empAllList = empSerive.getAll();
			req.setAttribute("empAllList", empAllList);
			RequestDispatcher successView = req.getRequestDispatcher("back-end/emp/EMP_InfoAll.jsp");
			successView.forward(req, resp);
			return;
		}
		if ("LoginUserForUpdate".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println(req.getParameter("loginUser"));
			Integer employeeId = Integer.valueOf(req.getParameter("loginUser"));
			EmpServiceImpl empService = new EmpServiceImpl();
			EmpVO empVOupdate = empService.getOneEmp(employeeId);
			req.setAttribute("empVOupdate", empVOupdate);

			String url = "/EMP_GetOneEdiotrByManger.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
			successView.forward(req, resp);
		}


		if ("EMPGetOneForUpdate".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			Integer employeeId = Integer.valueOf(req.getParameter("employeeId"));
			EmpServiceImpl empService = new EmpServiceImpl();
			EmpVO empVOupdate = empService.getOneEmp(employeeId);
			req.setAttribute("empVOupdate", empVOupdate);

			String url = "back-end/emp/EMP_GetOneEdiotrByManger.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
			successView.forward(req, resp);
		}

		if ("EMPUpdate".equals(action)) {
			resp.setContentType("image/jpeg");
			List<String> errorMsgs = new LinkedList<String>();
			Map<String, String> errorMsgsMap = new LinkedHashMap<>();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("errorMsgsMap", errorMsgsMap);
			EmpServiceImpl empSvc = new EmpServiceImpl();

			System.out.println("這是" + req.getParameter("employeeId"));
			System.out.println("這是" + req.getParameter("englishFirstName"));

			Integer employeeId = Integer.valueOf(req.getParameter("employeeId"));

			Part fileEmpPictureId = req.getPart("empPictureId"); // Retrieves <input type="file" name="empPictureId">
			byte[] empPictureId = fileEmpPictureId.getInputStream().readAllBytes();

			String englishFirstName = req.getParameter("englishFirstName");
			String englishFirstNameReg = "[A-Za-z]{1,50}";
			if (englishFirstName == null || englishFirstName.trim().length() == 0) {
				errorMsgs.add("英文姓名: 請勿空白");
				errorMsgsMap.put("englishFirstName", "英文姓名: 請勿空白");
			} else if (!englishFirstName.trim().matches(englishFirstNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("英文姓名: 只能是英文字母");
				errorMsgsMap.put("englishFirstName", "英文姓名: 只能是英文字母");
			}

			String englishLastName = req.getParameter("englishLastName");
			String englishLastNameReg = "[A-Za-z]{1,50}";
			if (englishLastName == null || englishLastName.trim().length() == 0) {
				errorMsgs.add("英文姓氏: 請勿空白");
				errorMsgsMap.put("englishLastName", "英文姓氏: 請勿空白");
			} else if (!englishLastName.trim().matches(englishLastNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("英文姓氏: 只能是英文字母");
				errorMsgsMap.put("englishLastName", "英文姓氏: 只能是英文字母");
			}

			String jobLevels = req.getParameter("jobLevels");
			if (jobLevels == null || jobLevels.trim().length() == 0) {
				errorMsgs.add("職位請勿空白");
				errorMsgsMap.put("jobLevels", "職位請勿空白");
			} else {
				jobLevels = req.getParameter("jobLevels");
			}

			LocalDate empBirthday = null;
			try {
				empBirthday = java.sql.Date.valueOf(req.getParameter("empBirthday").trim()).toLocalDate();
			} catch (IllegalArgumentException e) {
				empBirthday = new java.sql.Date(System.currentTimeMillis()).toLocalDate();
				errorMsgs.add("請輸入生日日期!");
				errorMsgsMap.put("empBirthday", "請輸入生日日期!");
			}

			String gender = req.getParameter("gender");
			if (gender == null || gender.trim().length() == 0) {
				errorMsgs.add("是個人都會有性別");
				errorMsgsMap.put("gender", "人都會有性別!");
			}

			String passportNo = req.getParameter("passportNo");
			String passportNoReg = "^[0-9]{9}$";
			if (passportNo == null || passportNo.trim().length() == 0) {
				errorMsgs.add("護照號碼: 請勿空白");
				errorMsgsMap.put("passportNo", "護照號碼: 請勿空白");
			} else if (!passportNo.trim().matches(passportNoReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("護照號碼: 請輸入9碼的數字");
				errorMsgsMap.put("passportNo", "護照號碼: 請輸入9碼的數字");
			}

			String email = req.getParameter("email");
			String emailReg = "^([a-zA-Z0-9_\\-.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";

			if (email == null || email.trim().length() == 0) {
				errorMsgs.add("Email: 請勿空白");
				errorMsgsMap.put("email", "Email: 請勿空白");
			} else if (!email.trim().matches(emailReg)) {
				errorMsgs.add("Email: 格式輸入錯誤");
				errorMsgsMap.put("email", "Email: 格式輸入錯誤");
			}
//			try {
//				if (empSvc.isExistEmail(email)) {
//					errorMsgsMap.put("email", "帳號已存在");
//				}
//			} catch (Exception e) {
//				errorMsgsMap.put("email", "帳號已存在");
//			}

			LocalDate startDate = null;
			String startDateString = req.getParameter("startDate");
			if (startDateString == null || startDateString.trim().length() == 0) {
				errorMsgs.add("雇用日期請勿空白");
				errorMsgsMap.put("startDate", "雇用日期請勿空白");
			} else {
				startDate = LocalDate.parse(req.getParameter("startDate"));
			}

			String status;
			LocalDate resignationDate=null;
			if (req.getParameter("resignationDate") == null || req.getParameter("resignationDate").trim().length() == 0) {
				resignationDate = null;
				status = "1";
			} else {
				resignationDate = LocalDate.parse(req.getParameter("resignationDate"));
				status = "0";
			}
			
		
	
			String empAddress = req.getParameter("empAddress");
			if (empAddress == null || empAddress.trim().length() == 0) {
				errorMsgs.add("地址:請勿空白");
			}
			String password = "a1234";

			String empCellphoneNo = req.getParameter("empCellphoneNo");
			String empCellphoneNoReg = "^[0-9]{10}$";
			if (empCellphoneNo == null || empCellphoneNo.trim().length() == 0) {
				errorMsgs.add("地址:請勿空白");
			} else if (!empCellphoneNo.trim().matches(empCellphoneNoReg)) {
				errorMsgs.add("手機號碼:請輸入10碼的數字 ");
			}
			LocalDateTime lastModificationDate = LocalDateTime.now();
			LocalDateTime loginTime = null;

			EmpServiceImpl empService = new EmpServiceImpl();
			EmpVO empVO = empService.getOneEmp(employeeId);

			empVO.setEmpPictureId(empPictureId);
			empVO.setEnglishLastName(englishLastName);
			empVO.setEnglishFirstName(englishFirstName);
			empVO.setJobLevels(jobLevels);
			empVO.setGender(gender);
			empVO.setEmpBirthday(empBirthday);
			empVO.setPassportNo(passportNo);
			empVO.setEmail(email);
			empVO.setResignationDate(resignationDate);
			empVO.setPassword(password);
			empVO.setEmpCellphoneNo(empCellphoneNo);
			empVO.setEmpAddress(empAddress);
			empVO.setStatus(status);
			empVO.setLastModificationDate(lastModificationDate);
			empVO.setLoginTime(loginTime);
//			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()|| !errorMsgsMap.isEmpty()) {
				req.setAttribute("empVOupdate", empVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("back-end/emp/EMP_GetOneEdiotrByManger.jsp");
				failureView.forward(req, resp);
				return;
			}

			empVO = empService.updateEmp(empVO);
			req.setAttribute("empAllList", empService.getAll());
			String url = "back-end/emp/EMP_InfoAll.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 編輯成功重載 EMP_GetOneEdiotrByManger.jsp
			successView.forward(req, resp);

		}

		if ("EMPAdd".equals(action)) {
			String url = req.getContextPath() + "back-end/emp/EMP_Register.jsp";
			List<String> errorMsgs = new LinkedList<String>();
			Map<String, String> errorMsgsMap = new LinkedHashMap<>();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("errorMsgsMap", errorMsgsMap);
			EmpServiceImpl empSvc = new EmpServiceImpl();
			
			Part fileEmpPictureId = req.getPart("empPictureId"); // Retrieves <input type="file" name="empPictureId">
			byte[] empPictureId = fileEmpPictureId.getInputStream().readAllBytes();

			String englishFirstName = req.getParameter("englishFirstName");
			String englishFirstNameReg = "[A-Za-z]{1,50}";
			if (englishFirstName == null || englishFirstName.trim().length() == 0) {
				errorMsgs.add("英文姓名: 請勿空白");
				errorMsgsMap.put("englishFirstName", "英文姓名: 請勿空白");
			} else if (!englishFirstName.trim().matches(englishFirstNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("英文姓名: 只能是英文字母");
				errorMsgsMap.put("englishFirstName", "英文姓名: 只能是英文字母");
			}

			String englishLastName = req.getParameter("englishLastName");
			String englishLastNameReg = "[A-Za-z]{1,50}";
			if (englishLastName == null || englishLastName.trim().length() == 0) {
				errorMsgs.add("英文姓氏: 請勿空白");
				errorMsgsMap.put("englishLastName", "英文姓氏: 請勿空白");
			} else if (!englishLastName.trim().matches(englishLastNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("英文姓氏: 只能是英文字母");
				errorMsgsMap.put("englishLastName", "英文姓氏: 只能是英文字母");
			}

			String jobLevels = req.getParameter("jobLevels");
			if (jobLevels == null || jobLevels.trim().length() == 0) {
				errorMsgs.add("職位請勿空白");
				errorMsgsMap.put("jobLevels", "職位請勿空白");
			} else {
				jobLevels = req.getParameter("jobLevels");
			}

			String gender = req.getParameter("gender");
			if (gender == null || gender.trim().length() == 0) {
				errorMsgs.add("是個人都會有性別");
				errorMsgsMap.put("gender", "人都會有性別!");
			}

//			LocalDate empBirthday = null;
//			if (req.getParameter("empBirthday") != null && req.getParameter("empBirthday").length()!= 0) {
//				empBirthday = LocalDate.parse(req.getParameter("empBirthday"));
//			}else {
//				errorMsgs.add("請輸入日期");
//			}
			LocalDate empBirthday = null;
			try {
				empBirthday = java.sql.Date.valueOf(req.getParameter("empBirthday").trim()).toLocalDate();
			} catch (IllegalArgumentException e) {
				empBirthday = new java.sql.Date(System.currentTimeMillis()).toLocalDate();
				errorMsgs.add("請輸入生日日期!");
				errorMsgsMap.put("empBirthday", "請輸入生日日期!");
			}

			String passportNo = req.getParameter("passportNo");
			String passportNoReg = "^[0-9]{9}$";
			if (passportNo == null || passportNo.trim().length() == 0) {
				errorMsgs.add("護照號碼: 請勿空白");
				errorMsgsMap.put("passportNo", "護照號碼: 請勿空白");
			} else if (!passportNo.trim().matches(passportNoReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("護照號碼: 請輸入9碼的數字");
				errorMsgsMap.put("passportNo", "護照號碼: 請輸入9碼的數字");
			}

			String email = req.getParameter("email");
			String emailReg = "^([a-zA-Z0-9_\\-.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";

			if (email == null || email.trim().length() == 0) {
				errorMsgs.add("Email: 請勿空白");
				errorMsgsMap.put("email", "Email: 請勿空白");
			} else if (!email.trim().matches(emailReg)) {
				errorMsgs.add("Email: 格式輸入錯誤");
				errorMsgsMap.put("email", "Email: 格式輸入錯誤");
			}
			try {
				if (empSvc.isExistEmail(email)) {
					errorMsgsMap.put("email", "帳號已存在");
				}
			} catch (Exception e) {
				errorMsgsMap.put("email", "帳號已存在");
			}

			LocalDate startDate = null;
			String startDateString = req.getParameter("startDate");
			if (startDateString == null || startDateString.trim().length() == 0) {
				errorMsgs.add("雇用日期請勿空白");
				errorMsgsMap.put("startDate", "雇用日期請勿空白");
			} else {
				startDate = LocalDate.parse(req.getParameter("startDate"));
			}

//			LocalDate startDate = null;
//			try {
//				startDate = java.sql.Date.valueOf(req.getParameter("startDate").trim()).toLocalDate();
//			} catch (IllegalArgumentException e) {
//				startDate =new java.sql.Date(System.currentTimeMillis()).toLocalDate();
//				errorMsgs.add("請輸入雇用日期!");
//			}
//			

			String empAddress = req.getParameter("empAddress");
			if (empAddress == null || empAddress.trim().length() == 0) {
				errorMsgs.add("地址:請勿空白");
				errorMsgsMap.put("empAddress", "地址:請勿空白");
			}

			String empCellphoneNo = req.getParameter("empCellphoneNo");
			String empCellphoneNoReg = "^[0-9]{10}$";
			if (empCellphoneNo == null || empCellphoneNo.trim().length() == 0) {
				errorMsgs.add("地址:請勿空白");
				errorMsgsMap.put("empCellphoneNo", "地址:請勿空白");
			} else if (!empCellphoneNo.trim().matches(empCellphoneNoReg)) {
				errorMsgs.add("手機號碼:請輸入10碼的數字 ");
				errorMsgsMap.put("empCellphoneNo", "手機號碼:請輸入10碼的數字 ");
			}

			EmpVO empVO = new EmpVO();
			empVO.setEmpPictureId(empPictureId);
			empVO.setEnglishLastName(englishLastName);
			empVO.setEnglishFirstName(englishFirstName);
			empVO.setJobLevels(jobLevels);
			empVO.setGender(gender);
			empVO.setEmpBirthday(empBirthday);
			empVO.setPassportNo(passportNo);
			empVO.setEmail(email);
			empVO.setStartDate(startDate);
			empVO.setEmpCellphoneNo(empCellphoneNo);
			empVO.setEmpAddress(empAddress);

//			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty() || !errorMsgsMap.isEmpty()) {

				req.setAttribute("empVO", empVO); // 含有輸入格式錯誤的empVO物件,也存入req

				RequestDispatcher failureView = req.getRequestDispatcher("back-end/emp/EMP_Register.jsp");
				failureView.forward(req, resp);
				return;
			}

			/*************************** 2.開始新增資料 ***************************************/

			empVO = empSvc.addEmp(empVO);
			req.setAttribute("empAllList", empSvc.getAll());
			/*************************** 3.完成,準備轉交(Send the Success view) ***********/
			RequestDispatcher successView = req.getRequestDispatcher("back-end/emp/EMP_InfoAll.jsp");
			successView.forward(req, resp);

			return;
		}

	}

}
