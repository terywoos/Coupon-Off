package Coupon;

import java.util.Date;

public class Coupon {
	private int CPnum;
	private String CPname;
	private Date CPregdate;
	private Date CPexpire;
	private String CPbarcode;
	public int getCPnum() {
		return CPnum;
	}
	public void setCPnum(int cPnum) {
		CPnum = cPnum;
	}
	public String getCPname() {
		return CPname;
	}
	public void setCPname(String cPname) {
		CPname = cPname;
	}
	public Date getCPregdate() {
		return CPregdate;
	}
	public void setCPregdate(Date cPregdate) {
		CPregdate = cPregdate;
	}
	public Date getCPexpire() {
		return CPexpire;
	}
	public void setCPexpire(Date cPexpire) {
		CPexpire = cPexpire;
	}
	public String getCPbarcode() {
		return CPbarcode;
	}
	public void setCPbarcode(String cPbarcode) {
		CPbarcode = cPbarcode;
	}
	
}
