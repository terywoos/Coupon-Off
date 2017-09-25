package member;
import java.sql.ResultSet;
import java.sql.Statement;
public class UStamp extends DBConnection {
	private int Mnum;
	private int Scount;
	public int stamp() {
		connect();
		ResultSet rs = null;
		Statement stmt = null;
		String query = "select Scount from coo_stemptb where Mnum='"+Mnum+"'";
		try {
			stmt = getConn().createStatement();
			rs = stmt.executeQuery(query);
			if(rs.next()) {
				Scount = rs.getInt("Scount");
				
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(rs !=null)
					rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			disconnect();
		}
		return Scount;
	}
}
