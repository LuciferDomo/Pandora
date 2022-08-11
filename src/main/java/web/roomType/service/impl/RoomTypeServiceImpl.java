package web.roomType.service.impl;

import java.util.List;

import web.room.bean.RoomTypeVO;
import web.roomType.dao.RoomTypeDAO;
import web.roomType.dao.impl.RoomTypeDAOImpl;
import web.roomType.service.RoomTypeService;

public class RoomTypeServiceImpl implements RoomTypeService{
	
	RoomTypeDAO dao = new RoomTypeDAOImpl();

	@Override
	public List<RoomTypeVO> getAll() {
		List<RoomTypeVO> roomTypeVOList = dao.getAll();

		return roomTypeVOList;
	}

	@Override
	public RoomTypeVO getOneRoomType(Integer roomTypeNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RoomTypeVO addRoomType(RoomTypeVO roomTypeVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RoomTypeVO updateRoomType(RoomTypeVO roomTypeVO) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
