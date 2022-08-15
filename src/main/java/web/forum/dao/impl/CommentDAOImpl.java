package web.forum.dao.impl;

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

import web.forum.bean.CommentVO;
import web.forum.dao.CommentDAO;

public class CommentDAOImpl implements CommentDAO {

	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Pandora");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO Comment (Post_ID,Member_ID,Comment_Content,Comment_Time,Status) VALUES (?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT * FROM Comment";
	private static final String GET_ONE_STMT = "SELECT Post_ID,Member_ID,Comment_Content,Comment_Time,Status FROM forum where Comment_No = ?";
	private static final String DELETE = "DELETE FROM Comment where Comment_No = ?";
	private static final String UPDATE = "UPDATE Comment set Member_ID = ?, Comment_Content = ?, Comment_Time = ?, Status = ? where Post_Id = ?";

//			@Override
	@Override
	public void insert(CommentVO commentVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, commentVO.getPostId());
			pstmt.setInt(2, commentVO.getMemberId());
			pstmt.setString(3, commentVO.getCommentContent());
			pstmt.setTimestamp(4,
					commentVO.getCommentTime() != null ? Timestamp.valueOf(commentVO.getCommentTime()) : null);
			pstmt.setString(5, commentVO.getStatus());

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

//			@Override
	@Override
	public void update(CommentVO commentVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, commentVO.getPostId());
			pstmt.setInt(2, commentVO.getMemberId());
			pstmt.setString(3, commentVO.getCommentContent());
			pstmt.setTimestamp(4,
					commentVO.getCommentTime() != null ? Timestamp.valueOf(commentVO.getCommentTime()) : null);
			pstmt.setString(5, commentVO.getStatus());

			pstmt.setInt(6, commentVO.getCommentNo());

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

//			@Override
	@Override
	public void delete(Integer commentNo) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, commentNo);

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
	public CommentVO findByPrimaryKey(Integer commentNo) {

		CommentVO commentVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, commentNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				commentVO = new CommentVO();
				commentVO.setCommentNo(rs.getInt("Comment_No"));
				commentVO.setPostId(rs.getInt("Post_ID"));
				commentVO.setMemberId(rs.getInt("Member_ID"));
				commentVO.setCommentContent(rs.getString("Comment_Content"));
				commentVO.setCommentTime(rs.getTimestamp("Comment_Time").toLocalDateTime());

				commentVO.setStatus(rs.getString("Status"));

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
		return commentVO;

	}

	@Override
	public List<CommentVO> getAll() {
		List<CommentVO> list = new ArrayList<CommentVO>();
		CommentVO commentVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				commentVO = new CommentVO();
				commentVO.setCommentNo(rs.getInt("Comment_No"));
				commentVO.setPostId(rs.getInt("Post_ID"));
				commentVO.setMemberId(rs.getInt("Member_ID"));
				commentVO.setCommentContent(rs.getString("Comment_Content"));
				commentVO.setCommentTime(rs.getTimestamp("Comment_Time").toLocalDateTime());

				commentVO.setStatus(rs.getString("Status"));
				list.add(commentVO); // Store the row in the list
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
	public CommentVO selectByPostId(Integer postId) {
		try (
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(
					"select c.*, m.English_First_Name "
					+ "from Comment c join Member m on c.Member_ID = m.Member_ID "
					+ "where c.Post_ID = ?");
		) {
			pstmt.setInt(1, postId);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					CommentVO vo = new CommentVO();
					vo.setCommentNo(rs.getInt("Comment_No"));
					vo.setPostId(rs.getInt("Post_ID"));
					vo.setMemberId(rs.getInt("Member_ID"));
					vo.setCommentContent(rs.getString("Comment_Content"));
					vo.setCommentTime(rs.getTimestamp("Comment_Time").toLocalDateTime());
					vo.setStatus(rs.getString("Status"));
					vo.setEnglishFirstName(rs.getString("English_First_Name"));
					return vo;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
