package web.grouppinglist.dao;

import java.util.List;

import web.grouppinglist.bean.GrouppingListVO;

public interface GrouppingListDAO {
	
	void insert(GrouppingListVO grouppingListVO);

	void update(GrouppingListVO grouppingListVO);

	void delete(Integer groupMemberNo);

	GrouppingListVO findByPrimaryKey(Integer groupMemberNo);

	List<GrouppingListVO> getAll();
}
