package products;

import java.sql.*;

import java.util.ArrayList;

import member.DBJoin;

public class PBlist extends DBJoin{
	private String MId, Cname, PBname;
	private int PBprice;
	private ArrayList<PBlist> list = null;
	
	public String getMId() {
		return MId;
	}
	public String getCname() {
		return Cname;
	}
	public String getPBname() {
		return PBname;
	}
	public int getPBprice() {
		return PBprice;
	}
	
	public ResultSet PastList(String MId , String Cname) {
		ResultSet rs = null;
		try {
			Statement stmt = joinDB().createStatement();
			
			rs = stmt.executeQuery("select * from Coo_productButTB where Mid ='" + MId + "' and Cname ='" + Cname + "' order by PBregdate desc;");
		}
	}
}
