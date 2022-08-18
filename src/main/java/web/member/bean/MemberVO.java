package web.member.bean;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class MemberVO implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer memberId;
	private byte[] memberPictureId;
	private Integer discountNo;
	private String chineseName;
	private String memberEnglishFirstName;
	private String memberEnglishLastName;
	private String gender;
	private LocalDate memberBirthday;
	private String memberIdNo;
	private String memberPhoneNumber;
	private String memberAddress;
	private String memberEmail;
	private String memberPassportNo;
	private Integer accumulatedConsumption;
	private LocalDateTime lastUpdateDate;
	private String memberPassword;
	private LocalDateTime registrationTime;
	private String memberLevel;

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public byte[] getMemberPictureId() {
		return memberPictureId;
	}

	public void setMemberPictureId(byte[] memberPictureId) {
		this.memberPictureId = memberPictureId;
	}

	public Integer getDiscountNo() {
		return discountNo;
	}

	public void setDiscountNo(Integer discountNo) {
		this.discountNo = discountNo;
	}

	public String getChineseName() {
		return chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}

	public String getMemberEnglishFirstName() {
		return memberEnglishFirstName;
	}

	public void setMemberEnglishFirstName(String memberEnglishFirstName) {
		this.memberEnglishFirstName = memberEnglishFirstName;
	}

	public String getMemberEnglishLastName() {
		return memberEnglishLastName;
	}

	public void setMemberEnglishLastName(String memberEnglishLastName) {
		this.memberEnglishLastName = memberEnglishLastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public LocalDate getMemberBirthday() {
		return memberBirthday;
	}

	public void setMemberBirthday(LocalDate memberBirthday) {
		this.memberBirthday = memberBirthday;
	}

	public String getMemberIdNo() {
		return memberIdNo;
	}

	public void setMemberIdNo(String memberIdNo) {
		this.memberIdNo = memberIdNo;
	}

	public String getMemberPhoneNumber() {
		return memberPhoneNumber;
	}

	public void setMemberPhoneNumber(String MemberPhoneNumber) {
		this.memberPhoneNumber = MemberPhoneNumber;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPassportNo() {
		return memberPassportNo;
	}

	public void setMemberPassportNo(String memberPassportNo) {
		this.memberPassportNo = memberPassportNo;
	}

	public Integer getAccumulatedConsumption() {
		return accumulatedConsumption;
	}

	public void setAccumulatedConsumption(Integer accumulatedConsumption) {
		this.accumulatedConsumption = accumulatedConsumption;
	}

	public LocalDateTime getLastUpdateDate() {
		return lastUpdateDate;
	}

	public void setLastUpdateDate(LocalDateTime lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public LocalDateTime getRegistrationTime() {
		return registrationTime;
	}

	public void setRegistrationTime(LocalDateTime registrationTime) {
		this.registrationTime = registrationTime;
	}

	public String getMemberLevel() {
		return memberLevel;
	}

	public void setMemberLevel(String memberLevel) {
		this.memberLevel = memberLevel;
	}
}
