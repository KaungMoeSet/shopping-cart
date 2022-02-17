package com.kaung.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private static Connection connection = null;
	static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if (connection == null) {
			Class.forName("com.mysql.cj.jdbc.Driver");

			connection = DriverManager.getConnection(DB_URL, "root", "Kaung2000@");
			System.out.println("Connected");
		}
		return connection;
	}
}
