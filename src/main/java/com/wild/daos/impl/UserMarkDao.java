package com.wild.daos.impl;

import java.util.List;

import com.wild.daos.IUserMarkDao;
import com.wild.mapper.UserMapper;
import com.wild.mapper.UserMarkMapper;
import com.wild.models.User;
import com.wild.models.UserMark;

public class UserMarkDao extends AbstractDAO<UserMark> implements IUserMarkDao{

	//SELECT s.iduser,s.username, s.fullname, s.address,s.phone, SUM(r.mark) as point, COUNT(r.mark) as times FROM user_details s, result r WHERE s.iduser=r.iduser GROUP BY s.username
	@Override
	public List<UserMark> findAll() {
		StringBuilder sql = new StringBuilder("SELECT s.iduser,s.username, s.fullname, s.address,s.phone,s.status, SUM(r.mark) as point, COUNT(r.mark) as times FROM user_details s LEFT JOIN result r "); 
		sql.append("ON s.iduser=r.iduser GROUP BY s.username");		
		return query(sql.toString(),new UserMarkMapper());
	}

	@Override
	public int editListMember(UserMark userMark) {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder("UPDATE user_details SET fullname=?, address=?, phone=? WHERE iduser=?");
		
		return update(sql.toString(), userMark.getFullName(), userMark.getAddress(), userMark.getPhone(), userMark.getIdUser());
		
	}
	
	@Override
	public int updateStatusListMember(UserMark userMark) {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder("UPDATE user_details SET status = ? WHERE iduser=?");
		
		return update(sql.toString(), userMark.getStatus() ,userMark.getIdUser());
	}

	@Override
	public User findUserMarkById(int id) {
		StringBuilder sql = new StringBuilder("SELECT * FROM user_details u, sub_rl_ud subr,role r where u.iduser=subr.iduser and subr.idrole = r.idrole "); 
		sql.append("AND u.iduser = ?");		
		return query(sql.toString(),new UserMapper(), id).get(0);
	}
	
	

	
	
}
