package web.forum.dao;

import java.util.List;


import web.forum.bean.ForumVO;


public interface ForumDAO {
    
	void insert(ForumVO forumVO);

	void update(ForumVO forumVO);

	void delete(Integer postId);

	ForumVO findByPrimaryKey(Integer postId);

	List<ForumVO> getAll();
	
	void updateWithOutPicture(ForumVO forumVO);
	
	//萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<EmpVO> getAll(Map<String, String[]> map);
	
}
