package web.member.dao.impl;

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

import web.member.bean.MemberVO;
import web.member.dao.MemberDAO;

public class MemberDAOImpl implements MemberDAO {
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Pandora");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT = "INSERT INTO Member(Member_Picture_Id,Chinese_Name,English_First_Name,English_Last_Name,"
			+ "Gender,Member_Birthday,Member_ID_No,Member_PhoneNumber,Member_Address,Member_Email,Member_Passport_No,Member_Password)"
			+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT (Member_Picture_Id,Discount_No,Chinese_Name,English_First_Name,English_Last_Name,"
			+ "Gender,Member_Birthday,Member_ID_No,Member_Address,Member_Email,Member_Passport_No,Member_Password,Member_PhoneNumber)"
			+ "FROM Pandora order by employeeId";
	private static final String GET_ONE_STMT = "SELECT * FROM Member where Member_ID = ?";
	
	private static final String DELETE = "DELETE FROM Pandora where Member_ID = ?";
	
	private static final String UPDATE                = "UPDATE Member set Member_ID=?,Member_Picture_ID=?,Discount_No=?,Chinese_Name=?,English_First_Name=?,English_Last_Name=?,"
			+ "Gender=?,Member_Birthday=?,Member_ID_No=?,Member_PhoneNumber=?,Member_Address=?,Member_Email=?,Member_Passport_No=?,Accumulated=?,"
			+ "Last_Update_Date=?,Member_Password=?,Registration_Time=? where Employee_ID = ?";
	
	private static final String UPDATE_WithOutPicture = "UPDATE Member set Member_ID=?                    ,Discount_No=?,Chinese_Name=?,English_First_Name=?,English_Last_Name=?,"
			+ "Gender=?,Member_Birthday=?,Member_ID_No=?,Member_PhoneNumber=?,Member_Address=?,Member_Email=?,Member_Passport_No=?,Accumulated=?,"
			+ "Last_Update_Date=?,Member_Password=?,Registration_Time=? where Employee_ID = ?";
	
	private static final String EMAIL_CHECK = "SELECT Email FROM Member WHERE Email=?";

	
	
	
	
	

	@Override
	public void insert(MemberVO memberVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setBytes(1, memberVO.getMemberPictureId());
			pstmt.setString(2, memberVO.getChineseName());
			pstmt.setString(3, memberVO.getMemberEnglishFirstName());
			pstmt.setString(4, memberVO.getMemberEnglishLastName());
			pstmt.setString(5, memberVO.getGender());
			pstmt.setDate(6, Date.valueOf(memberVO.getMemberBirthday()));
			pstmt.setString(7, memberVO.getMemberIdNo());
			pstmt.setInt(7, memberVO.getMemberPhoneNumber());
			pstmt.setString(8, memberVO.getMemberAddress());
			pstmt.setString(9, memberVO.getMemberEmail());
			pstmt.setString(10, memberVO.getMemberPassportNo());
			pstmt.setString(11, memberVO.getMemberPassword());
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
	public void update(MemberVO memberVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, memberVO.getMemberId());
			pstmt.setBytes(2, memberVO.getMemberPictureId());
			pstmt.setInt(3, memberVO.getDiscountNo());
			pstmt.setString(4, memberVO.getChineseName());
			pstmt.setString(5, memberVO.getMemberEnglishFirstName());
			pstmt.setString(6, memberVO.getMemberEnglishLastName());
			pstmt.setString(7, memberVO.getGender());
			pstmt.setDate(8, Date.valueOf(memberVO.getMemberBirthday()));
			pstmt.setString(9, memberVO.getMemberIdNo());
			pstmt.setInt(10, memberVO.getMemberPhoneNumber());
			pstmt.setString(11, memberVO.getMemberAddress());
			pstmt.setString(12, memberVO.getMemberEmail());
			pstmt.setString(13, memberVO.getMemberPassportNo());
			pstmt.setInt(14, memberVO.getAccumulatedConsumption());
			pstmt.setTimestamp(15, Timestamp.valueOf(memberVO.getLastUpdateDate()));
			pstmt.setString(16, memberVO.getMemberPassword());
			pstmt.setTimestamp(17, memberVO.getRegistrationTime() != null ? Timestamp.valueOf(memberVO.getRegistrationTime()) : null);
			pstmt.setInt(18, memberVO.getMemberId());
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
	public void updateWithOutPicture(MemberVO memberVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_WithOutPicture);
			pstmt.setInt(1, memberVO.getMemberId());
			pstmt.setInt(2, memberVO.getDiscountNo());
			pstmt.setString(3, memberVO.getChineseName());
			pstmt.setString(4, memberVO.getMemberEnglishFirstName());
			pstmt.setString(5, memberVO.getMemberEnglishLastName());
			pstmt.setString(6, memberVO.getGender());
			pstmt.setDate(7, Date.valueOf(memberVO.getMemberBirthday()));
			pstmt.setString(8, memberVO.getMemberIdNo());
			pstmt.setInt(9, memberVO.getMemberPhoneNumber());
			pstmt.setString(10, memberVO.getMemberAddress());
			pstmt.setString(11, memberVO.getMemberEmail());
			pstmt.setString(12, memberVO.getMemberPassportNo());
			pstmt.setInt(13, memberVO.getAccumulatedConsumption());
			pstmt.setTimestamp(14, Timestamp.valueOf(memberVO.getLastUpdateDate()));
			pstmt.setString(15, memberVO.getMemberPassword());
			pstmt.setTimestamp(16, memberVO.getRegistrationTime() != null ? Timestamp.valueOf(memberVO.getRegistrationTime()) : null);
			pstmt.setInt(17, memberVO.getMemberId());
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
	public List<MemberVO> getAll() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		MemberVO memberVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				memberVO = new MemberVO();
				memberVO.setMemberId(rs.getInt("Member_Id"));
				memberVO.setMemberPictureId(rs.getBytes("Member_Picture_Id"));
				memberVO.setDiscountNo(rs.getInt("Discount_No"));
				memberVO.setChineseName(rs.getString("Chinese_Name"));
				memberVO.setMemberEnglishFirstName(rs.getString("English_First_Name"));
				memberVO.setMemberEnglishLastName(rs.getString("English_Last_Name"));
				memberVO.setGender(rs.getString("gender"));
				memberVO.setMemberBirthday(rs.getDate("Member_Birthday").toLocalDate());
				memberVO.setMemberIdNo(rs.getString("Member_ID_No"));
				memberVO.setMemberPhoneNumber(rs.getInt("Member_PhoneNumber"));
				memberVO.setMemberAddress(rs.getString("Member_Address"));
				memberVO.setMemberEmail(rs.getString("Member_Email"));
				memberVO.setMemberPassportNo(rs.getString("Member_Passport_No"));
				memberVO.setAccumulatedConsumption(rs.getInt("Accumulated_Consumption"));
				memberVO.setLastUpdateDate(rs.getTimestamp("Late_Update_Date").toLocalDateTime());
				memberVO.setMemberPassword(rs.getString("Member_Password"));
				if (rs.getDate("Registration_Time") != null) {
					memberVO.setRegistrationTime(rs.getTimestamp("Registration_Time").toLocalDateTime());
				}
				list.add(memberVO);
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
	public MemberVO findByPrimaryKey(Integer memberId) {

		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, memberId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				memberVO = new MemberVO();
				memberVO.setMemberId(rs.getInt("Member_Id"));
				memberVO.setMemberPictureId(rs.getBytes("Member_Picture_Id"));
				memberVO.setDiscountNo(rs.getInt("Discount_No"));
				memberVO.setChineseName(rs.getString("Chinese_Name"));
				memberVO.setMemberEnglishFirstName(rs.getString("English_First_Name"));
				memberVO.setMemberEnglishLastName(rs.getString("English_Last_Name"));
				memberVO.setGender(rs.getString("Gender"));
				memberVO.setMemberBirthday(rs.getDate("Member_Birthday").toLocalDate());
				memberVO.setMemberIdNo(rs.getString("Member_ID_No"));
				memberVO.setMemberPhoneNumber(rs.getInt("Member_PhoneNumber"));
				memberVO.setMemberAddress(rs.getString("Member_Address"));
				memberVO.setMemberEmail(rs.getString("Member_Email"));
				memberVO.setMemberPassportNo(rs.getString("Member_Passport_No"));
				memberVO.setAccumulatedConsumption(rs.getInt("Accumulated_Consumption"));
				memberVO.setLastUpdateDate(rs.getTimestamp("Last_Update_Date").toLocalDateTime());
				memberVO.setMemberPassword(rs.getString("Member_Password"));
				if (rs.getDate("Registration_Time") != null) {
					memberVO.setRegistrationTime(rs.getTimestamp("Registration_Time").toLocalDateTime());
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
		return memberVO;
	}
	@Override
	public MemberVO selectByEmailAndPassword(MemberVO memberVO) {

		try (Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn
						.prepareStatement("select * from Member where Member_Email=? and Member_Password=?");) {

			pstmt.setString(1, memberVO.getMemberEmail());
			pstmt.setString(2, memberVO.getMemberPassword()); // 1跟2 為第幾個問號
			System.out.println(memberVO);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					MemberVO resultMemberVO = new MemberVO();
					resultMemberVO.setMemberId(rs.getInt("Member_Id"));
					resultMemberVO.setMemberPictureId(rs.getBytes("Member_Picture_Id"));
					resultMemberVO.setDiscountNo(rs.getInt("Discount_No"));
					resultMemberVO.setChineseName(rs.getString("Chinese_Name"));
					resultMemberVO.setMemberEnglishFirstName(rs.getString("English_First_Name"));
					resultMemberVO.setMemberEnglishLastName(rs.getString("English_Last_Name"));
					resultMemberVO.setGender(rs.getString("Gender"));
					resultMemberVO.setMemberBirthday(rs.getDate("Member_Birthday").toLocalDate());
					resultMemberVO.setMemberIdNo(rs.getString("Member_ID_No"));
					resultMemberVO.setMemberPhoneNumber(rs.getInt("Member_PhoneNumber"));
					resultMemberVO.setMemberAddress(rs.getString("Member_Address"));
					resultMemberVO.setMemberEmail(rs.getString("Member_Email"));
					resultMemberVO.setMemberPassportNo(rs.getString("Member_Passport_No"));
					resultMemberVO.setAccumulatedConsumption(rs.getInt("Accumulated_Consumption"));
//					if (rs.getTimestamp("Late_Update_Date") != null) {
//						resultMemberVO.setLastUpdateDate(rs.getTimestamp("Late_Update_Date").toLocalDateTime());
//					}
					resultMemberVO.setMemberPassword(rs.getString("Member_Password"));
//					if (rs.getTimestamp("Registration_Time") != null) {
//						resultMemberVO.setRegistrationTime(rs.getTimestamp("Registration_Time").toLocalDateTime());
//					}
				
					return resultMemberVO;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public void delete(Integer memberId) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, memberId);

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
	public boolean isExistEmail(String memberEmail) {

		try (Connection conn = ds.getConnection(); PreparedStatement pstmt = conn.prepareStatement(EMAIL_CHECK);) {
			pstmt.setString(1, memberEmail);

			ResultSet rs = pstmt.executeQuery();
			return rs.next();

		} catch (Exception e) { 
			throw new RuntimeException();
			
		}

	}
	
	
	
	
	
	
}
