package web.grouppinglist.service.impl;

import web.grouppinglist.bean.GrouppingListVO;
import web.grouppinglist.dao.GrouppingListDAO;
import web.grouppinglist.dao.impl.GrouppingListDAOImpl;
import web.grouppinglist.service.GrouppingListService;

public class GrouppingListServiceImpl implements GrouppingListService{
	
	GrouppingListDAO dao;
	
	public GrouppingListServiceImpl() {
		dao = new GrouppingListDAOImpl();
	}
	
	@Override
	public void createGrouppingList(Integer roomListNo, Integer orderNo, Integer memberID, Integer status) {
		GrouppingListVO grouppingListVO = new GrouppingListVO();
		grouppingListVO.setMemberID(memberID);
		grouppingListVO.setOrderNo(orderNo);
		grouppingListVO.setRoomListNo(roomListNo);
		grouppingListVO.setStatus(status);
		
		dao.insert(grouppingListVO);
	}
}
