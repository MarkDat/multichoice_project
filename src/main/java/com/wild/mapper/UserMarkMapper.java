package com.wild.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.wild.models.UserMark;

public class UserMarkMapper implements RowMapper<UserMark>{

	@Override
	public UserMark mapRow(ResultSet rs) {
		try {
			UserMark u = new UserMark();
			u.setIdUser(rs.getLong("iduser"));
			u.setUserName(rs.getString("username"));
			u.setAddress(rs.getString("address"));
			u.setPhone(rs.getString("phone"));
			u.setFullName(rs.getString("fullname"));
			u.setPoint(rs.getInt("point"));
			u.setTimes(rs.getInt("times"));
			return u;
		} catch (SQLException e) {
			System.out.println("Loi mapper UserMark");
			return null;
		}	
	}

}
