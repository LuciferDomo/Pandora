package web.forum.service.impl;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import web.forum.bean.CommentVO;
import web.forum.bean.ForumVO;
import web.forum.dao.CommentDAO;
import web.forum.dao.ForumDAO;
import web.forum.dao.impl.CommentDAOImpl;
import web.forum.dao.impl.ForumDAOImpl;

public class ForumServiceImpl {
	private ForumDAO forumDAO;
	private CommentDAO commentDAO;

	public ForumServiceImpl() {
		forumDAO = new ForumDAOImpl();
		commentDAO = new CommentDAOImpl();
	}

	public ForumVO addForum(Integer postId, Integer memberId, String postTitle, String postContent,
			LocalDateTime postTime, Integer clicks, Integer status, byte[] postPic) {
		ForumVO forumVO = new ForumVO();
		forumVO.setPostId(postId);
		forumVO.setMemberId(memberId);
		forumVO.setPostTitle(postTitle);
		forumVO.setPostContent(postContent);
		forumVO.setPostTime(postTime);
		forumVO.setClicks(clicks);
		forumVO.setStatus(0);
		forumVO.setPostPic(postPic);
		
		forumDAO.insert(forumVO);
		return forumVO;
	}

	public ForumVO updateForum(Integer memberId, String postTitle, String postContent, LocalDateTime postTime,
			Integer clicks, Integer status, byte[] postPic, Integer postId) {
		ForumVO forumVO = new ForumVO();
		forumVO.setMemberId(memberId);
		forumVO.setPostTitle(postTitle);
		forumVO.setPostContent(postContent);
		forumVO.setPostTime(postTime);
		forumVO.setClicks(clicks);
		forumVO.setStatus(status);
		forumVO.setPostPic(postPic);
		forumVO.setPostId(postId);
		forumDAO.update(forumVO);
		return forumVO;
	}
	public ForumVO updateForumReport(Integer postId,String reason) {
		ForumVO forumVO = new ForumVO();
		forumVO.setReason(reason);
		forumVO.setPostId(postId);
		forumDAO.updateForumReport(forumVO);
		return forumVO;
	}
	public ForumVO updateForum(ForumVO forumVO) {
		forumDAO.update(forumVO);
		return forumVO;
	}

	public void deleteForum(Integer postId) {
		new CommentServiceImpl().deleteCommentAll(postId);
		forumDAO.delete(postId);
	}

	public ForumVO getOneForum(Integer postId) {
		return forumDAO.findByPrimaryKey(postId);
	}

	public List<ForumVO> getAll() {
		return forumDAO.getAll();
	}

	public Map<String, Object> findByPrimaryKey(Integer postId) {
		ForumVO forumVO = forumDAO.findByPrimaryKey(postId);
		CommentVO commentVO = commentDAO.selectByPostId(postId);
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("forum", forumVO);
		resultMap.put("comment", commentVO);
		return resultMap;
	}
}
