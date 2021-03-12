package com.wild.daos.impl;

import java.util.List;

import com.wild.daos.IUserMarkDao;
import com.wild.mapper.UserMarkMapper;
import com.wild.models.UserMark;

public class UserMarkDao extends AbstractDAO<UserMark> implements IUserMarkDao{

	//SELECT s.iduser,s.username, s.fullname, s.address,s.phone, SUM(r.mark) as point, COUNT(r.mark) as times FROM user_details s, result r WHERE s.iduser=r.iduser GROUP BY s.username
	@Override
	public List<UserMark> findAll() {
		StringBuilder sql = new StringBuilder("SELECT s.iduser,s.username, s.fullname, s.address,s.phone, SUM(r.mark) as point, COUNT(r.mark) as times FROM user_details s, result r "); 
		sql.append("WHERE s.iduser=r.iduser GROUP BY s.username");		
		return query(sql.toString(),new UserMarkMapper());
	}

	@Override
	public int editListMember(UserMark userMark) {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder("UPDATE user_details SET fullname=?, address=?, phone=? WHERE username=?");
		
		return update(sql.toString(), userMark.getFullName(), userMark.getAddress(), userMark.getPhone(), userMark.getUserName());
		
	}

	@Override
	public UserMark findUserMarkById(int id) {
		StringBuilder sql = new StringBuilder("SELECT s.iduser,s.username, s.fullname, s.address,s.phone, SUM(r.mark) as point, COUNT(r.mark) as times FROM user_details s, result r "); 
		sql.append("WHERE s.iduser=r.iduser AND s.iduser=?");		
		return query(sql.toString(),new UserMarkMapper(), id).get(0);
	}


	
	
}
