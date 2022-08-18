package web.grouppinglist.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import web.grouppinglist.bean.GrouppingListVO;
import web.grouppinglist.dao.GrouppingListDAO;

public class GrouppingListDAOImpl implements GrouppingListDAO {
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Pandora");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT = "INSERT INTO Groupping_List (Room_List_No, Order_No, Member_ID, Status) "
			+ "VALUES (?, ?, ?, ?)";
	
	@Override
	public void insert(GrouppingListVO grouppingListVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, grouppingListVO.getRoomListNo());
			pstmt.setInt(2, grouppingListVO.getOrderNo());
			pstmt.setInt(3, grouppingListVO.getMemberID());
			pstmt.setInt(4, grouppingListVO.getStatus());
			
			pstmt.executeUpdate();
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
	}

	@Override
	public void update(GrouppingListVO grouppingListVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer groupMemberNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public GrouppingListVO findByPrimaryKey(Integer groupMemberNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GrouppingListVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
