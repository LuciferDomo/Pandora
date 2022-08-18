package web.order.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import web.order.beam.OrderVO;
import web.order.dao.OrderDAO;

public class OrderDAOImpl implements OrderDAO {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Pandora");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO Pandora.Order (Member_ID, Package_No, Order_Time, Credit_Card_Type, Total_Amount, Discount_No, Price_After_Discount, Total_Number_of_People, Status) "
			+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String QUERYBYPK_STMT = "SELECT * FROM Pandora.ORDER WHERE ORDER_NO = ?";
	private static final String GET_MEMBER_ORDERS = "select po.Order_No, p.Departure_Time, p.Package_Name, po.Price_After_Discount, po.Status from Pandora.Order po join Packages p on po.Package_No = p.Package_No where po.Member_ID = ?";

	
	@Override
	public Integer insert(OrderVO orderVO) {
		Integer generatedKeys = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT, Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, orderVO.getMemberID());
			pstmt.setInt(2, orderVO.getPackageNo());
			pstmt.setTimestamp(3, Timestamp.valueOf(orderVO.getOrderTime()));
			pstmt.setString(4, orderVO.getCreditCardType());
			pstmt.setInt(5, orderVO.getTotalAmount());
			pstmt.setInt(6, orderVO.getDiscountNo());
			pstmt.setInt(7, orderVO.getPriceAfterDiscount());
			pstmt.setInt(8, orderVO.getTotalNumberOfPeople());
			pstmt.setString(9, orderVO.getStatus());

			pstmt.executeUpdate();

			rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				generatedKeys = rs.getInt(1);
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
		return generatedKeys;
	}

	@Override
	public void update(OrderVO orderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			// TODO Auto-generated method stub
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
	public void delete(Integer orderNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			// TODO Auto-generated method stub
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
	public OrderVO findByPrimaryKey(Integer orderNo) {
		OrderVO orderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(QUERYBYPK_STMT);
			pstmt.setInt(1, orderNo);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				orderVO = new OrderVO();
				orderVO.setCreditCardType(rs.getString("Credit_Card_Type"));
				orderVO.setDiscountNo(rs.getInt("Discount_No"));
				orderVO.setMemberID(rs.getInt("Member_ID"));
				orderVO.setOrderNo(rs.getInt("Order_No"));
				orderVO.setPackageNo(rs.getInt("Package_No"));
				orderVO.setPriceAfterDiscount(rs.getInt("Price_After_Discount"));
				orderVO.setTotalAmount(rs.getInt("Total_Amount"));
				orderVO.setStatus(rs.getString("Status"));
				orderVO.setTotalNumberOfPeople(rs.getInt("Total_Number_of_People"));
				if (rs.getDate("Order_Time") != null) {
					orderVO.setOrderTime(rs.getTimestamp("Order_Time").toLocalDateTime());
				}
				if (rs.getDate("Cancelation_Time") != null) {
					orderVO.setCancelationTime(rs.getTimestamp("Cancelation_Time").toLocalDateTime());
				}
			}
			// TODO Auto-generated method stub
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
		return orderVO;
	}

	@Override
	public List<OrderVO> getMemberOrders(Integer memberID) {
			
			List<OrderVO> orderVOList = new ArrayList<OrderVO>();
			OrderVO orderVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_MEMBER_ORDERS);
				pstmt.setInt(1, memberID);
				rs = pstmt.executeQuery();
			
				while (rs.next()) {
					orderVO = new OrderVO();
					orderVO.setOrderNo(rs.getInt("Order_No"));
					orderVO.setDepartureTime(rs.getTimestamp("Departure_Time").toLocalDateTime());
					orderVO.setPackageName(rs.getString("Package_Name"));
					orderVO.setPriceAfterDiscount(rs.getInt("Price_After_Discount"));
					orderVO.setStatus(rs.getString("Status"));
					orderVOList.add(orderVO);
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
			return orderVOList;

	}
}
