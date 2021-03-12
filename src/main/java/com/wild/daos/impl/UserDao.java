package com.wild.daos.impl;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import com.wild.daos.IUserDao;
import com.wild.mapper.UserCheckLoginMapper;
import com.wild.mapper.UserMapper;
import com.wild.models.User;
import com.wild.models.UserCheckLogin;

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

	//Cái này dành cho form đăng ký user, cũng có thể dành cho cái add user bên admin nhưng t phải config lại 1 chút mới 
	//được, hiện tại thì khoan dùng cho admin
	@Override
	public Long addNewUser(User user) {
		String sqlCheckUser = "SELECT username FROM user_details WHERE username = ?";
		List<UserCheckLogin> u = query(sqlCheckUser, new UserCheckLoginMapper(), user.getUserName());
		
		if(!u.isEmpty()) return 0L;
		
		StringBuilder sqlIn = new StringBuilder("INSERT INTO user_details ( ");
		sqlIn.append("fullname, username, pwd) ");
		sqlIn.append("VALUES(?,?,?)");
		
		Long idU = insert(sqlIn.toString(), user.getFullName(),user.getUserName(),user.getPassword());
		
		System.out.println(idU);
		
		if(idU.equals(0L)) {
			StringBuilder sqlSub = new StringBuilder("INSERT INTO sub_rl_ud VALUES('2',?)");
			return insert(sqlSub.toString(), idU).equals(0L) ? idU:0L;
		}
		
		return 0L;
	}

	@Override
	public User findByUserInforNameAndPassword(String userName, String password) {
		StringBuilder sql = new StringBuilder("SELECT * FROM user_details u, sub_rl_ud s, role r WHERE ");
		sql.append("u.iduser = s.iduser AND r.idrole = s.idrole AND ");
		sql.append("u.username = ? AND u.pwd = ?");
		
		List<User> us = query(sql.toString(), new UserMapper(),userName,password);
		
		return us.isEmpty() ? null:us.get(0);
	}

}
