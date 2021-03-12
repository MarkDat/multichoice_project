package com.wild.daos;

import java.util.List;

import com.wild.models.UserMark;

public interface IUserMarkDao extends GenericDAO<UserMark>{
	List<UserMark> findAll();
	UserMark findUserMarkById(int id);
	int editListMember(UserMark userMark);
}
