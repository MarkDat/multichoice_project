package com.wild.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.wild.models.Role;

public class RoleMapper implements RowMapper<Role>{
	
	@Override
	public Role mapRow(ResultSet rs) {
		try {
			Role role = new Role();
			role.setIdRole(rs.getLong("idrole"));
			role.setRoleName(rs.getString("rolename"));
			role.setCode(rs.getString("code"));
			
			return role;
		} catch (SQLException e) {
			System.out.println("Loi mapper Role");
			return null;
		}	
	}
}
