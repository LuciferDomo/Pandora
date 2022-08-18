package web.orderdetail.service.impl;

import web.orderdetail.bean.OrderDetailVO;
import web.orderdetail.dao.OrderDetailDAO;
import web.orderdetail.dao.impl.OrderDetailDAOImpl;
import web.orderdetail.service.OrderDetailService;

public class OrderDetailServiceImpl implements OrderDetailService{

	OrderDetailDAO dao;
	
	public OrderDetailServiceImpl() {
		dao = new OrderDetailDAOImpl(); 
	}
	
	@Override
	public void createOrderDetail(Integer orderNo, Integer packageNo, Integer roomListNo) {
		OrderDetailVO orderDetailVO = new OrderDetailVO();
		orderDetailVO.setOrderNo(orderNo);
		orderDetailVO.setPackageNo(packageNo);
		orderDetailVO.setRoomListNo(roomListNo);
		
		dao.insert(orderDetailVO);
	}
}
