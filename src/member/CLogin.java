package member;

import java.sql.*;

public class CLogin extends DBJoin{
	private String Cidx , Cpw;
	private int Cnum;

	public int getCnum() {
		return Cnum;
	}

	public String getCidx() {
		return Cidx;
	}

	public void setCidx(String cidx) {
		Cidx = cidx;
	}

	public String getCpw() {
		return Cpw;
	}

	public void setCpw(String cpw) {
		Cpw = cpw;
	}
	
	public String CLogins(String Cidx, String Cpw) {
		String Chek = null;
		
		try {
			Statement stmt = joinDB().createStatement();
			ResultSet rs = stmt.executeQuery("select * from Coo_companyTB where Cidx = '" + Cidx + "';");
			
			if(rs.next()) {
				this.Cnum = rs.getInt("Cnum");
				String id = rs.getString("Cidx");
				String pw = rs.getString("Cpw");

				
				if(id.equals(Cidx) && pw.equals(Cpw)) {
					Chek = "Ok";
				}
				else {
					Chek = "No";
				}
			}
			else {
				Chek = "No";
			}
			
			joinDB().close();
			stmt.close();
		}
		catch(SQLException sqle) {
			sqle.printStackTrace();
		}
		return Chek;
	}

}
