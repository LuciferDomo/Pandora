package web.discount.bean;

import java.math.BigDecimal;

public class DiscountVO implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer discountNo;
	private String memberLevel;
	private BigDecimal discount;
	private Integer levelQualification;
	
	public Integer getDiscountNo() {
		return discountNo;
	}
	public void setDiscountNo(Integer discountNo) {
		this.discountNo = discountNo;
	}
	public String getMemberLevel() {
		return memberLevel;
	}
	public void setMemberLevel(String memberLevel) {
		this.memberLevel = memberLevel;
	}
	public BigDecimal getDiscount() {
		return discount;
	}
	public void setDiscount(BigDecimal discount) {
		this.discount = discount;
	}
	public Integer getLevelQualification() {
		return levelQualification;
	}
	public void setLevelQualification(Integer levelQualification) {
		this.levelQualification = levelQualification;
	}
}
