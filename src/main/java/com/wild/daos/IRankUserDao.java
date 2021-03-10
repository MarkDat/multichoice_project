package com.wild.daos;

import java.util.List;

import com.wild.models.RankUser;

public interface IRankUserDao extends GenericDAO<RankUser>{
	List<RankUser> findAll();
}
