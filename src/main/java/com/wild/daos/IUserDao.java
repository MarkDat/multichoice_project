package com.wild.daos;

import java.util.List;

import com.wild.models.User;

public interface IUserDao extends GenericDAO<User>{
	List<User> findUsersInfor();
	int editInfor(User user);
	int editPass(User user);
	int addNewUser(User user);
	User findByUserInforNameAndPassword(String userName, String password);
	
}
