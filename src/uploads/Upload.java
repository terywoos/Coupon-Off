package uploads;

import java.sql.*;
import java.sql.SQLException;
import java.util.UUID;

import member.DBJoin;

public class Upload extends DBJoin{
	String cNum;
	String pIdx;
	String pName;
	String pPrice;
	String imgUrl;
	int pNum;
	
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public String getcNum() {
		return cNum;
	}
	public void setcNum(String cNum) {
		this.cNum = cNum;
	}
	public String getpIdx() {
		return pIdx;
	}
	public String getpName() {
		return pName;
	}
	public String getpPrice() {
		return pPrice;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setpIdx(String pIdx) {
		this.pIdx = pIdx;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	public String setRegister(int cnum, String idx, String name, String price) throws SQLException {
		String registed = null;
		
		//SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		try {
			PreparedStatement pstmt = joinDB().prepareStatement("insert into Coo_productTB(Cnum,Pidx,Pname,Pprice) values(?,?,?,?)");
			pstmt.setInt(1, cnum);			
			pstmt.setString(2, idx);
			pstmt.setString(3, name);
			pstmt.setString(4, price);
			pstmt.executeUpdate();

			System.out.println(cnum+" "+idx+" "+name+" "+price);
			pstmt.close();
			
			Statement stmt = joinDB().createStatement();
			
			ResultSet rs = stmt.executeQuery("select Pnum from Coo_productTB where Pidx='"+idx+"'");
			
			if(rs.next()) {
				pNum = rs.getInt("Pnum");
				System.out.println("pNum =>"+pNum);
			}
			
			registed = "ok";
		}
		catch(SQLException sqle) {
			System.out.println(sqle);
		}finally {
			joinDB().close();
		}
		return registed;
	}
	
	public String setRegistImg(String imgUrl) {
		String imgReged = null;
		
		//SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		//UUID uid = UUID.randomUUID();
		
		try {
			PreparedStatement pstmt = joinDB().prepareStatement("insert into Coo_productImgTB(Pnum,PIname) values(?,?)");
			pstmt.setInt(1, pNum);			
			pstmt.setString(2, imgUrl);
			
			System.out.println("pNum =>"+pNum+" imgUrl =>"+imgUrl);
			
			pstmt.executeUpdate();
			
			imgReged = "ok";
		}
		catch(SQLException sqle) {
			System.out.println(sqle);
		}
		return imgReged;
	}

}
