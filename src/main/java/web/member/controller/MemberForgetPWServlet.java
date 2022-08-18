package web.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.member.bean.MemberVO;
import web.member.service.ForgetPWMailService;
import web.member.service.impl.MemberServiceImpl;


@WebServlet("/member/MemberForgetPWServlet")
public class MemberForgetPWServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=utf-8");

		String action = req.getParameter("action");
		String email = req.getParameter("memberEmail"); // 使用者輸入的email

		// 修改密碼
		if ("forgetpw".equals(action)) { // MemberForgetPassword.jsp

			// 判斷輸入的email是否真有其memberID跟EMAIL
			MemberServiceImpl memberSvc = new MemberServiceImpl();// 查詢memberID+email方法放在service所以用service
			MemberVO memberBean = memberSvc.selectMemberIDEmail(email);
			System.out.println(memberBean);

//			有從輸入的email get到memberid表示該帳號確實為註冊的會員
			if (memberBean != null) {

					MemberVO memberBean2 = memberSvc.selectMemberIDEmail(email);
					
					// 亂數取一個新密碼(方法詳如下)
					String randompassword = getRandomString(8);
					// 取得這個Email的memberid
					Integer memberId = memberBean2.getMemberId();
					
					System.out.println("新的密碼："+randompassword);
					System.out.println("會員id："+memberId);
					
					// 把亂數產生的新密碼更新至DB
					memberBean2 = memberSvc.updateMemberPW(memberId,randompassword);

					/****************************
					 * 3.寄送新密碼資料給使用者
					 *****************************************/
					String to = email;
					String subject = "【Pandora】密碼通知";
					String ch_name = "親愛的【Pandora】用戶您好";
					String passRandom = randompassword;
					String messageText = "Hello! " + ch_name + "<br/>"+ "<br/>"+"&emsp;&emsp;"+" 請使用此密碼 :【 " + passRandom + "】"
							+ " 登入，提醒您盡快登入後更改個人密碼，謝謝";
					ForgetPWMailService memberMailSvc = new ForgetPWMailService();
									//收件者 、 主旨   、內容
					memberMailSvc.sendMail(to, subject, messageText);

					/*************************** 4.修改完成,準備轉交(Send the Success view) *************/
					req.setAttribute("MemberForgetMsg", "密碼函已發送至您所註冊的E-mail信箱!!");
					req.getRequestDispatcher("/front-end/Member/MemberLogin.jsp").forward(req, res);

					/*************************** 其他可能的錯誤處理 *************************************/
//				} catch (Exception e) {
//					req.setAttribute("failureMembersPWMsg", "修改失敗："+e.getMessage());
//					req.getRequestDispatcher("../nest-frontend/membersForgetPassword.jsp").forward(req, res);
//				}

			} else {
				req.setAttribute("warningMemberNullMsg", "查無此註冊會員之資料，請再確認，謝謝");
				req.getRequestDispatcher("/front-end/Member/ForgetPW.jsp").forward(req, res);

			}

		}
	}
	
	//產生亂數密碼的方法
	static String getRandomString(int i) {
		String theAlphaNumericS;
		StringBuilder builder;

		theAlphaNumericS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "abcdefghijklmnopqrstuvwxyz" + "_!@" + "0123456789";

		// create the StringBuffer
		builder = new StringBuilder(i);

		for (int m = 0; m < i; m++) {

			// generate numeric
			int myindex = (int) (theAlphaNumericS.length() * Math.random());

			// add the characters
			builder.append(theAlphaNumericS.charAt(myindex));
		}

		return builder.toString();
	}
	
	
	

}
