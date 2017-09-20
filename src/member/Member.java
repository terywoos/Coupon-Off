package member;

import java.sql.*;

public class Member extends DBJoin{
	private String Cidx , Cpw , Cname , Cregion , Cphone , Cemail;

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

	public String getCname() {
		return Cname;
	}

	public void setCname(String cname) {
		Cname = cname;
	}

	public String getCregion() {
		return Cregion;
	}

	public void setCregion(String cregion) {
		Cregion = cregion;
	}

	public String getCphone() {
		return Cphone;
	}

	public void setCphone(String cphone) {
		Cphone = cphone;
	}

	public String getCemail() {
		return Cemail;
	}

	public void setCemail(String cemail) {
		Cemail = cemail;
	}
	
	public String memberOk(String Cidx, String Cpw, String Cname, String Cregion, String Cphone, String Cemail) {
		String Chek = null;
		try {
			PreparedStatement pstmt = joinDB().prepareStatement("insert into Coo_companyTB (Cidx,Cpw,Cname,Cregion,Cphone,Cemail) values (?,?,?,?,?,?)");
			
			pstmt.setString(1, Cidx);
			pstmt.setString(2, Cpw);
			pstmt.setString(3, Cname);
			pstmt.setString(4, Cregion);
			pstmt.setString(5, Cphone);
			pstmt.setString(6, Cemail);
			
			pstmt.executeUpdate();
			
			Chek = "Ok";
		
		}
		catch(SQLException sqle) {
			sqle.printStackTrace();
		}
		return Chek;
	}
}
