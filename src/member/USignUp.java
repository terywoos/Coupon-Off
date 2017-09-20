package member;

public class USignUp {
	private String MId;
	private String MPw;
	private String MName;
	private String MPhoneNum;
	private String MEmail;
	
	public void signUp() {
		System.out.println(MId);
		System.out.println(MPw);
		System.out.println(MName);
		System.out.println(MPhoneNum);
		System.out.println(MEmail);
		//제대로 다 받아오고있음
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
