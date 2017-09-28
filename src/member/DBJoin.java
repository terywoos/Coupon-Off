package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBJoin {
	
	public Connection joinDB() {

		String url="jdbc:mysql://localhost/CooDB";
		Connection conn = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url,"root","1q2w3e4r!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
	
}
