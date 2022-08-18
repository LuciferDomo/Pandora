package web.order.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import web.discount.bean.DiscountVO;
import web.member.bean.MemberVO;
import web.order.beam.OrderVO;
import web.order.dao.OrderDAO;
import web.order.dao.impl.OrderDAOImpl;
import web.order.service.OrderService;
import web.packages.bean.PackagesVO;

public class OrderServiceImpl implements OrderService{
	
	private OrderDAO dao;
	
	public OrderServiceImpl() {
		dao = new OrderDAOImpl();
	}
	
	public List<OrderVO> getAllOrders (Integer memberID) {
		 List<OrderVO> result = dao.getMemberOrders(memberID);
		 System.out.println(result.size());
		 System.out.println(memberID);
		 return result;
	}
	
	@Override
	public Integer createOrder(Integer totalNumberOfPeople, MemberVO loginMemVO, PackagesVO packagesVO, Integer afterDiscountTotalPrice,
			Integer totalPirce, DiscountVO discountVO) {
		OrderVO orderVO = new OrderVO();
		orderVO.setCreditCardType("VISA");
		orderVO.setDiscountNo(discountVO.getDiscountNo());
		orderVO.setMemberID(loginMemVO.getMemberId());
		orderVO.setOrderTime(LocalDateTime.now());
		orderVO.setPackageNo(packagesVO.getPackageNo());
		orderVO.setPriceAfterDiscount(afterDiscountTotalPrice);
		orderVO.setStatus("Booked");
		orderVO.setTotalAmount(totalPirce);
		orderVO.setTotalNumberOfPeople(totalNumberOfPeople);
		
		return dao.insert(orderVO);
	}

	@Override
	public OrderVO selectOrderByOrderNo(Integer orderNo) {
		return dao.findByPrimaryKey(orderNo);
	}
}
