package products;

import java.sql.*;

import java.util.ArrayList;

import member.DBJoin;

public class PBlist extends DBJoin{
	private String Mid, Cname, PBname;
	private int PBprice;
	private ArrayList<PBlist> list = null;
	
	public String getMid() {
		return Mid;
	}
	public void setMid(String mid) {
		Mid = mid;
	}
	public String getCname() {
		return Cname;
	}
	public void setCname(String cname) {
		Cname = cname;
	}
	public String getPBname() {
		return PBname;
	}
	public void setPBname(String pBname) {
		PBname = pBname;
	}
	public int getPBprice() {
		return PBprice;
	}
	public void setPBprice(int pBprice) {
		PBprice = pBprice;
	}
	
	public ArrayList<PBlist> listUp(String Mid) {
		try {
			Statement stmt = joinDB().createStatement();
			ResultSet rs = stmt.executeQuery("select * from coo_productBuyTB where = '" + Mid + "';" );
			
			if(rs.next()) {
				list.add(this);
			}
		}
		catch(SQLException sqle) {
			sqle.printStackTrace();
		}
		return list;
	}
}
