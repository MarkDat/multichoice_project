package com.wild.daos.impl;

import java.util.List;

import com.wild.daos.IRankUserDao;
import com.wild.mapper.RankUserMapper;
import com.wild.models.RankUser;

public class RankUserDao extends AbstractDAO<RankUser> implements IRankUserDao{

	@Override
	public List<RankUser> findAll() {
		StringBuilder sql = new StringBuilder("SELECT s.fullname, SUM(r.mark) as totalmark FROM user_details s, result r ");
		sql.append("WHERE s.iduser=r.iduser GROUP BY s.username ORDER BY totalmark DESC");
		return query(sql.toString(), new RankUserMapper());
	}

}
