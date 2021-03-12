package com.wild.daos;

import java.util.List;

import com.wild.models.User;

public interface IUserDao extends GenericDAO<User>{
	int editInfor(User user);
	int editPass(User user);
	Long addNewUser(User user);
	User findByUserInforNameAndPassword(String userName, String password);
}
