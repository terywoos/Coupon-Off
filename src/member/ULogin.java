package member;

import java.sql.ResultSet;
import java.sql.Statement;

public class ULogin extends DBConnection {
	private String MId;
	private String MPw;
	private String Result;
	
	public String login() {
		connect();
		ResultSet rs = null;
		Statement stmt = null;
		String pw="";
		String query = "select Mpw from coo_memberTB where MId='"+MId + "'";
		try {
			stmt = getConn().createStatement();
			rs = stmt.executeQuery(query);
			if(rs.next()) {
				pw = rs.getString("MPw");
				if(MPw.equals(pw))
					Result = "success";
				else 
					Result="nm";
			} else {
				Result="ne";
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) 
					rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			try {
				if(stmt!=null) 
					stmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			disconnect();
		}
		return Result;
	}
	
	public void setMId(String mId) {
		MId = mId;
	}
	
	public void setMPw(String mPw) {
		MPw = mPw;
	}

	
}
