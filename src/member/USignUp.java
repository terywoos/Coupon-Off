package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class USignUp extends DBConnection {
	private String MId;
	private String MPw;
	private String MName;
	private String MPhoneNum;
	private String MEmail;
	private Statement stmt = null;

	public void signUp() {
		//회원가입처리부
		connect();
		try {
			stmt = getConn().createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
