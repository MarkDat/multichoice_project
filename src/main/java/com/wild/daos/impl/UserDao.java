package com.wild.daos.impl;

import java.util.List;

import com.wild.daos.IUserDao;
import com.wild.models.User;

public class UserDao extends AbstractDAO<User> implements IUserDao{


	@Override
	public int editInfor(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int editPass(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addNewUser(User user) {
		// TODO Auto-generated method stub
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
