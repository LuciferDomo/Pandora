package web.order.dao;

import java.util.List;

import web.order.beam.OrderVO;

public interface OrderDAO {
	
	Integer insert(OrderVO orderVO);
	
	void update(OrderVO orderVO);

	void delete(Integer orderNo);

	OrderVO findByPrimaryKey(Integer orderNo);

	List<OrderVO> getMemberOrders(Integer memberID);

}
