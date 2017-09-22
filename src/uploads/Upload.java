package uploads;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import member.DBJoin;

public class Upload extends DBJoin{
	String cNum;
	String pIdx;
	String pName;
	String pPrice;
	String imgUrl;

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
	
	public String setRegister(String cnum, String idx, String name, String price, String imgUrl) {
		String registed = null;
		
		//SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		try {
			PreparedStatement pstmt = joinDB().prepareStatement("insert into members(Cnum,Pidx,Pname,Pprice) values(?,?,?,?)");
			pstmt.setString(1, cnum);			
			pstmt.setString(2, idx);
			pstmt.setString(3, name);
			pstmt.setString(4, price);

			
			pstmt.executeUpdate();
			
			registed = "ok";
		}
		catch(SQLException sqle) {
			System.out.println(sqle);
		}
		return registed;
		
	}
}
