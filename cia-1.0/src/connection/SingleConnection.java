package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnection {
	
	private static String banco = "jdbc:mysql://localhost:3306/cia?autoReconnect=true";
	private static String user = "root";
	private static String pass = "Wget";
	private static Connection conn = null;

	public SingleConnection() {
		conectar();
	}

	private static void conectar() {

		try {
			if (conn == null) {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(banco, user, pass);
				conn.setAutoCommit(false);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static Connection getConnection() {

		return conn;
	}

	static {
		conectar();
	}

}
