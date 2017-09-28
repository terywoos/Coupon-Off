package member;

import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import Coupon.Coupon;
import Search.Stamp;

public class ULogin extends DBConnection {
	private String MId;
	private String MPw;
	private int Result;
	private ArrayList<Stamp> Stamps=new ArrayList<Stamp>();
	private ArrayList<Coupon> Coupons = new ArrayList<Coupon>();
	
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
					//�꽦怨�
					getAllStamps();
					getAllCoupons();
				}	else { 
					Result=2; 
					//�씪移섑븯吏��븡�쓬
				}
			} else {
				Result=3;
				//�븘�씠�뵒�뾾�쓬
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
	private void getAllStamps() {
		Stamps.clear();
		ResultSet rs2 = null;
		Statement stmt2 = null;
		String query2 = "select a.SCount, a.Cnum, b.Cname, b.Clogo, b.Cintro from coo_stampTB a inner join coo_companyTB b on a.Cnum=b.Cnum where Mid='"+MId+"'";
		try {
			stmt2 = getConn().createStatement();
			rs2 = stmt2.executeQuery(query2);
			while(rs2.next()) {
				Stamp temp = new Stamp();
				temp.setCName(rs2.getString("Cname"));
				temp.setSCount(rs2.getInt("SCount"));
				temp.setCNum(rs2.getInt("Cnum"));
				temp.setClogo(rs2.getString("Clogo"));
				temp.setCintro(rs2.getString("Cintro"));
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
	
	private void getAllCoupons() {
		Coupons.clear();
		ResultSet rs3 = null;
		Statement stmt3 = null;
		String query3 = "select CPnum, CPname, CPregdate,CPexpire,CPbarcode from coo_couponTB where Mid='"+MId+"' order by CPnum desc";
		try {
			stmt3 = getConn().createStatement();
			rs3 = stmt3.executeQuery(query3);
			while(rs3.next()) {
				Coupon temp = new Coupon();
				temp.setCPnum(rs3.getInt("CPnum"));
				temp.setCPname(rs3.getString("CPname"));
				temp.setCPregdate(rs3.getTimestamp("CPregdate"));
				temp.setCPexpire(rs3.getTimestamp("CPexpire"));
				temp.setCPbarcode(rs3.getString("CPbarcode")); 
				Coupons.add(temp);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs3!=null)
					rs3.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(stmt3!=null)
					stmt3.close();
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
	public ArrayList<Coupon> getCoupons() {
		return Coupons;
	}
	

	
}
