package member;

import com.mysql.jdbc.Statement;

public class USignUp extends DBConnection {
	private String MId;
	private String MPw;
	private String MName;
	private String MPhoneNum;
	private String MEmail;
	private Statement stmt = null;
	public void signUp() {
		System.out.println(MId);
		System.out.println(MPw);
		System.out.println(MName);
		System.out.println(MPhoneNum);
		System.out.println(MEmail);
		//제대로 다 받아오고있음
		
		connect();
		System.out.println("접속된 conn객체 : " + getConn());
		disconnect();
		System.out.println("접속끝낸 conn객체: " + getConn());
		
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
