package web.emp.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import java.util.ArrayList;

import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import web.emp.bean.EmpVO;
import web.emp.dao.EmpDAO;

public class EmpDAOImpl implements EmpDAO {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Pandora");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO Employee(EMP_Picture_ID,English_Last_Name,English_First_Name,Job_Levels,Gender,EMP_Birthday,Passport_No,"
			+ "Email,Start_Date,Resignation_Date,Password,EMP_Cellphone_No,EMP_Address,Status,Last_Modification_Date,Login_Time)  "
			+ "VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?,?, ?, ?,?)";
	private static final String GET_ALL_STMT = "SELECT * FROM Employee order by Employee_ID";
	private static final String GET_ONE_STMT = "SELECT * FROM Employee where Employee_ID = ?";
	private static final String DELETE = "DELETE FROM Pandora where Employee_ID = ?";
	private static final String UPDATE                = "UPDATE Employee set Employee_ID=?,EMP_Picture_ID=?,English_Last_Name=?,English_First_Name=?,Job_Levels=?,Gender=?,EMP_Birthday=?,Passport_No=?,Email=?,Start_Date=?,Resignation_Date=?,Password=?,EMP_Cellphone_No=?,EMP_Address=?,Status=?,Last_Modification_Date=?,Login_Time=? where Employee_ID = ?";
	private static final String UPDATE_WithOutPicture = "UPDATE Employee set Employee_ID=?                 ,English_Last_Name=?,English_First_Name=?,Job_Levels=?,Gender=?,EMP_Birthday=?,Passport_No=?,Email=?,Start_Date=?,Resignation_Date=?,Password=?,EMP_Cellphone_No=?,EMP_Address=?,Status=?,Last_Modification_Date=?,Login_Time=? where Employee_ID = ?";
	private static final String EMAIL_CHECK = "SELECT Email FROM Employee WHERE Email=?";

	@Override
	public void insert(EmpVO empVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setBytes(1, empVO.getEmpPictureId());
			pstmt.setString(2, empVO.getEnglishLastName());
			pstmt.setString(3, empVO.getEnglishFirstName());
			pstmt.setString(4, empVO.getJobLevels());
			pstmt.setString(5, empVO.getGender());
			pstmt.setDate(6, Date.valueOf(empVO.getEmpBirthday()));
			pstmt.setString(7, empVO.getPassportNo());
			pstmt.setString(8, empVO.getEmail());
			pstmt.setDate(9, Date.valueOf(empVO.getStartDate()));
			pstmt.setDate(10, empVO.getResignationDate() != null ? Date.valueOf(empVO.getResignationDate()) : null);
			pstmt.setString(11, empVO.getPassword());
			pstmt.setString(12, empVO.getEmpCellphoneNo());
			pstmt.setString(13, empVO.getEmpAddress());
			pstmt.setString(14, empVO.getStatus());
			pstmt.setTimestamp(15, Timestamp.valueOf(empVO.getLastModificationDate()));
			pstmt.setTimestamp(16, empVO.getLoginTime() != null ? Timestamp.valueOf(empVO.getLoginTime()) : null);
			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void update(EmpVO empVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, empVO.getEmployeeId());
			pstmt.setBytes(2, empVO.getEmpPictureId());
			pstmt.setString(3, empVO.getEnglishLastName());
			pstmt.setString(4, empVO.getEnglishFirstName());
			pstmt.setString(5, empVO.getJobLevels());
			pstmt.setString(6, empVO.getGender());
			pstmt.setDate(7, Date.valueOf(empVO.getEmpBirthday()));
			pstmt.setString(8, empVO.getPassportNo());
			pstmt.setString(9, empVO.getEmail());
			pstmt.setDate(10, Date.valueOf(empVO.getStartDate()));
			pstmt.setDate(11, empVO.getResignationDate() != null ? Date.valueOf(empVO.getResignationDate()) : null);
			pstmt.setString(12, empVO.getPassword());
			pstmt.setString(13, empVO.getEmpCellphoneNo());
			pstmt.setString(14, empVO.getEmpAddress());
			pstmt.setString(15, empVO.getStatus());
			pstmt.setTimestamp(16, Timestamp.valueOf(empVO.getLastModificationDate()));
			pstmt.setTimestamp(17, empVO.getLoginTime() != null ? Timestamp.valueOf(empVO.getLoginTime()) : null);
			pstmt.setInt(18, empVO.getEmployeeId());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void updateWithOutPicture(EmpVO empVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_WithOutPicture);
			pstmt.setInt(1, empVO.getEmployeeId());
			pstmt.setString(2, empVO.getEnglishLastName());
			pstmt.setString(3, empVO.getEnglishFirstName());
			pstmt.setString(4, empVO.getJobLevels());
			pstmt.setString(5, empVO.getGender());
			pstmt.setDate(6, Date.valueOf(empVO.getEmpBirthday()));
			pstmt.setString(7, empVO.getPassportNo());
			pstmt.setString(8, empVO.getEmail());
			pstmt.setDate(9, Date.valueOf(empVO.getStartDate()));
			pstmt.setDate(10, empVO.getResignationDate() != null ? Date.valueOf(empVO.getResignationDate()) : null);
			pstmt.setString(11, empVO.getPassword());
			pstmt.setString(12, empVO.getEmpCellphoneNo());
			pstmt.setString(13, empVO.getEmpAddress());
			pstmt.setString(14, empVO.getStatus());
			pstmt.setTimestamp(15, Timestamp.valueOf(empVO.getLastModificationDate()));
			pstmt.setTimestamp(16, empVO.getLoginTime() != null ? Timestamp.valueOf(empVO.getLoginTime()) : null);
			pstmt.setInt(17, empVO.getEmployeeId());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(Integer employeeId) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, employeeId);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public EmpVO findByPrimaryKey(Integer employeeId) {

		EmpVO empVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, employeeId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				empVO = new EmpVO();
				empVO.setEmployeeId(rs.getInt("Employee_ID"));
				empVO.setEmpPictureId(rs.getBytes("EMP_Picture_ID"));
				empVO.setEnglishLastName(rs.getString("English_Last_Name"));
				empVO.setEnglishFirstName(rs.getString("English_First_Name"));
				empVO.setJobLevels(rs.getString("Job_Levels"));
				empVO.setGender(rs.getString("Gender"));
				empVO.setEmpBirthday(rs.getDate("EMP_Birthday").toLocalDate());
				empVO.setPassportNo(rs.getString("Passport_No"));
				empVO.setEmail(rs.getString("Email"));
				empVO.setStartDate(rs.getDate("Start_Date").toLocalDate());
				if (rs.getDate("Resignation_Date") != null) {
					empVO.setResignationDate(rs.getDate("Resignation_Date").toLocalDate());
				}
				empVO.setPassword(rs.getString("Password"));
				empVO.setEmpCellphoneNo(rs.getString("EMP_Cellphone_No"));
				empVO.setEmpAddress(rs.getString("EMP_Address"));
				empVO.setStatus(rs.getString("Status"));
				empVO.setLastModificationDate(rs.getTimestamp("Last_Modification_Date").toLocalDateTime());
				if (rs.getTimestamp("Login_Time") != null) {
					empVO.setLoginTime(rs.getTimestamp("Login_Time").toLocalDateTime());

				}

			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return empVO;
	}

	@Override
	public List<EmpVO> getAll() {
		List<EmpVO> list = new ArrayList<EmpVO>();
		EmpVO empVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				empVO = new EmpVO();
				empVO.setEmployeeId(rs.getInt("Employee_ID"));
				empVO.setEmpPictureId(rs.getBytes("Emp_Picture_ID"));
				empVO.setEnglishLastName(rs.getString("English_Last_Name"));
				empVO.setEnglishFirstName(rs.getString("English_First_Name"));
				empVO.setJobLevels(rs.getString("Job_Levels"));
				empVO.setGender(rs.getString("Gender"));
				empVO.setEmpBirthday(rs.getDate("Emp_Birthday").toLocalDate());
				empVO.setPassportNo(rs.getString("Passport_No"));
				empVO.setEmail(rs.getString("Email"));
				empVO.setStartDate(rs.getDate("Start_Date").toLocalDate());
				if (rs.getDate("Resignation_Date") != null) {
					empVO.setResignationDate(rs.getDate("Resignation_Date").toLocalDate());
				}
//				if (rs.getDate("Resignation_Date").toLocalDate() ==null) {
//					empVO.setResignationDate(null);
//				}else {
//					empVO.setResignationDate(rs.getDate("2030-03-06").toLocalDate());
//				}
				empVO.setPassword(rs.getString("Password"));
				empVO.setEmpCellphoneNo(rs.getString("EMP_Cellphone_No"));
				empVO.setEmpAddress(rs.getString("EMP_Address"));
				empVO.setStatus(rs.getString("Status"));
				empVO.setLastModificationDate(rs.getTimestamp("Last_Modification_Date").toLocalDateTime());
//				if (rs.getTimestamp("Login_Time") == null) {
//					empVO.setLoginTime(null);
//				}else {
//					empVO.setLoginTime(rs.getTimestamp("2030-03-06").toLocalDateTime());
//				}
//				
				if (rs.getTimestamp("Login_Time") != null) {
					empVO.setLoginTime(rs.getTimestamp("Login_Time").toLocalDateTime());

				}

				list.add(empVO);
				// Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public EmpVO selectByEmailAndPassword(EmpVO empVO) {

		try (Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn
						.prepareStatement("select * from Employee where Email=? and Password=?");) {

			pstmt.setString(1, empVO.getEmail());
			pstmt.setString(2, empVO.getPassword()); // 1跟2 為第幾個問號
			System.out.println(empVO);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					EmpVO resultEmpVO = new EmpVO();
					resultEmpVO.setEmployeeId(rs.getInt("Employee_Id"));
					resultEmpVO.setEmpPictureId(rs.getBytes("EMP_Picture_Id"));
					resultEmpVO.setEnglishFirstName(rs.getString("English_First_Name"));
					resultEmpVO.setEnglishLastName(rs.getString("English_Last_Name"));
					resultEmpVO.setJobLevels(rs.getString("Job_Levels"));
					resultEmpVO.setGender(rs.getString("Gender"));
					resultEmpVO.setEmpBirthday(rs.getDate("EMP_Birthday").toLocalDate());
					resultEmpVO.setPassportNo(rs.getString("Passport_No"));
					resultEmpVO.setEmail(rs.getString("Email"));
					resultEmpVO.setStartDate(rs.getDate("Start_Date").toLocalDate());
					if (rs.getTimestamp("Resignation_Date") != null) {
						resultEmpVO.setResignationDate(rs.getDate("Resignation_Date").toLocalDate());
					}

					resultEmpVO.setPassword(rs.getNString("Password"));
					resultEmpVO.setEmpCellphoneNo(rs.getString("EMP_Cellphone_No"));
					resultEmpVO.setEmpAddress(rs.getString("EMP_Address"));
					resultEmpVO.setStatus(rs.getString("Status"));
					resultEmpVO.setLastModificationDate(rs.getTimestamp("Last_Modification_Date").toLocalDateTime());
					if (rs.getTimestamp("Login_Time") != null) {
						resultEmpVO.setLoginTime(rs.getTimestamp("Login_Time").toLocalDateTime());

					}
					return resultEmpVO;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public boolean isExistEmail(String email) {

		try (Connection conn = ds.getConnection(); PreparedStatement pstmt = conn.prepareStatement(EMAIL_CHECK);) {
			pstmt.setString(1, email);

			ResultSet rs = pstmt.executeQuery();
			return rs.next();

		} catch (Exception e) { 
			throw new RuntimeException();
			
		}

	}
}