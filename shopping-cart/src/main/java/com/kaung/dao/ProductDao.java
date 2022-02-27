package com.kaung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kaung.model.Cart;
import com.kaung.model.Product;

public class ProductDao {

	private Connection conn;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ProductDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public List<Product> getAllProducts(){
		List<Product> products = new ArrayList<Product>();
		
		try {
			query = "select * from products";
			pst = this.conn.prepareStatement(query);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				Product row = new Product();
				
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				
				products.add(row);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return products;
	}
	
	public List<Cart> getAllCartProducts(ArrayList<Cart> cartList) {
		List<Cart> products = new ArrayList<>();
		
		try {
			if(cartList.size() > 0) {
				for(Cart c: cartList) {
					query = "select * from products where id=?";
					pst = this.conn.prepareStatement(query);
					pst.setInt(1, c.getId());
					rs = pst.executeQuery();
					while(rs.next()) {
						Cart row = new Cart();
						
						row.setId(rs.getInt("id"));
						row.setName(rs.getString("name"));
						row.setCategory(rs.getString("category"));
						row.setPrice(rs.getDouble("price")*c.getQuantity());
						row.setImage(rs.getString("image"));
						row.setQuantity(c.getQuantity());
						products.add(row);
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return products;
	}
	
	public Product getSingleProduct(int id) {
		Product row = null;
		
		try {
			query = "select * from products where id=?";
			pst = this.conn.prepareStatement(query);
			pst.setInt(1, id);
			
			rs = pst.executeQuery();
			while(rs.next()) {
				row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return row;
	}
	
	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum = 0;
		
		try {
			if( cartList.size()> 0) {
				for(Cart c: cartList) {
					query = "select price from products where id=?";
					pst = this.conn.prepareStatement(query);
					pst.setInt(1, c.getId());
					rs = pst.executeQuery();
					
					while(rs.next()) {
						sum += rs.getDouble("price")*c.getQuantity();
					}
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return sum;
	}
}
