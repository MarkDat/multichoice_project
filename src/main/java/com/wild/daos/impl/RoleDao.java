package com.wild.daos.impl;

import java.sql.SQLException;
<<<<<<< Updated upstream

import com.wild.daos.IRoleDao;
import com.wild.models.Role;
=======
import java.util.List;

import com.wild.daos.IRoleDao;
import com.wild.mapper.RoleMapper;
import com.wild.models.Role;
import com.wild.models.User;
>>>>>>> Stashed changes
import com.wild.utils.DBConnectionUtil;

public class RoleDao extends AbstractDAO<Role> implements IRoleDao {

	@Override
	public Role getRoleByCode(String code) {
		String sql = "SELECT * FROM role WHERE code = ?";
		Role role = null;
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, code);
			rs = pst.executeQuery();
			if (rs.next()) {
				role = new Role(rs.getInt("idrole"), rs.getString("rolename"), rs.getString("code"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		return role;
	}

}
