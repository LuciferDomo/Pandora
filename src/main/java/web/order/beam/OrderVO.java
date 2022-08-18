package web.order.beam;

import java.time.LocalDateTime;

public class OrderVO implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private Integer orderNo;
	private Integer memberID;
	private Integer packageNo;
	private LocalDateTime orderTime;
	private String creditCardType;
	private Integer totalAmount;
	private Integer discountNo;
	private Integer priceAfterDiscount;
	private Integer totalNumberOfPeople;
	private String status;
	private LocalDateTime cancelationTime;
	private LocalDateTime departureTime;
	
	public LocalDateTime getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(LocalDateTime departureTime) {
		this.departureTime = departureTime;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	private String packageName;

	
	public OrderVO() {
		
	}

	/**
	 * @return the orderNo
	 */
	public Integer getOrderNo() {
		return orderNo;
	}

	/**
	 * @param orderNo the orderNo to set
	 */
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	/**
	 * @return the memberID
	 */
	public Integer getMemberID() {
		return memberID;
	}

	/**
	 * @param memberID the memberID to set
	 */
	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}

	/**
	 * @return the packageNo
	 */
	public Integer getPackageNo() {
		return packageNo;
	}

	/**
	 * @param packageNo the packageNo to set
	 */
	public void setPackageNo(Integer packageNo) {
		this.packageNo = packageNo;
	}

	/**
	 * @return the orderTime
	 */
	public LocalDateTime getOrderTime() {
		return orderTime;
	}

	/**
	 * @param orderTime the orderTime to set
	 */
	public void setOrderTime(LocalDateTime orderTime) {
		this.orderTime = orderTime;
	}

	/**
	 * @return the creditCardType
	 */
	public String getCreditCardType() {
		return creditCardType;
	}

	/**
	 * @param creditCardType the creditCardType to set
	 */
	public void setCreditCardType(String creditCardType) {
		this.creditCardType = creditCardType;
	}

	/**
	 * @return the totalAmount
	 */
	public Integer getTotalAmount() {
		return totalAmount;
	}

	/**
	 * @param totalAmount the totalAmount to set
	 */
	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}

	/**
	 * @return the discountNo
	 */
	public Integer getDiscountNo() {
		return discountNo;
	}

	/**
	 * @param discountNo the discountNo to set
	 */
	public void setDiscountNo(Integer discountNo) {
		this.discountNo = discountNo;
	}

	/**
	 * @return the priceAfterDiscount
	 */
	public Integer getPriceAfterDiscount() {
		return priceAfterDiscount;
	}

	/**
	 * @param priceAfterDiscount the priceAfterDiscount to set
	 */
	public void setPriceAfterDiscount(Integer priceAfterDiscount) {
		this.priceAfterDiscount = priceAfterDiscount;
	}

	/**
	 * @return the totalNumberOfPeople
	 */
	public Integer getTotalNumberOfPeople() {
		return totalNumberOfPeople;
	}

	/**
	 * @param totalNumberOfPeople the totalNumberOfPeople to set
	 */
	public void setTotalNumberOfPeople(Integer totalNumberOfPeople) {
		this.totalNumberOfPeople = totalNumberOfPeople;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * @return the cancelationTime
	 */
	public LocalDateTime getCancelationTime() {
		return cancelationTime;
	}

	/**
	 * @param cancelationTime the cancelationTime to set
	 */
	public void setCancelationTime(LocalDateTime cancelationTime) {
		this.cancelationTime = cancelationTime;
	}

	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

}


