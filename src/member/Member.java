package member;

import java.sql.*;

public class Member extends DBJoin{
	private String Cidx , Cpw , Cname , Cregion , Cphone , Cemail,Cintro,Clogo;
	private int Cnum;

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
	public String getCintro() {
		return Cintro;
	}

	public void setCintro(String cintro) {
		Cintro = cintro;
	}

	public String getClogo() {
		return Clogo;
	}

	public void setClogo(String clogo) {
		Clogo = clogo;
	}
	
	public String memberOk(String Cidx, String Cpw, String Cname, String Cregion, String Cphone, String Cemail, String Cintro) {
		String Chek = null;
		try {
			PreparedStatement pstmt = joinDB().prepareStatement("insert into Coo_companyTB (Cidx,Cpw,Cname,Cregion,Cphone,Cemail,Cintro) values (?,?,?,?,?,?,?)");
			
			pstmt.setString(1, Cidx);
			pstmt.setString(2, Cpw);
			pstmt.setString(3, Cname);
			pstmt.setString(4, Cregion);
			pstmt.setString(5, Cphone);
			pstmt.setString(6, Cemail);
			pstmt.setString(7, Cintro);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			Statement stmt = joinDB().createStatement();
			
			ResultSet rs = stmt.executeQuery("select Cnum from Coo_companyTB where Cidx='"+Cidx+"'");
			
			if(rs.next()) {
				Cnum = rs.getInt("Cnum");
				System.out.println("Cnum =>"+Cnum);
			}

			Chek = "ok";
		
		}
		catch(SQLException sqle) {
			sqle.printStackTrace();
		}
		return Chek;
	}
	
	public String setRegistImg(String imgUrl) {
		String imgReged = null;
		
		//SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		//UUID uid = UUID.randomUUID();
		
		try {
			PreparedStatement pstmt = joinDB().prepareStatement("insert into Coo_companyImgTB(Cnum,CIname) values(?,?)");
			pstmt.setInt(1, Cnum);			
			pstmt.setString(2, imgUrl);
			
			System.out.println("cNum =>"+Cnum+" imgUrl =>"+imgUrl);
			
			pstmt.executeUpdate();
			
			imgReged = "ok";
		}
		catch(SQLException sqle) {
			System.out.println(sqle);
		}
		return imgReged;
	}
	
}
