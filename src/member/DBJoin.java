package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBJoin {
	public Connection joinDB() {
		
		String url="jdbc:mysql://localhost/memberDB";
		Connection conn = null;
		
		try {
			conn = DriverManager.getConnection(url,"root","1234");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
}
