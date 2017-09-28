 package member;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private String Driver = "com.mysql.jdbc.Driver";
	private final String URL = "jdbc:mysql://localhost/CooDB";
	private final String ID = "root";
	private final String PW = "1234";
	private Connection conn = null;
	
	public void connect() {
		try {
			Class.forName(Driver);
			conn = DriverManager.getConnection(URL, ID, PW);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void disconnect() {
		try {
			if(conn!=null) 
				conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getConn() {
		return conn;
	}
	
	
	
}
