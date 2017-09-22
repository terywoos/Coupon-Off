package uploads;

import java.util.UUID;

public class UploadUtil {
	public String nameMaker(String imgUrl) {
		String saveName = null;
		UUID uid = UUID.randomUUID();
		try {
			System.out.println("aaaaa"+uid.toString());
			saveName = uid.toString()+"_"+imgUrl;

		}catch(NullPointerException npe) {
			npe.printStackTrace();
		}
		
		return saveName;
	}
}
