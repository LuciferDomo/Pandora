package web.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.member.bean.MemberVO;
import web.member.service.MemberService;
import web.member.service.impl.MemberServiceImpl;

@WebServlet("/MemberPasswordChange")
public class MembersPwChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		MemberService memberService = new MemberServiceImpl();
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=utf-8");
		Integer memberId = Integer.parseInt(req.getParameter("memberId"));
		String password = req.getParameter("password"); // 現在(使用者輸入的)密碼
		String newPassword = req.getParameter("NewPassword");// 新的密碼(確認密碼)
		String newPasswordRp = req.getParameter("NewPasswordRp");
		String destUrl = "";

		if (!"password".equals(null) && !"newPassword".equals(null) && !"newPasswordRp".equals(null)) {//判斷三個值是否都有填
			MemberVO selectMemberVO = new MemberVO();
			selectMemberVO.setMemberId(memberId);
			selectMemberVO.setMemberPassword(password);
			MemberVO memberBean = memberService.selectMemberIDPW(selectMemberVO);//查詢ID 密碼是否匹配
			System.out.println(memberBean);
			if (memberBean != null) {
				if (newPassword.equals(newPasswordRp)) {
					MemberVO memberVO = memberService.updateMemberPW(memberId, newPasswordRp);
					req.setAttribute("memberVO", memberVO);
					req.setAttribute("MemberPWupdateMsg", "密碼修改成功!!");
					destUrl = "/front-end/Member/MemberHomePage.jsp";
				} else {
					req.setAttribute("warningMemberPWDismatchMsg", "兩次密碼輸入不一致，請重新填寫，謝謝!!");
					destUrl = "/front-end/Member/MemberPasswordChange.jsp";
				}
			} else {
				req.setAttribute("memberPWErrMsg", "密碼輸入錯誤!!請再重新輸入謝謝");
				destUrl = "/front-end/Member/MemberPasswordChange.jsp";
			}
		} else {
			req.setAttribute("warningMemberPWMsg", "不好意思!尚有必填欄位未填，請確實填寫，謝謝!!");
			destUrl = "front-end/Member/MemberPasswordChange.jsp";
		}
		req.getRequestDispatcher(destUrl).forward(req, res);
	}
}
