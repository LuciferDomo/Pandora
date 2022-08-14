package web.packages.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.metamodel.SetAttribute;

import web.emp.bean.EmpVO;
import web.packages.bean.PackagesVO;
import web.packages.bean.PortsOfCallDateVO;
import web.packages.dao.PackagesDAO;
import web.port.bean.PortVO;
import web.util.packages_CompositeQuery;

public class PackagesDAOImpl implements PackagesDAO {

	private static DataSource ds = null;

	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Pandora");

		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String getALLList = "select * from Packages ";
	private static final String GET_ONE_STMT = "SELECT * FROM Packages where Package_No = ?";
	private static final String insertPackage = "insert into Packages(Package_Name,Package_images,Ship_No,Cruise_Line_No,Duration,Registration_Start_Time,Registration_Dead_Time,Departure,Destination,Departure_Time,Arrival_Time)"
			+ "values(?,?,?,?,?,?,?,?,?,?,?)";
	private static final String getPortName = "Select Port_Name from Port Where Port_of_Call_No=?";

	@Override
	public List<PackagesVO> getAll(Map<String, String[]> map) {
		List<PackagesVO> list = new ArrayList<PackagesVO>();
		PackagesVO packagesVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			con = ds.getConnection();
			String finalSQL = "select * from Packages " + packages_CompositeQuery.get_WhereCondition(map)
					+ "order by Package_No";
			pstmt = con.prepareStatement(finalSQL);
			System.out.println("●●finalSQL(by DAO) = " + finalSQL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				packagesVO = new PackagesVO();
				packagesVO.setPackageNo(rs.getInt("Package_No"));
				packagesVO.setPackageName(rs.getString("Package_Name"));
				packagesVO.setPackageImages(rs.getBytes("Package_images"));
				packagesVO.setShipNo(rs.getInt("Ship_No"));
				packagesVO.setCruiseLineNo(rs.getInt("Cruise_Line_No"));
				packagesVO.setDuration(rs.getInt("Duration"));
				packagesVO.setRegistrationStartTime(rs.getDate("Registration_Start_Time").toLocalDate());
				packagesVO.setRegistrationDeadTime(rs.getDate("Registration_Dead_Time").toLocalDate());
				packagesVO.setDeparture(rs.getString("Departure"));
				packagesVO.setDestination(rs.getString("Destination"));
				packagesVO.setDepartureTime(rs.getTimestamp("Departure_Time").toLocalDateTime());
				packagesVO.setArrivalTime(rs.getTimestamp("Arrival_Time").toLocalDateTime());

				list.add(packagesVO);

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
	public List<PackagesVO> getALLList() {
		List<PackagesVO> list = new ArrayList<PackagesVO>();
		PackagesVO packagesVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(getALLList);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				packagesVO = new PackagesVO();
				packagesVO.setPackageNo(rs.getInt("Package_No"));
				packagesVO.setPackageName(rs.getString("Package_Name"));
				packagesVO.setPackageImages(rs.getBytes("Package_images"));
				packagesVO.setShipNo(rs.getInt("Ship_No"));
				packagesVO.setCruiseLineNo(rs.getInt("Cruise_Line_No"));
				packagesVO.setDuration(rs.getInt("Duration"));
				packagesVO.setRegistrationStartTime(rs.getDate("Registration_Start_Time").toLocalDate());
				packagesVO.setRegistrationDeadTime(rs.getDate("Registration_Dead_Time").toLocalDate());
				packagesVO.setDeparture(rs.getString("Departure"));
				packagesVO.setDestination(rs.getString("Destination"));
				packagesVO.setDepartureTime(rs.getTimestamp("Departure_Time").toLocalDateTime());
				packagesVO.setArrivalTime(rs.getTimestamp("Arrival_Time").toLocalDateTime());

				list.add(packagesVO);

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
	public PackagesVO findByPrimaryKey(Integer packageId) {
		PackagesVO packagesVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, packageId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				packagesVO = new PackagesVO();
				packagesVO.setPackageNo(rs.getInt("Package_No"));
				packagesVO.setPackageName(rs.getString("Package_Name"));
				packagesVO.setPackageImages(rs.getBytes("Package_images"));
				packagesVO.setShipNo(rs.getInt("Ship_No"));
				packagesVO.setCruiseLineNo(rs.getInt("Cruise_Line_No"));
				packagesVO.setDuration(rs.getInt("Duration"));
				packagesVO.setRegistrationStartTime(rs.getDate("Registration_Start_Time").toLocalDate());
				packagesVO.setRegistrationDeadTime(rs.getDate("Registration_Dead_Time").toLocalDate());
				packagesVO.setDeparture(rs.getString("Departure"));
				packagesVO.setDestination(rs.getString("Destination"));
				packagesVO.setDepartureTime(rs.getTimestamp("Departure_Time").toLocalDateTime());
				packagesVO.setArrivalTime(rs.getTimestamp("Arrival_Time").toLocalDateTime());
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
		return packagesVO;
	}

	@Override
	public PackagesVO insertPackage(PackagesVO packagesVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(insertPackage, Statement.RETURN_GENERATED_KEYS);

			pstmt.setString(1, packagesVO.getPackageName());
			pstmt.setBytes(2, packagesVO.getPackageImages());
			pstmt.setInt(3, packagesVO.getShipNo());
			pstmt.setInt(4, packagesVO.getCruiseLineNo());
			pstmt.setInt(5, packagesVO.getDuration());
			pstmt.setDate(6, Date.valueOf(packagesVO.getRegistrationStartTime()));
			pstmt.setDate(7, Date.valueOf(packagesVO.getRegistrationDeadTime()));
			pstmt.setString(8, packagesVO.getDeparture());
			pstmt.setString(9, packagesVO.getDestination());
			pstmt.setTimestamp(10, Timestamp.valueOf(packagesVO.getDepartureTime()));
			pstmt.setTimestamp(11, Timestamp.valueOf(packagesVO.getArrivalTime()));

			pstmt.executeUpdate();

			ResultSet rs = pstmt.getGeneratedKeys();
			rs.next();
			int id = rs.getInt(1);
			System.out.println("這是自增主鍵在DAO" + id);

			packagesVO.setPackageNo(id);

			return packagesVO;
		} catch (SQLException se) {
			se.printStackTrace();
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
	public String getPortName(Integer portOfCallNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String portName = "";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(getPortName);
			pstmt.setInt(1, portOfCallNo);
			ResultSet rs = pstmt.executeQuery();
					
			while(rs.next()) {
				portName=rs.getString(1);
			}
				
			
			
			
		} catch (SQLException se) {
			se.printStackTrace();
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
		return portName;

	}
}
