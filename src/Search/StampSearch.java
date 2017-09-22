package Search;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class StampSearch extends member.DBConnection {
	private String text;
	private ArrayList<String> list = new ArrayList<String>();
	public  ArrayList<String> makeList() {
		connect();
		ResultSet rs = null;
		Statement stmt = null;
		list.clear();
		try {
			String query = "select MId from coo_memberTB where MId like '%"+text+"%'";
			stmt = getConn().createStatement();
			rs= stmt.executeQuery(query);
			
			while(rs.next()) {
				list.add(rs.getString("MId"));
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
				if(stmt!=null) {
					stmt.close();
				} 
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			disconnect();
		}
		return list;
	}
	
	public void setText(String text) {
		this.text = text;
	}
}
