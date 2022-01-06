package com.babyboy.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.babyboy.model.Product;

public class ProductDao {
	private Connection connection;
	private String query;
	private PreparedStatement pst;
	private ResultSet res;
	
	public ProductDao(Connection con) {
		this.connection = con;
	}
	
	public List<Product> getAllProducts() {
		List<Product> products = new ArrayList<Product>();
		try {
			query = "select * from products";
			pst = this.connection.prepareStatement(query);
			
			res = pst.executeQuery();
			
			while(res.next()) {
				Product p = new Product();
//				p.setCategory(res.getString("category"));
//				p.setId(res.getInt("id"));
				p.setName(res.getNString("name"));
//				p.setImage(res.getString("image"));
				p.setPrice(res.getDouble("price"));
				products.add(p);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return products;
	}

	public Product getProductById(int id) {
		Product p = null;
		try {
			query = "select * from products where id=?";
			pst = this.connection.prepareStatement(query);
			pst.setInt(1, id);
			
			res = pst.executeQuery();
			
			if(res.next()) {
				p = new Product();
//				p.setCategory(res.getString("category"));
//				p.setId(res.getInt("id"));
				p.setName(res.getNString("name"));
//				p.setImage(res.getString("image"));
				p.setPrice(res.getDouble("price"));

			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return p;
	}
}
