package com.kaung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.kaung.model.Order;

public class OrderDao {
	
	private Connection conn;
	private String query;
	private PreparedStatement pst;
	
	public OrderDao(Connection conn) {
		this.conn = conn;
	}
	
	public boolean insertOrder(Order model) {
		boolean result = false;
		
		try {
			query = "insert into orders(p_id, u_id, o_quantity, o_date) values (?,?,?,?);";
			pst = this.conn.prepareStatement(query);
			
			pst.setInt(1, model.getId());
			pst.setInt(2, model.getUserId());
			pst.setInt(3, model.getQuantity());
			pst.setString(4, model.getDate());
			
			pst.executeUpdate();
			result = true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}
}
