package query;

import java.sql.Statement;
import java.sql.Connection;

public class Delete {
	public Delete() {}
	
	public void deleteStadiumInfor(Connection conn, String stadiumName) {
		try {
			String query = "select * from delete_stadium_infor('" + stadiumName + "');";
			Statement statement = conn.createStatement();
			statement.executeUpdate(query);			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}		
	}
}
