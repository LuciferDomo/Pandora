package web.discount.service.impl;

import web.discount.bean.DiscountVO;
import web.discount.dao.DiscountDao;
import web.discount.dao.impl.DiscountDaoImpl;
import web.discount.service.DiscountService;

public class DiscountServiceImpl implements DiscountService{
	
	DiscountDao dao = new DiscountDaoImpl();
	
	@Override
	public DiscountVO getOneDiscount(Integer discountNo) {
		return dao.findByPrimaryKey(discountNo);
	}
	
	
}
