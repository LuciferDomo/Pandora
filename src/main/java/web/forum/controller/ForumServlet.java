package web.forum.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.forum.bean.ForumVO;
import web.forum.service.impl.ForumServiceImpl;


/**
 * Servlet implementation class ForumServlet
 */
@WebServlet("/ForumServlet")
public class ForumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		//抽出單一主題的資料
				if ("getOne_For_Update_Forum".equals(action)) { // 來自forumAllList.jsp的請求

					List<String> errorMsgs = new LinkedList<String>();
					// Store this set in the request scope, in case we need to
					// send the ErrorPage view.
					request.setAttribute("errorMsgs", errorMsgs);
					
						/***************************1.接收請求參數****************************************/
						Integer postId = Integer.valueOf(request.getParameter("postID"));
						System.out.println(request.getParameter("postID"));
						
						/***************************2.開始查詢資料****************************************/
						ForumServiceImpl forumSvc = new ForumServiceImpl();
						//抽出單艘船的資料
						ForumVO forumVO = forumSvc.getOneForum(postId);
						System.out.println(forumVO);
										
						/***************************3.查詢完成,準備轉交(Send the Success view)************/
						request.setAttribute("forumVO", forumVO);         // 資料庫取出的forumVO物件,存入req
						String url = "forurmUpdate.jsp";
						RequestDispatcher successView = request.getRequestDispatcher(url);// 成功轉交 forumUpdate.jsp
						successView.forward(request, response);
				}
				
				
        // 更新文章資料
				if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
					
					List<String> errorMsgs = new LinkedList<String>();
					// Store this set in the request scope, in case we need to
					// send the ErrorPage view.
					request.setAttribute("errorMsgs", errorMsgs);
				
						/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
		Integer postId = Integer.valueOf(request.getParameter("postId").trim());
						
		String memberId = request.getParameter("memberId");
						String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
						if (memberId == null || memberId.trim().length() == 0) {
							errorMsgs.add("作者: 請勿空白");
						} else if(!memberId.trim().matches(enameReg)) { //以下練習正則(規)表示式(regular-expression)
							errorMsgs.add("作者: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
			            }
						
		String postTitle = request.getParameter("postTitle").trim();
						if (postTitle == null || postTitle.trim().length() == 0) {
							errorMsgs.add("標題請勿空白");
						}	
						
		String postContent = request.getParameter("postContent").trim();
						if (postContent == null || postContent.trim().length() == 0) {
							errorMsgs.add("內容請勿空白");
						}
						
		String postTime = request.getParameter("postTime").trim();
						if (postTime == null || postTime.trim().length() == 0) {
							errorMsgs.add("時間請勿空白");
						}
						
		String clicks = request.getParameter("clicks").trim();
						if (clicks == null || clicks.trim().length() == 0) {
							errorMsgs.add("次數請勿空白");
						}
					
		String status = request.getParameter("status").trim();
						if (status == null || status.trim().length() == 0) {
							errorMsgs.add("狀態請勿空白");
						}
		

		Integer postId = Integer.valueOf(request.getParameter("postId").trim());

						ForumVO forumVO = new ForumVO();
						ForumVO.setPostId(postId);
						ForumVO.setMemberId(memberId);
						ForumVO.setPostTitle(postTitle);
						ForumVO.setPostContent(postContent);
						ForumVO.setPostTime(postTime);
						ForumVO.setClicks(clicks);
						ForumVO.setStatus(status);

						// Send the use back to the form, if there were errors
						if (!errorMsgs.isEmpty()) {
							request.setAttribute("forumVO", forumVO); // 含有輸入格式錯誤的empVO物件,也存入req
							RequestDispatcher failureView = request
									.getRequestDispatcher("/forumUpdate.jsp");
							failureView.forward(request, response);
							return; //程式中斷
						}
						
						/***************************2.開始修改資料*****************************************/
						ForumServiceImpl forumSvc = new ForumServiceImpl();
						forumVO = forumSvc.updateForum(postId, memberId, postTitle, postContent, postTime, clicks, status);
						
						/***************************3.修改完成,準備轉交(Send the Success view)*************/
						request.setAttribute("forumVO", forumVO); // 資料庫update成功後,正確的的empVO物件,存入req
						String url = "/emp/listOneEmp.jsp";
						RequestDispatcher successView = request.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
						successView.forward(request, response);
				}
		
	}

	
}