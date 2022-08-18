package web.orderdetail.dao;

import java.util.List;

import web.orderdetail.bean.OrderDetailVO;

public interface OrderDetailDAO {

	void insert(OrderDetailVO orderDetailVO);

	void update(OrderDetailVO orderDetailVO);

	void delete(Integer orderDetailNo);

	OrderDetailVO findByPrimaryKey(Integer orderDetailNo);

	List<OrderDetailVO> getAll();
}
