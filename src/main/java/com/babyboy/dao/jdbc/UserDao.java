//package com.babyboy.dao.jdbc;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//
//import com.babyboy.model.User;
//
//public class UserDao {
//	private Connection connection;
//	private String query;
//	private PreparedStatement pst;
//	private ResultSet res;
//	
//	public UserDao(Connection con) {
//		this.connection = con;
//	}
//	
//	public User userLogin(String email, String password) {
//		User user = null;
//		try {
//			query = "select * from users where email = ? and password = ?";
//			pst = this.connection.prepareStatement(query);
//			pst.setString(1, email);
//			pst.setString(2, password);
//			
//			res = pst.executeQuery();
//			
//			while(res.next()) {
//				user = new User();
//				user.setEmail(res.getString("email"));
//				user.setId(res.getInt("id"));
//				user.setName(res.getNString("name"));
////				user.setPassword(res.getString("password"));
//			}
//		} catch(Exception e) {
//			e.printStackTrace();
//			System.out.println(e.getMessage());
//		}
//		return user;
//	}
//}
