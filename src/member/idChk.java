package member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class idChk extends DBJoin{
	
	private String idx;
	private String chked = null;
		
	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}
	
	public String idCheck(String idx){
		
		try {

			Statement stmt = joinDB().createStatement();
			ResultSet rs = stmt.executeQuery("select * from members where idx ='"+idx+"'");
			
			
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
