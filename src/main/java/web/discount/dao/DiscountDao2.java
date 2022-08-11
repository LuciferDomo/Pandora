package web.discount.dao;

import web.discount.bean.DiscountVO;

public interface DiscountDao {
	
	DiscountVO findByPrimaryKey(Integer discountNo);
}
