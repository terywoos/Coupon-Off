package Search;

import java.sql.PreparedStatement;
import java.util.ArrayList;

public class Stamp extends member.DBConnection{
	private String MId;
	private String CName;
	private int SCount;
	private int CNum;
	
	public void makeStamp(String id, int num) {
		PreparedStatement pstmt = null;
		String sql = "insert into coo_stamptb (MId,Cnum) values (?,?)";
		try {
			connect();
			pstmt = getConn().prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)
					pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			disconnect();
		}
	}
	
	public ArrayList<Stamp> getAllStamps(String text, ArrayList<Stamp> list) {
		ArrayList<Stamp> temp = new ArrayList<Stamp>();
		
		for(int i=0; i<list.size(); i++) {
	 		Stamp sTemp = list.get(i);
	 		String CName = sTemp.getCName();
	 		if(CName.contains(text)) {
	 			temp.add(sTemp);
	 		}
	 	}
		
		return temp;
	}
	
	public String getCName() {
		return CName;
	}
	public void setCName(String cName) {
		CName = cName;
	}
	public int getSCount() {
		return SCount;
	}
	public void setSCount(int sCount) {
		SCount = sCount;
	}

	public int getCNum() {
		return CNum;
	}

	public void setCNum(int cNum) {
		CNum = cNum;
	}

	public void setMId(String mId) {
		MId = mId;
	}
	
}
