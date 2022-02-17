package com.kaung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.kaung.model.User;

public class UserDao {

	private Connection conn;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public User userLogin(String email, String password) {
		User user = null;
		
		try {
			query = "select * from users where email=? and password=?";
			
			pst = this.conn.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			
			rs = pst.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return user;
	}
}
