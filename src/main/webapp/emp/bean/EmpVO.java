package web.emp.bean;



import java.time.LocalDate;
import java.time.LocalDateTime;

public class EmpVO implements java.io.Serializable {

	private Integer employeeId;
	private byte[] empPictureId;
	private String englishLastName;
	private String englishFirstName;
	private String jobLevels;
	private String gender;
	private LocalDate empBirthday;
	private String passportNo;
	private String email;
	private LocalDate startDate;
	private LocalDate resignationDate;
	private String password;
	private String empCellphoneNo;
	private String empAddress;
	private String status;
	private LocalDateTime lastModificationDate;
	private LocalDateTime loginTime;

	public EmpVO() {

	}

	public Integer getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

	public byte[] getEmpPictureId() {
		return empPictureId;
	}

	public void setEmpPictureId(byte[] empPictureId) {
		this.empPictureId = empPictureId;
	}

	public String getEnglishLastName() {
		return englishLastName;
	}

	public void setEnglishLastName(String englishLastName) {
		this.englishLastName = englishLastName;
	}

	public String getEnglishFirstName() {
		return englishFirstName;
	}

	public void setEnglishFirstName(String englishFirstName) {
		this.englishFirstName = englishFirstName;
	}

	public String getJobLevels() {
		return jobLevels;
	}

	public void setJobLevels(String jobLevels) {
		this.jobLevels = jobLevels;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public LocalDate getEmpBirthday() {
		return empBirthday;
	}

	public void setEmpBirthday(LocalDate empBirthday) {
		this.empBirthday = empBirthday;
	}

	public String getPassportNo() {
		return passportNo;
	}

	public void setPassportNo(String passportNo) {
		this.passportNo = passportNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public LocalDate getResignationDate() {
		return resignationDate;
	}

	public void setResignationDate(LocalDate resignationDate) {
		this.resignationDate = resignationDate;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmpCellphoneNo() {
		return empCellphoneNo;
	}

	public void setEmpCellphoneNo(String empCellphoneNo) {
		this.empCellphoneNo = empCellphoneNo;
	}

	public String getEmpAddress() {
		return empAddress;
	}

	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public LocalDateTime getLastModificationDate() {
		return lastModificationDate;
	}

	public void setLastModificationDate(LocalDateTime lastModificationDate) {
		this.lastModificationDate = lastModificationDate;
	}

	public LocalDateTime getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(LocalDateTime loginTime) {
		this.loginTime = loginTime;
	}

	public EmpVO(Integer employeeId, byte[] empPictureId, String englishLastName, String englishFirstName,
			String jobLevels, String gender, LocalDate empBirthday, String passportNo, String email,
			LocalDate startDate, LocalDate resignationDate, String password, String empCellphoneNo,
			String empAddress, String status, LocalDateTime lastModificantionDate, LocalDateTime loginTime) {
		super();
		this.employeeId = employeeId;
		this.empPictureId = empPictureId;
		this.englishLastName = englishLastName;
		this.englishFirstName = englishFirstName;
		this.jobLevels = jobLevels;
		this.gender = gender;
		this.empBirthday = empBirthday;
		this.passportNo = passportNo;
		this.email = email;
		this.startDate = startDate;
		this.resignationDate = resignationDate;
		this.password = password;
		this.empCellphoneNo = empCellphoneNo;
		this.empAddress = empAddress;
		this.status = status;
		this.lastModificationDate = lastModificantionDate;
		this.loginTime = loginTime;
	}

}
