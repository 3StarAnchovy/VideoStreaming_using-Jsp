package likey;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LikeyDAO {

	private Connection conn;
	public LikeyDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/likeyoutube?serverTimezone=UTC&useSSL=false";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	public int like(String userID, String userWriteTitle, String userIP) {
		// ID,WriteTitle pk,nn이므로 중복이 안됨
		// 따봉 db 업로드
		String SQL = "INSERT INTO LIKEY VALUES (?, ?, ?)";
		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userWriteTitle);
			pstmt.setString(3, userIP);

			return pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return -1; 
	}
	
}