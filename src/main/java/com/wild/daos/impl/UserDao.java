package com.wild.daos.impl;

import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import com.wild.daos.IUserDao;
import com.wild.mapper.UserMapper;
import com.wild.models.Role;
import com.wild.models.User;
import com.wild.utils.DBConnectionUtil;

public class UserDao extends AbstractDAO<User> implements IUserDao {

	@Override
	public int editInfor(User user) {
		StringBuilder sql = new StringBuilder("UPDATE user_details SET ");
		sql.append("fullname = ?,email = ?, address = ?,phone=?,modifieddate=?");
		sql.append("WHERE iduser = ?");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(System.currentTimeMillis());

		return update(sql.toString(), user.getFullName(), user.getEmail(), user.getAddress(), user.getPhone(),
				formatter.format(date), user.getIdUser());
	}

	@Override
	public int editPass(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addNewUser(User user) {
		final String sql = "INSERT INTO user_details(fullname, email, address, phone, username, pwd, status) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
		int result = 0;
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, user.getFullName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getAddress());
			pst.setString(4, user.getPhone());
			pst.setString(5, user.getUserName());
			pst.setString(6, user.getPassword());
			pst.setInt(7, 0);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		if(result != 0)
			result = addRoleUser(user.getRole().getCode(), user.getUserName());
		return result;
	}

	@Override
	public User findByUserInforNameAndPassword(String userName, String password) {
		StringBuilder sql = new StringBuilder("SELECT * FROM user_details");
		sql.append(" INNER JOIN role AS r ON r.id = u.roleid");
		sql.append(" WHERE username = ? AND password = ? AND status = ?");

		return null;
	}

	@Override
	public User findUserByEmail(String email) {
		String sql = "SELECT * FROM user_details WHERE email = ?";
		List<User> result = query(sql, new UserMapper(), email);
		if (result == null || result.size() == 0)
			return null;
		return result.get(0);
	}

	@Override
	public User findUserByUsername(String username) {
		String sql = "SELECT * FROM user_details WHERE username = ?";
		conn = getConnection();
		User user = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			rs = pst.executeQuery();
			if (rs.next()) {
				user = new User(rs.getLong("iduser"), rs.getString("fullname"), rs.getString("email"), rs.getString("address"), rs.getString("phone"), rs.getString("username"), rs.getString("pwd"), new Role());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		return user;
	}

	@Override
	public int addRoleUser(String roleCode, String userName) {
		RoleDao roleDao = new RoleDao();
		Role role = roleDao.getRoleByCode(roleCode);
		User user = findUserByUsername(userName);
		int result = 0;
		final String sql = "INSERT INTO sub_rl_ud(idrole, iduser) VALUES (?, ?)";
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setLong(1, role.getIdRole());
			pst.setLong(2, user.getIdUser());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		return result;
	}

}
