package web.discount.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import web.discount.bean.DiscountVO;
import web.discount.dao.DiscountDao;
import web.member.bean.MemberVO;

public class DiscountDaoImpl implements DiscountDao {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Pandora");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String GET_ONE_STMT = "SELECT * FROM Discount where Discount_No = ?";

	@Override
	public DiscountVO findByPrimaryKey(Integer discountNo) {

		DiscountVO discountVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, discountNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				discountVO = new DiscountVO();
				discountVO.setDiscountNo(rs.getInt("Discount_No"));
				discountVO.setMemberLevel(rs.getString("Member_Level"));
				discountVO.setDiscount(rs.getBigDecimal("Discount"));
				discountVO.setLevelQualification(rs.getInt("Level_Qualification"));
			}
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

		return discountVO;
	}

}
