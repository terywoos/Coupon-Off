package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class USignUp extends DBConnection {
	private String MId;
	private String MPw;
	private String MName;
	private String MPhoneNum;
	private String MEmail;

	public void signUp() {
		//회원가입처리부
		connect();
		//연결
		PreparedStatement pstmt = null;
		String query ="insert into coo_memberTB (MId,MPw,MName,MPhoneNum,MEmail) values(?,?,?,?,?)";
		try {
			pstmt = getConn().prepareStatement(query);
			pstmt.setString(1, MId);
			pstmt.setString(2,MPw);
			pstmt.setString(3, MName);
			pstmt.setString(4, MPhoneNum);
			pstmt.setString(5,MEmail);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		
	
	public void setMId(String mId) {
		MId = mId;
	}
	public void setMPw(String mPw) {
		MPw = mPw;
	}
	public void setMName(String mName) {
		MName = mName;
	}
	public void setMPhoneNum(String mPhoneNum) {
		MPhoneNum = mPhoneNum;
	}
	public void setMEmail(String mEmail) {
		MEmail = mEmail;
	}
	
	
}
