package web.forum.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import web.forum.bean.CommentVO;
import web.forum.dao.CommentDAO;
import web.forum.dao.impl.CommentDAOImpl;

public class CommentServiceImpl {
	
	private CommentDAO dao;
	
	public CommentServiceImpl() {
		
		dao = new CommentDAOImpl();
		
	}
    
	public CommentVO addComment(Integer commentNo, Integer postId, Integer memberId, String commentContent, LocalDateTime commentTime, String status) {
		
		CommentVO commentVO = new CommentVO();
		
		commentVO.setCommentNo(commentNo);
		commentVO.setPostId(postId);
		commentVO.setMemberId(memberId);
		commentVO.setCommentContent(commentContent);
		commentVO.setCommentTime(commentTime);
		commentVO.setStatus(status);
		dao.insert(commentVO);
		
		return commentVO;
	}
	
	public CommentVO updateComment(Integer commentNo, Integer postId, Integer memberId, String commentContent, LocalDateTime commentTime, String status) {
		
		CommentVO commentVO = new CommentVO();
		
		commentVO.setCommentNo(commentNo);
		commentVO.setPostId(postId);
		commentVO.setMemberId(memberId);
		commentVO.setCommentContent(commentContent);
		commentVO.setCommentTime(commentTime);
		commentVO.setStatus(status);
		dao.update(commentVO);
		
		return commentVO;		
	}
	
	public void deleteComment(Integer commentNo) {
		
		dao.delete(commentNo);
		
	}
	
	public CommentVO getOneComment(Integer commentNo) {
		
		return dao.findByPrimaryKey(commentNo);
		
	}
	
	public List<CommentVO> getAll(){
		
		return dao.getAll();
		
	}
	
	public CommentVO findByPrimaryKey(Integer commentNo) {
		
		// TODO Auto-generated method stub
		return null;
		
	}
	
}
