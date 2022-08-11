package web.packages.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import web.packages.bean.PackagesVO;
import web.packages.dao.PackagesDAO;
import web.util.packages_CompositeQuery;

public class PackagesDAOImpl implements PackagesDAO{

	private static DataSource ds = null;
	
	private static final String GET_ONE_STMT = "SELECT * FROM Packages where Package_No = ?";
	
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Pandora");
			
		}catch (NamingException e) {
			e.printStackTrace();
		}
	}

	
	
	@Override
	public List<PackagesVO> getAll(Map<String, String[]> map) {
		List<PackagesVO> list = new ArrayList<PackagesVO>();
		PackagesVO packagesVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			con = ds.getConnection();
			String finalSQL = "select * from Packages "
		          + packages_CompositeQuery.get_WhereCondition(map)
		          + "order by Package_No";
			pstmt = con.prepareStatement(finalSQL);
			System.out.println("●●finalSQL(by DAO) = "+finalSQL);
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
			}catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
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

}
