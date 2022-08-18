package web.order.service;

import java.util.List;

import web.discount.bean.DiscountVO;
import web.member.bean.MemberVO;
import web.order.beam.OrderVO;
import web.packages.bean.PackagesVO;

public interface OrderService {
	
	Integer createOrder (Integer totalNumberOfPeople, MemberVO loginMemVO, PackagesVO packagesVO, Integer afterDiscountTotalPrice, Integer totalPirce, DiscountVO discountVO);
	
	OrderVO selectOrderByOrderNo (Integer orderNo);
	
	List<OrderVO> getAllOrders(Integer memberID);
}
