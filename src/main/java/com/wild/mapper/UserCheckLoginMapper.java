package com.wild.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.wild.models.Grade;
import com.wild.models.UserCheckLogin;

public class UserCheckLoginMapper implements RowMapper<UserCheckLogin>{

	@Override
	public UserCheckLogin mapRow(ResultSet rs) {
		try {
			UserCheckLogin gr = new UserCheckLogin();
			gr.setUserName(rs.getString("username"));
		
			return gr;
		} catch (SQLException e) {
			System.out.println("Loi mapper UserCheckLogin");
			return null;
		}	
	}

}
