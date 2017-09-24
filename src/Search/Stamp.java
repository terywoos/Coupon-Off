package Search;

import java.util.ArrayList;

public class Stamp {
	private String CName;
	private int SCount;
	private int CNum;
	
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
	
}
