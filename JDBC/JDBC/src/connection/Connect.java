package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connect {
	public static Connection connect_to_db(String dbName, String user, String pass) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/" + dbName, user, pass);
			if(conn != null) {
				System.out.println("Connection is successful");
			}else {
				System.out.println("Connection is failed");
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return conn;
	}
}
