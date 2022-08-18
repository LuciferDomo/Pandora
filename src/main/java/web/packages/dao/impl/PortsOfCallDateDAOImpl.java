package web.packages.dao.impl;

import java.sql.Connection;
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

import web.packages.bean.PackagesVO;
import web.packages.bean.PortsOfCallDateVO;
import web.packages.dao.PortsOfCallDateDAO;

public class PortsOfCallDateDAOImpl implements PortsOfCallDateDAO {

	private static DataSource ds = null;

	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Pandora");

		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String getAllportsOfCallDate = "SELECT * FROM Ports_of_Call_Date";
	private static final String insertPortsOfCallDate = "insert into Ports_of_Call_date(Package_No,Port_of_Call_No,Departure_Time,Arrival_Time)"
			+ "values(?,?,?,?)";
	private static final String getByPackageNo="select * from Ports_of_Call_date WHERE Package_No=?";
	

	@Override
	public List<PortsOfCallDateVO> getAll() {

		List<PortsOfCallDateVO> list = new ArrayList<PortsOfCallDateVO>();
		PortsOfCallDateVO portsOfCallDateVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(getAllportsOfCallDate);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				portsOfCallDateVO = new PortsOfCallDateVO();
				portsOfCallDateVO.setPortsOfCallDateNo(rs.getInt("Ports_of_Call_date_No"));
				portsOfCallDateVO.setPackageNo(rs.getInt("Package_No"));
				portsOfCallDateVO.setPortOfCallNo(rs.getInt("Port_of_Call_No"));

				if (rs.getTimestamp("Departure_Time") != null) {
					portsOfCallDateVO.setDepartureTime(rs.getTimestamp("Departure_Time").toLocalDateTime());
				}
				if (rs.getTimestamp("Arrival_Time") != null) {
					portsOfCallDateVO.setArrivalTime(rs.getTimestamp("Arrival_Time").toLocalDateTime());
				}

				list.add(portsOfCallDateVO);

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

		return list;

	}

	@Override
	public void insertPortsOfCallDate(PortsOfCallDateVO portsOfCallDateVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(insertPortsOfCallDate);

			pstmt.setInt(1, portsOfCallDateVO.getPackageNo());
			pstmt.setInt(2, portsOfCallDateVO.getPortOfCallNo());

			if (portsOfCallDateVO.getDepartureTime() != null
					&& !"".equals(portsOfCallDateVO.getDepartureTime().toString().trim())) {
				pstmt.setTimestamp(3, Timestamp.valueOf(portsOfCallDateVO.getDepartureTime()));
			} else {
				pstmt.setTimestamp(3, null);
			}

			if (portsOfCallDateVO.getArrivalTime() != null
					&& !"".equals(portsOfCallDateVO.getArrivalTime().toString().trim())) {
				pstmt.setTimestamp(4, Timestamp.valueOf(portsOfCallDateVO.getArrivalTime()));
			} else {
				pstmt.setTimestamp(4, null);
			}

			pstmt.executeUpdate();

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
	public List<PortsOfCallDateVO> getByPackageNo(Integer packageNo) {
		List<PortsOfCallDateVO> list = new ArrayList<PortsOfCallDateVO>();
		PortsOfCallDateVO portsOfCallDateVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(getByPackageNo);
			pstmt.setInt(1,packageNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				portsOfCallDateVO = new PortsOfCallDateVO();
				portsOfCallDateVO.setPortsOfCallDateNo(rs.getInt("Ports_of_Call_date_No"));
				portsOfCallDateVO.setPackageNo(rs.getInt("Package_No"));
				portsOfCallDateVO.setPortOfCallNo(rs.getInt("Port_of_Call_No"));

				if (rs.getTimestamp("Departure_Time") != null) {
					portsOfCallDateVO.setDepartureTime(rs.getTimestamp("Departure_Time").toLocalDateTime());
				}
				if (rs.getTimestamp("Arrival_Time") != null) {
					portsOfCallDateVO.setArrivalTime(rs.getTimestamp("Arrival_Time").toLocalDateTime());
				}

				list.add(portsOfCallDateVO);

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

		return list;

	}
}
