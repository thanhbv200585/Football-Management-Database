package query;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.SQLException;

import connection.Connect;
import model.Stadium;

public class Insert {
	private Connection conn;

	public Insert(){}

	public Insert(String dbName, String user, String password){
		this.conn = Connect.connect_to_db(dbName, user, password);
	}
	
	public void insertStadiumInfor(Stadium stadium) throws SQLException {
		// Connection conn = Connect.connect_to_db("football_management_system", "team_leader1", "password5");
		Statement statement = conn.createStatement();
		String query = "select * from insert_stadium_infor('" + stadium.getTeam() + 
				"', '" + stadium.getName() + "', " + stadium.getCapacity() + ");";
		System.out.println(query);
		statement.executeUpdate(query);
		System.out.println("Data Updated!");
	}
}
