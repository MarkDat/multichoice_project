package com.wild.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.wild.models.Role;
import com.wild.models.Subject;
import com.wild.models.User;

public class UserMapper implements RowMapper<User>{

	@Override
	public User mapRow(ResultSet rs) {
		try {
			User u = new User();
			u.setIdUser(rs.getLong("iduser"));
			u.setFullName(rs.getString("fullname"));
			u.setEmail(rs.getString("email"));
			u.setAddress(rs.getString("address"));
			u.setPhone(rs.getString("phone"));
			u.setCreatedDate(rs.getDate("createddate"));
			u.setModifiedDate(rs.getDate("modifieddate"));
			u.setUserName(rs.getString("username"));
			u.setPassword(rs.getString("pwd"));
			u.setStatus(rs.getInt("status"));
			try {
				Role role = new Role();
				role.setIdRole(rs.getLong("idrole"));
				role.setRoleName(rs.getString("rolename"));
				role.setCode(rs.getString("code"));
				u.setRole(role);
			} catch (Exception e) {
				System.out.print(e.getMessage());
				System.out.println("Loi mapper User -> Role");
			}
			
			
			return u;
		} catch (SQLException e) {
			System.out.println("Loi mapper User");
			return null;
		}	
	}

}
