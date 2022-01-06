package com.babyboy.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection connection = null;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if(connection == null) {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String dbName = "ecommerce_cart";
			String userName = "root";
			String password = "1234";
			
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbName, userName, password);
			System.out.println("Connected");
		}
		return connection;
	}
}
