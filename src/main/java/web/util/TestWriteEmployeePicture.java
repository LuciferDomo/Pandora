package web.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TestWriteEmployeePicture {
	public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	public static final String URL = "jdbc:mysql://localhost:3306/Pandora?serverTimezone=Asia/Taipei";
	public static final String USER = "root";
	public static final String PASSWORD = "a2771234";
	private static final String SQL = "UPDATE Employee SET  EMP_Picture_ID = ? "
			+ "WHERE Employee_ID = ? ";
	public static void main(String[] args) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL);
			// 1. setBlob (JDBC 4.0 / JDK 6)
			InputStream emp1 = getPictureStream("src/main/webapp/images/EmployeeImages/emp1.jpg");//相對位置
			pstmt.setBlob(1, emp1);				
			pstmt.setInt(2, 1);
			pstmt.executeUpdate();
			emp1.close();
			// 2. setBytes
			InputStream emp2 = getPictureStream("src/main/webapp/images/EmployeeImages/emp2.jpg");//相對位置
			pstmt.setBlob(1, emp2);				
			pstmt.setInt(2, 2);
			pstmt.executeUpdate();
			emp2.close();
			// 3. setBinaryStream
			InputStream emp3 = getPictureStream("src/main/webapp/images/EmployeeImages/emp3.jpg");
			pstmt.setBinaryStream(1, emp3 );
			pstmt.setInt(2, 3);
			pstmt.executeUpdate();
			emp3 .close();
			// 4. setBytes
			byte[] emp4 = getPictureByteArray("src/main/webapp/images/EmployeeImages/emp4.jpg");
			pstmt.setBytes(1, emp4);
			pstmt.setInt(2, 4);
			pstmt.executeUpdate();
			// 5. setBytes
			byte[] emp5 = getPictureByteArray("src/main/webapp/images/EmployeeImages/emp5.jpg");
			pstmt.setBytes(1, emp5);
			pstmt.setInt(2, 5);
			pstmt.executeUpdate();
			// 6. setBytes
			byte[] emp6 = getPictureByteArray("src/main/webapp/images/EmployeeImages/emp6.jpg");
			pstmt.setBytes(1, emp6);
			pstmt.setInt(2, 6);
			pstmt.executeUpdate();
			// 7. setBytes
			byte[] emp7 = getPictureByteArray("src/main/webapp/images/EmployeeImages/emp7.jpg");
			pstmt.setBytes(1, emp7);
			pstmt.setInt(2, 7);
			pstmt.executeUpdate();
			// 8. setBytes
			byte[] emp8 = getPictureByteArray("src/main/webapp/images/EmployeeImages/emp8.jpg");
			pstmt.setBytes(1, emp8);
			pstmt.setInt(2, 8);
			pstmt.executeUpdate();
			// 9. setBytes
			byte[] emp9 = getPictureByteArray("src/main/webapp/images/EmployeeImages/emp9.jpg");
			pstmt.setBytes(1, emp9);
			pstmt.setInt(2, 9);
			pstmt.executeUpdate();
			// 10. setBytes
			byte[] emp10 = getPictureByteArray("src/main/webapp/images/EmployeeImages/emp10.jpg");
			pstmt.setBytes(1, emp10);
			pstmt.setInt(2, 10);
			pstmt.executeUpdate();
			// 11. setBytes
			byte[] emp11 = getPictureByteArray("src/main/webapp/images/EmployeeImages/emp11.jpg");
			pstmt.setBytes(1, emp11);
			pstmt.setInt(2, 11);
			pstmt.executeUpdate();
			System.out.println("新增成功");
		} catch (ClassNotFoundException ce) {
			System.out.println(ce);
		} catch (SQLException se) {
			System.out.println(se);
		} catch (IOException ie) {
			System.out.println(ie);
		} finally {
			// 依建立順序關閉資源 (越晚建立越早關閉)
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}
		}
	}
	// 使用InputStream資料流方式
	public static InputStream getPictureStream(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		return fis;
	}
	// 使用byte[]方式
	public static byte[] getPictureByteArray(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		byte[] buffer = new byte[fis.available()];
		fis.read(buffer);
		fis.close();
		return buffer;
	}
}
