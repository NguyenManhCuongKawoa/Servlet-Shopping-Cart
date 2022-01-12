//package com.babyboy.dao.jdbc;
//
//import java.sql.Connection;
//import java.sql.Date;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//import com.babyboy.connection.DBConnection;
//import com.babyboy.model.Order;
//
//public class OrderDao {
//	private Connection connection;
//	private String query;
//	private PreparedStatement pst;
//	private ResultSet res;
//	
//	public OrderDao(Connection con) {
//		this.connection = con;
//	}
//	
//	public boolean addOrder(Order o) {
//		try {
//			query = "insert into orders(p_id, u_id, o_quantity, o_date) values(?, ?, ?, ?)";
//			pst = this.connection.prepareStatement(query);
////			pst.setInt(1, o.getProduct().getId());
//			pst.setInt(2, o.getU_id());
//			pst.setInt(3, o.getO_quantity());
//			pst.setDate(4, new Date(o.getO_date().getTime()));			
//			int res = pst.executeUpdate();
//			
//			return res > 0;
//			
//		} catch(Exception e) {
//			e.printStackTrace();
//			System.out.println(e.getMessage());
//		}
//		return false;
//	}
//	
//	public List<Order> getOrdersByUserId(int uId) {
//		List<Order> orders = new ArrayList<Order>();
//		try {
//			query = "select * from orders where u_id=?";
//			pst = this.connection.prepareStatement(query);
//			pst.setInt(1, uId);
//			
//			res = pst.executeQuery();
//			
//			ProductDao pDao = null;
//			try {
//				pDao = new ProductDao(DBConnection.getConnection());
//			} catch (ClassNotFoundException | SQLException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//			
//			while(res.next()) {
//				Order o = new Order();
//				o.setO_id(res.getInt("o_id"));
//				o.setU_id(uId);
//				o.setProduct(pDao.getProductById(res.getInt("p_id")));
//				o.setO_date(res.getDate("o_date"));
//				o.setO_quantity(res.getInt("o_quantity"));
//				
//				
//				orders.add(o);
//			}
//		} catch(Exception e) {
//			e.printStackTrace();
//			System.out.println(e.getMessage());
//		}
//		return orders;
//	}
//	
//	public boolean removeOrderById(int id) {
//		try {
//			query = "delete from orders where o_id=?";
//			pst = this.connection.prepareStatement(query);
//			pst.setInt(1, id);
//			
//			int res = pst.executeUpdate();
//			
//			return res > 0;
//			
//		} catch(Exception e) {
//			e.printStackTrace();
//			System.out.println(e.getMessage());
//		}
//		return false;
//	}
//}
