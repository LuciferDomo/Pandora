package web.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TestWritePackagesPicture {
	public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	public static final String URL = "jdbc:mysql://localhost:3306/Pandora?serverTimezone=Asia/Taipei";
	public static final String USER = "root";
	public static final String PASSWORD = "a2771234";
	private static final String SQL = "UPDATE Packages SET  Package_images = ? "
			+ "WHERE Package_No = ? ";
	public static void main(String[] args) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL);
			// 1. setBlob (JDBC 4.0 / JDK 6)
			InputStream package1 = getPictureStream("src/main/webapp/images/packagesImages/package1.jpeg");//相對位置
			pstmt.setBlob(1, package1);				
			pstmt.setInt(2, 1);
			pstmt.executeUpdate();
			package1.close();
			// 2. setBytes
			InputStream package2 = getPictureStream("src/main/webapp/images/packagesImages/package2.jpg");//相對位置
			pstmt.setBlob(1, package2);				
			pstmt.setInt(2, 2);
			pstmt.executeUpdate();
			package2.close();
			// 3. setBinaryStream
			InputStream package3 = getPictureStream("src/main/webapp/images/packagesImages/package3.webp");
			pstmt.setBinaryStream(1, package3);
			pstmt.setInt(2, 3);
			pstmt.executeUpdate();
			package3.close();
			// 4. setBytes
			byte[] package4 = getPictureByteArray("src/main/webapp/images/packagesImages/package4.jpeg");
			pstmt.setBytes(1, package4);
			pstmt.setInt(2, 4);
			pstmt.executeUpdate();
			// 5. setBytes
			byte[] package5 = getPictureByteArray("src/main/webapp/images/packagesImages/package5.jpeg");
			pstmt.setBytes(1, package4);
			pstmt.setInt(2, 5);
			pstmt.executeUpdate();
			// 6. setBytes
			byte[] package6 = getPictureByteArray("src/main/webapp/images/packagesImages/package6.jpg");
			pstmt.setBytes(1, package6);
			pstmt.setInt(2, 6);
			pstmt.executeUpdate();
			// 7. setBytes
			byte[] package7 = getPictureByteArray("src/main/webapp/images/packagesImages/package7.jpeg");
			pstmt.setBytes(1, package7);
			pstmt.setInt(2, 7);
			pstmt.executeUpdate();
			// 8. setBytes
			byte[] package8 = getPictureByteArray("src/main/webapp/images/packagesImages/package8.jpeg");
			pstmt.setBytes(1, package8);
			pstmt.setInt(2, 8);
			pstmt.executeUpdate();
			// 9. setBytes
			byte[] package9 = getPictureByteArray("src/main/webapp/images/packagesImages/package9.jpeg");
			pstmt.setBytes(1, package9);
			pstmt.setInt(2, 9);
			pstmt.executeUpdate();
			// 10. setBytes
			byte[] package10 = getPictureByteArray("src/main/webapp/images/packagesImages/package10.jpeg");
			pstmt.setBytes(1, package10);
			pstmt.setInt(2, 10);
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
