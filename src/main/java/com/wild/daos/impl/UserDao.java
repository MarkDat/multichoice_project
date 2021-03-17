package com.wild.daos.impl;

import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import com.wild.daos.IUserDao;
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
		StringBuilder sql = new StringBuilder("UPDATE user_details SET ");
		sql.append("pwd = ? ");
		sql.append("WHERE iduser = ?");
		return update(sql.toString(), user.getPassword(), user.getIdUser());
	}

	//Cái này dành cho form đăng ký user, cũng có thể dành cho cái add user bên admin nhưng t phải config lại 1 chút mới 
	//được, hiện tại thì khoan dùng cho admin
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
		if (result != 0)
			result = addRoleUser(user.getRole().getCode(), user.getUserName());
		return result;
	}

	@Override
	public int isActiveUser(User user) {
		final String sql = "SELECT status FROM user_details WHERE email = ?";
		int result = 1;
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, user.getEmail());
			rs = pst.executeQuery();
			if (rs.next())
				result = rs.getInt("status");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		return result;
	}

	@Override
	public User findUserByEmailAndPassword(String email, String password) {
		StringBuilder sql = new StringBuilder("SELECT u.*,r.* FROM user_details u,sub_rl_ud su, role r ");
		sql.append("WHERE u.iduser=su.iduser And su.idrole=r.idrole and ");
		sql.append("email=? AND pwd = ?");

		return query(sql.toString(), new UserMapper(), email,password).get(0);
	}

	public boolean findByEmailAndPassword(User user) {
		boolean status = false;
		try {
			conn = DBConnectionUtil.getConnection();
			String SELECT_USERS_SQL = "SELECT * FROM user_details WHERE email = ? AND pwd = ?";
			pst = conn.prepareStatement(SELECT_USERS_SQL);
			pst.setString(1, user.getEmail());
			pst.setString(2, user.getPassword());
			
			System.out.println(pst);
			rs = pst.executeQuery();
			status = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		return status;
	}

	@Override
	public User findUserByEmail(String email) {
		String sql = "SELECT * FROM user_details WHERE email = ?";
		conn = getConnection();
		User user = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			rs = pst.executeQuery();
			if (rs.next()) {
				user = new User(rs.getLong("iduser"), rs.getString("fullname"), rs.getString("email"),
						rs.getString("address"), rs.getString("phone"), rs.getString("username"), rs.getString("pwd"),rs.getInt("status"),
						new Role());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		return user;
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
				user = new User(rs.getLong("iduser"), rs.getString("fullname"), rs.getString("email"),
						rs.getString("address"), rs.getString("phone"), rs.getString("username"), rs.getString("pwd"),rs.getInt("status"),
						new Role());
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
