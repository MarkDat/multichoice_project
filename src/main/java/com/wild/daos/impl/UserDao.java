package com.wild.daos.impl;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import com.wild.daos.IUserDao;
import com.wild.models.User;

public class UserDao extends AbstractDAO<User> implements IUserDao{


	@Override
	public int editInfor(User user) {
		StringBuilder sql = new StringBuilder("UPDATE user_details SET ");
		sql.append("fullname = ?,email = ?, address = ?,phone=?,modifieddate=?");
		sql.append("WHERE iduser = ?");
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(System.currentTimeMillis());
		
		return update(sql.toString(), user.getFullName(),user.getEmail(),user.getAddress(),user.getPhone(),
				formatter.format(date),user.getIdUser());
	}

	@Override
	public int editPass(User user) {
		StringBuilder sql = new StringBuilder("UPDATE user_details SET ");
		sql.append("pwd = ? ");
		sql.append("WHERE iduser = ?");
		return update(sql.toString(), user.getPassword(), user.getIdUser());
	}

	@Override
	public int addNewUser(User user) {
		
		return 0;
	}

	@Override
	public User findByUserInforNameAndPassword(String userName, String password) {
		StringBuilder sql = new StringBuilder("SELECT * FROM user_details");
		sql.append(" INNER JOIN role AS r ON r.id = u.roleid");
		sql.append(" WHERE username = ? AND password = ? AND status = ?");
		
		return null;
	}

}
