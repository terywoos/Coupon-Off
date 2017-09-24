package member;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Search.Stamp;

public class ULogin extends DBConnection {
	private String MId;
	private String MPw;
	private int Result;
	private ArrayList<Stamp> Stamps=new ArrayList<Stamp>();
	
	public int login() {
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
				if(MPw.equals(pw)) {
					Result = 1;
					//성공
					searchStamps();
				}	else { 
					Result=2; 
					//일치하지않음
				}
			} else {
				Result=3;
				//아이디없음
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
	public void searchStamps() {
		Stamps.clear();
		ResultSet rs2 = null;
		Statement stmt2 = null;
		String query2 = "select a.SCount, a.Cnum, b.Cname from coo_stampTB a inner join coo_companyTB b on a.Cnum=b.Cnum where Mid='"+MId+"'";
		try {
			stmt2 = getConn().createStatement();
			rs2 = stmt2.executeQuery(query2);
			while(rs2.next()) {
				Stamp temp = new Stamp();
				temp.setCName(rs2.getString("Cname"));
				temp.setSCount(rs2.getInt("SCount"));
				temp.setCNum(rs2.getInt("Cnum"));
				Stamps.add(temp);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs2!=null)
					rs2.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(stmt2!=null)
					stmt2.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	public void setMId(String mId) {
		MId = mId;
	}
	
	public void setMPw(String mPw) {
		MPw = mPw;
	}
	public ArrayList<Stamp> getStamps() {
		return Stamps;
	}
	

	
}
