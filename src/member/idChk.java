package member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class idChk extends DBJoin{
	
	private String Cidx;
	private String chked = null;
		
	public String getCIdx() {
		return Cidx;
	}

	public void setCIdx(String Cidx) {
		this.Cidx = Cidx;
	}
	
	public String idCheck(String Cidx){
		
		try {

			Statement stmt = joinDB().createStatement();
			ResultSet rs = stmt.executeQuery("select * from Coo_companyTB where Cidx ='" + Cidx + "';");
			
			
			if(rs.next()){
				chked = "yes";
			}else{
				chked = "no";
			}

		}
		catch(SQLException sqle) {
			System.out.println(sqle);
		}
		
		return chked;
	}
}
