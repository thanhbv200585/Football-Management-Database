package query;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

import connection.Connect;

public class Search {
	private Connection conn;
	public Search(){}

	public Search(String dbName, String user, String password){
		this.conn = Connect.connect_to_db(dbName, user, password);
	}

	public void searchPlayerInfor(String name) throws Exception{
		// Connection conn = Connect.connect_to_db("football_management_system", "viewer1", "password1");
		String query = "select * from search_player_infor('" + name + "')";
		Statement statement = conn.createStatement();
		ResultSet rs = statement.executeQuery(query);
		ResultSetMetaData rsMetaData = rs.getMetaData();
		int count = rsMetaData.getColumnCount(); 
		while(rs.next()) {
			for(int i = 1; i <= count; i++) {
				System.out.print(rs.getString(rsMetaData.getColumnName(i)) + ' ');
			}
			System.out.println();
		}
	}

	public void searchPlayerShoot(String name) throws Exception{
		// Connection conn = Connect.connect_to_db("football_management_system", "viewer1", "password1");
		String query = "select * from search_player_shoot('" + name + "')";
		Statement statement = conn.createStatement();
		ResultSet rs = statement.executeQuery(query);
		ResultSetMetaData rsMetaData = rs.getMetaData();
		int count = rsMetaData.getColumnCount(); 
		while(rs.next()) {
			for(int i = 1; i <= count; i++) {
				System.out.print(rs.getString(rsMetaData.getColumnName(i)) + ' ');
			}
			System.out.println();
		}
	}
}
