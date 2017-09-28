package member;

import java.sql.ResultSet;
import java.sql.Statement;

public class UIdChk extends DBConnection	{
	private String MId;
	private String Checked="accepted";
	
	public String check() {
		connect();
		ResultSet rs = null;
		Statement stmt = null;
		try {
			stmt = getConn().createStatement();
			rs = stmt.executeQuery("Select MId from Coo_memberTB");
			
			while(rs.next()) {
				if(MId.equals(rs.getString("MId")))
					Checked = "rejected";
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
		return Checked;
	}

	public void setMId(String mId) {
		MId = mId;
	}
}
