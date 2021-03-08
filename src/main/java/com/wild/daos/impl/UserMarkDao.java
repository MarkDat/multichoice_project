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

}
