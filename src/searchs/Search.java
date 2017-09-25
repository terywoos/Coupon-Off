package searchs;

import java.sql.*;

import member.DBJoin;

public class Search extends DBJoin{
	private String MPhoneNum, MName, MId;
	public String getMId() {
		return MId;
	}

	private int MPoint;

	public int getMPoint() {
		return MPoint;
	}

	public String getMPhoneNum() {
		return MPhoneNum;
	}

	public void setMPhoneNum(String mPhoneNum) {
		MPhoneNum = mPhoneNum;
	}
	
	public String UserSearch(String MPhoneNum) {
		String chek = null;
		try {
			Statement stmt = joinDB().createStatement();
			ResultSet rs = stmt.executeQuery("select * from Coo_MemberTB where MPhoneNum = '" + MPhoneNum +"';");
			
			if(rs.next()) {
				this.MName = rs.getString("MName");
				this.MPoint = rs.getInt("MPoint");
				this.MId = rs.getString("MId");
				chek = "Ok";
			}
			else {
				chek = "No";
			}
			joinDB().close();
			stmt.close();
		}
		catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		return chek;
	}

	public String getMName() {
		return MName;
	}
}
