package Coupon;

import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Random;

import net.sourceforge.barbecue.Barcode;
import net.sourceforge.barbecue.BarcodeFactory;
import net.sourceforge.barbecue.BarcodeImageHandler;

public class IssueCoupon extends member.DBConnection{
	private String MId;
	private int Cnum;
	private String filePath;
	private String CPname;
	private String CPBarNum;
	private boolean isNew=true;
	
	private void makeNumber() {
		CPBarNum = "";
		Random rand = new Random();
		int min = 100;
		int max = 999;
		
		
		for(int i=0; i<3; i++) {
			int res = rand.nextInt(max-min+1) + min;
			if(i!=2) 
				CPBarNum += res + " ";
			else 
				CPBarNum += res;
		}
	}
	
	private void getBarcode() {
		//바코드 생성
		ArrayList<String> tempArr = new ArrayList<String>();
		String sql = "select CPbarNum from Coo_couponTB";
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = getConn().createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				tempArr.add(rs.getString("CPbarNum"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)
					rs.close();
			} catch(Exception e) {
				
			}
			
			try {
				if(stmt!=null) 
					stmt.close();
			} catch(Exception e) {
				
			}
		}
		
		do {
			makeNumber();
			for(int i=0; i<tempArr.size(); i++) {
				if(CPBarNum.equals(tempArr.get(i))) {
					isNew=false;
					break;
				}
			}
		} while(!isNew);
		
		Barcode bar =null;
		try {
			bar = BarcodeFactory.createCode128(CPBarNum);
			File file = new File("/Users/literature/documents/test.png");
			filePath = file.getPath();
			BarcodeImageHandler.savePNG(bar,file);
			System.out.println(filePath);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void issue() {
		//바코드 발행 + 바코드 디비에 저장
		connect();
		getBarcode();
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			stmt = getConn().createStatement();
			String searchQuery = "select Cname from coo_companyTB where Cnum="+ Cnum;
			String insertQuery = "insert into coo_couponTB (MId, Cnum, CPname,CPbarcode,CPbarNum) values(?,?,?,?,?)";
			pstmt = getConn().prepareStatement(insertQuery);
			rs = stmt.executeQuery(searchQuery);
			if(rs.next())
				CPname = rs.getString("Cname")+" 할인쿠폰";
			
			pstmt.setString(1, MId);
			pstmt.setInt(2, Cnum);
			pstmt.setString(3, CPname);
			pstmt.setString(4, filePath);
			pstmt.setString(5, CPBarNum);
			pstmt.executeUpdate();
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
			
			try {
				if(pstmt!=null) 
					pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			disconnect();
		}
	}


	public void setCnum(int cnum) {
		Cnum = cnum;
	}

	public void setMId(String mId) {
		MId = mId;
	}
}
