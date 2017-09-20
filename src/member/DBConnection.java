package member;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private String url = "jdbc:mysql://localhost/CooDB";
	private String id = "root";
	private String pw="1q2w3e4r!";
	private Connection conn;
	public void connect() {
		try {
			Class.forName("com.jdbc.mysql.Driver");
			conn = DriverManager.getConnection(url,id,pw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void disconnect() {
		if(conn!=null) {
			try {
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	public Connection getConn() {
		return conn;
	}
}
