package web.roomTypeAndRoomListJoin.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import web.room.joinbean.RoomTypeAndRoomListVO;
import web.roomTypeAndRoomListJoin.dao.RoomTypeAndRoomListJoinDAO;

public class RoomTypeAndRoomListJoinDAOImpl implements RoomTypeAndRoomListJoinDAO {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Pandora");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String LOOKUP = "select Room_List_No, rt.Room_Type_No, Room_Type, Room_Price, Room_No, Max_Capacity, rl.Ship_No from Room_List rl join Room_Type rt on rl.Room_Type_No = rt.Room_Type_No where rl.Room_No = ? and rl.Ship_No = ?";

	@Override
	public RoomTypeAndRoomListVO findByShipNoAndRoomNo(int shipNo, String roomNo) {
		RoomTypeAndRoomListVO pickedRoomType = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(LOOKUP);
			pstmt.setString(1, roomNo);
			pstmt.setInt(2, shipNo);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				pickedRoomType = new RoomTypeAndRoomListVO();
				pickedRoomType.setShipNo(rs.getInt("Ship_No"));
				pickedRoomType.setRoomListNo(rs.getInt("Room_List_No"));
				pickedRoomType.setRoomTypeNo(rs.getInt("Room_Type_No"));
				pickedRoomType.setRoomType(rs.getString("Room_Type"));
				pickedRoomType.setRoomNo(rs.getString("Room_No"));
				pickedRoomType.setRoomPrice(rs.getInt("Room_Price"));
				pickedRoomType.setMaxCapacity(rs.getInt("Max_Capacity"));
			}
		} catch (SQLException se) {
			throw new RuntimeException("查無資料" + se.getMessage());
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
		return pickedRoomType;
	}
}
