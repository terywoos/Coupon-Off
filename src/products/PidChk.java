package products;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import member.DBJoin;


public class PidChk extends DBJoin{
	
	private String Pidx;
	private String chked = null;
		
	public String getPIdx() {
		return Pidx;
	}

	public void setPIdx(String Pidx) {
		this.Pidx = Pidx;
	}
	
	public String idCheck(String Pidx, String Cidx){
		
		try {

			Statement stmt = joinDB().createStatement();
			ResultSet rs = stmt.executeQuery("select * from Coo_productTB a where Pidx ='" + Pidx + "' and a.Cnum = (select b.Cnum from Coo_companyTB b where b.Cidx = '"+Cidx+"')");
			
			
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
