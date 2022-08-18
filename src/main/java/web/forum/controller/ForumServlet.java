package web.forum.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
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
import javax.servlet.http.Part;

import web.forum.bean.CommentVO;
import web.forum.bean.ForumVO;
import web.forum.service.impl.CommentServiceImpl;
import web.forum.service.impl.ForumServiceImpl;


/**
 * Servlet implementation class ForumServlet
 */
@WebServlet("/ForumServlet")
@MultipartConfig
public class ForumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		if("cancel_report".equals(action)) {
			// update
			Integer postId = Integer.valueOf(request.getParameter("postID"));
			ForumServiceImpl forumSvc = new ForumServiceImpl();
			ForumVO forumVO = forumSvc.getOneForum(postId);
			forumVO.setStatus(0);
			forumSvc.updateForum(forumVO);
			request.getRequestDispatcher("/forumReason.jsp").forward(request, response);
			return;
		}
		
		if("cancel_report2".equals(action)) {
			// updatecommentNo
			Integer commentNo = Integer.valueOf(request.getParameter("postID"));
			CommentServiceImpl comSvc = new CommentServiceImpl();
			CommentVO commentVO = comSvc.getOneComment(commentNo);
			commentVO.setStatus(0);
			System.out.println(commentVO.toString());
			comSvc.updateComment(commentVO);
			request.getRequestDispatcher("/forumReason.jsp").forward(request, response);
			return;
		}
		
		if("forum_report".equals(action)) {
			// update
			Integer postId = Integer.valueOf(request.getParameter("postId"));
			String reason=request.getParameter("content");
			ForumServiceImpl forumSvc = new ForumServiceImpl();
			forumSvc.updateForumReport(postId, reason);
			request.getRequestDispatcher("/front-end/forum/forumAllList.jsp").forward(request, response);
			return;
		}
		if("reportForumBefore".equals(action)) {
			// update
			Integer postId = Integer.valueOf(request.getParameter("postID"));
			ForumServiceImpl forumSvc = new ForumServiceImpl();
			ForumVO forumVO = forumSvc.getOneForum(postId);
			request.setAttribute("forumVO", forumVO);
			String url = "/pandora/front-end/forum/forumReport.jsp";
			request.getRequestDispatcher("/front-end/forum/forumReport.jsp").forward(request, response);
			return;
		}
		if("comment_report".equals(action)) {
			// updatecommentNo
			Integer commentNo = Integer.valueOf(request.getParameter("postID"));
			CommentServiceImpl comSvc = new CommentServiceImpl();
			CommentVO commentVO = comSvc.getOneComment(commentNo);
			commentVO.setStatus(1);
			System.out.println(commentVO.toString());
			comSvc.updateComment(commentVO);
			request.getRequestDispatcher("/forumAllList.jsp").forward(request, response);
			return;
		}
		
		
		//抽出單一主題的資料
				if ("getOne_For_Update_Forum".equals(action)) { // 來自forumAllList.jsp的請求

					List<String> errorMsgs = new LinkedList<String>();
					// Store this set in the request scope, in case we need to
					// send the ErrorPage view.
					request.setAttribute("errorMsgs", errorMsgs);
					
						/***************************1.接收請求參數****************************************/
						Integer postId = Integer.valueOf(request.getParameter("postID"));
						
						/***************************2.開始查詢資料****************************************/
						ForumServiceImpl forumSvc = new ForumServiceImpl();
						//抽出單艘船的資料
						ForumVO forumVO = forumSvc.getOneForum(postId);
						/***************************3.查詢完成,準備轉交(Send the Success view)************/
						request.setAttribute("forumVO", forumVO);         // 資料庫取出的forumVO物件,存入req
						String url = "/front-end/forum/forumUpdateFront.jsp";
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
						
		Integer memberId = Integer.valueOf(request.getParameter("memberId").trim());
				
				
						
		String postTitle = request.getParameter("postTitle").trim();
						if (postTitle == null || postTitle.trim().length() == 0) {
							errorMsgs.add("標題請勿空白");
						}	
						
		String postContent = request.getParameter("postContent").trim();
						if (postContent == null || postContent.trim().length() == 0) {
							errorMsgs.add("內容請勿空白");
						}
						
		LocalDateTime postTime = LocalDateTime.now();
						
		
		Integer clicks = Integer.valueOf(request.getParameter("clicks").trim());
		
		
						
					
		Integer status = 0;
		
		Part filePostPic = request.getPart("postPic"); // Retrieves <input type="file" name="empPictureId">
		byte[] postPic = filePostPic.getInputStream().readAllBytes();

						ForumVO forumVO = new ForumVO();
						forumVO.setMemberId(memberId);
						forumVO.setPostTitle(postTitle);
						forumVO.setPostContent(postContent);
						forumVO.setPostTime(postTime);
						forumVO.setClicks(clicks);
						forumVO.setStatus(status);
						forumVO.setPostPic(postPic);
						forumVO.setPostId(postId);

						System.out.println(forumVO.toString());
						// Send the use back to the form, if there were errors
						if (!errorMsgs.isEmpty()) {
							request.setAttribute("forumVO", forumVO); // 含有輸入格式錯誤的empVO物件,也存入req
							RequestDispatcher failureView = request
									.getRequestDispatcher("/forumUpdateFront.jsp");
							failureView.forward(request, response);
							return; //程式中斷
						}
						
						/***************************2.開始修改資料*****************************************/
						ForumServiceImpl forumSvc = new ForumServiceImpl();
						forumVO = forumSvc.updateForum(memberId, postTitle, postContent, postTime, clicks, status, postPic, postId);
						
						/***************************3.修改完成,準備轉交(Send the Success view)*************/
//						/Pandora/src/main/webapp/front-end/forum/forumAll.jsp
						request.setAttribute("forumVO", forumVO); // 資料庫update成功後,正確的的empVO物件,存入req
						String url = "/front-end/forum/forumAll.jsp";
						RequestDispatcher successView = request.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
						successView.forward(request, response);
				}
		
				if ("getOne_For_Display".equals(action)) { // 來自blog_category-big2.jsp的請求

					List<String> errorMsgs = new LinkedList<String>();
					// Store this set in the request scope, in case we need to
					// send the ErrorPage view.
					request.setAttribute("errorMsgs", errorMsgs);
					
					try {
						/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
						
						Integer postId = Integer.parseInt(request.getParameter("postId"));

						Integer repostID = postId;
						
						
						/***************************2.開始查詢資料*****************************************/
						ForumServiceImpl forumSvc = new ForumServiceImpl();
						Map<String, Object> dataMap = forumSvc.findByPrimaryKey(postId);
						
//						MemBlogArtService mbaSvc = new MemBlogArtService();
//						MemBlogArtVO memBlogArtVO = mbaSvc.findByPrimaryKey(artid); 改成上兩行
						
//						MemReplyService mrSvc = new MemReplyService();
//						List<MemReplyVO> memReplyVO = mrSvc.getAllByArtId(reArtId); 還沒改出來
						
						
						if (dataMap.size() == 0) {
							errorMsgs.add("查無資料");
						}
						
						
//						if (memReplyVO == null) {
//							errorMsgs.add("查無資料");    原始有紅字先關掉
//						}
						
						
						// Send the use back to the form, if there were errors
						if (!errorMsgs.isEmpty()) {
							RequestDispatcher failureView = request
									.getRequestDispatcher("/front-end/forum/fullPost.jsp");
							failureView.forward(request, response);
							return;//程式中斷
						}
						
						/***************************3.查詢完成,準備轉交(Send the Success view)*************/
						request.setAttribute("dataMap", dataMap); // 資料庫取出的empVO物件,存入req
						String url = "/front-end/forum/fullPost.jsp";
//						String url = "/front-end/forum/_test.jsp";
						RequestDispatcher successView = request.getRequestDispatcher(url); // 成功轉交 blog-post-fullwidth2.jsp
						successView.forward(request, response);

						/***************************其他可能的錯誤處理*************************************/
					} catch (Exception e) {
						errorMsgs.add("無法取得資料:" + e.getMessage());
						RequestDispatcher failureView = request
								.getRequestDispatcher("/front-end/forum/forumAllList.jsp");
						failureView.forward(request, response);
					}
				}		
			
				if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
					
					List<String> errorMsgs = new LinkedList<String>();
					// Store this set in the request scope, in case we need to
					// send the ErrorPage view.
					request.setAttribute("errorMsgs", errorMsgs);

						/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					
					Integer memberId = Integer.valueOf(request.getParameter("memberId").trim());
							
							
									
					String postTitle = request.getParameter("title").trim();
									if (postTitle == null || postTitle.trim().length() == 0) {
										errorMsgs.add("標題請勿空白");
									}	
									
					String postContent = request.getParameter("content").trim();
									if (postContent == null || postContent.trim().length() == 0) {
										errorMsgs.add("內容請勿空白");
									}
									
					LocalDateTime postTime = LocalDateTime.now();
									
					
					Integer clicks = 0;
					
					
									
								
					Integer status = 0;
					
					Part filePostPic = request.getPart("file"); // Retrieves <input type="file" name="empPictureId">
					byte[] postPic = filePostPic.getInputStream().readAllBytes();

									ForumVO forumVO = new ForumVO();
									forumVO.setMemberId(memberId);
									forumVO.setPostTitle(postTitle);
									forumVO.setPostContent(postContent);
									forumVO.setPostTime(postTime);
									forumVO.setClicks(clicks);
									forumVO.setStatus(status);
									forumVO.setPostPic(postPic);

									System.out.println(forumVO.toString());
									// Send the use back to the form, if there were errors
									if (!errorMsgs.isEmpty()) {
										request.setAttribute("forumVO", forumVO); // 含有輸入格式錯誤的empVO物件,也存入req
										RequestDispatcher failureView = request
												.getRequestDispatcher("/forumUpdateFront.jsp");
										failureView.forward(request, response);
										return; //程式中斷
						}
						
						/***************************2.開始新增資料***************************************/
									ForumServiceImpl forumSvc = new ForumServiceImpl();
									forumVO = forumSvc.addForum(clicks, memberId, postTitle, postContent, postTime, clicks, status, postPic);
						
						/***************************3.新增完成,準備轉交(Send the Success view)***********/
						String url = "/front-end/forum/forumAllList.jsp";
						RequestDispatcher successView = request.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
						successView.forward(request, response);				
				}
				
				if ("delete".equals(action)) { // 來自listAllEmp.jsp

					List<String> errorMsgs = new LinkedList<String>();
					// Store this set in the request scope, in case we need to
					// send the ErrorPage view.
					request.setAttribute("errorMsgs", errorMsgs);
			
						/***************************1.接收請求參數***************************************/
						Integer postId = Integer.valueOf(request.getParameter("postID"));
						
						/***************************2.開始刪除資料***************************************/
						ForumServiceImpl forumSvc = new ForumServiceImpl();
						forumSvc.deleteForum(postId);
						
						/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
						String url = "/forumReason.jsp";
						RequestDispatcher successView = request.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
						successView.forward(request, response);
				}
				if ("deleteComment".equals(action)) { // 來自listAllEmp.jsp

					List<String> errorMsgs = new LinkedList<String>();
					// Store this set in the request scope, in case we need to
					// send the ErrorPage view.
					request.setAttribute("errorMsgs", errorMsgs);
			
						/***************************1.接收請求參數***************************************/
						Integer commentNo = Integer.valueOf(request.getParameter("commentNo"));
						
						/***************************2.開始刪除資料***************************************/
						CommentServiceImpl forumSvc = new CommentServiceImpl();
						forumSvc.deleteComment(commentNo);
						
						/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
						String url = "/forumReason.jsp";
						RequestDispatcher successView = request.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
						successView.forward(request, response);
				}
				
if ("insert2".equals(action)) { // 來自addEmp.jsp的請求  
					
					List<String> errorMsgs = new LinkedList<String>();
					// Store this set in the request scope, in case we need to
					// send the ErrorPage view.
					request.setAttribute("errorMsgs", errorMsgs);

						/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					
					Integer postId = Integer.valueOf(request.getParameter("postId").trim());
					
					Integer memberId = Integer.valueOf(request.getParameter("memberId").trim());
							
							
									
					String commentContent = request.getParameter("content").trim();
									if (commentContent == null || commentContent.trim().length() == 0) {
										errorMsgs.add("內容請勿空白");
									}	
									
					
									
					LocalDateTime commentTime = LocalDateTime.now();
									
					
					
					
					
									
								
					Integer status = 0;

					CommentVO commentVO = new CommentVO();
					commentVO.setPostId(postId);
					commentVO.setMemberId(memberId);
					commentVO.setCommentContent(commentContent);
					commentVO.setCommentTime(commentTime);
					commentVO.setStatus(status);
					

									System.out.println(commentVO.toString());
									// Send the use back to the form, if there were errors
									if (!errorMsgs.isEmpty()) {
										request.setAttribute("commentVO", commentVO); // 含有輸入格式錯誤的empVO物件,也存入req
										RequestDispatcher failureView = request
												.getRequestDispatcher("/forumUpdateFront.jsp");
										failureView.forward(request, response);
										return; //程式中斷
						}
						
						/***************************2.開始新增資料***************************************/
									CommentServiceImpl comSvc = new CommentServiceImpl();
									commentVO = comSvc.addComment(status, postId, memberId, commentContent, commentTime, status);
						
						/***************************3.新增完成,準備轉交(Send the Success view)***********/
						String url = "/front-end/forum/forumAllList.jsp";
						RequestDispatcher successView = request.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
						successView.forward(request, response);				
				}	
				
	}

	
}
