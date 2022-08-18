package web.forum.dao;

import java.util.List;

import web.forum.bean.CommentVO;

public interface CommentDAO {

	void insert(CommentVO commentVO);

	void update(CommentVO commentVO);

	void delete(Integer commentNo);

	CommentVO findByPrimaryKey(Integer commentNo);

	List<CommentVO> getAll();
	
	CommentVO selectByPostId(Integer postId);
	void deleteAll(Integer postID);
}