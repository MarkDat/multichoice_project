package com.wild.daos;

import java.util.List;

import com.wild.models.User;

public interface IUserDao extends GenericDAO<User>{
	int editInfor(User user);
	int editPass(User user);
	int addNewUser(User user);
	int isActiveUser(User user);
	int addRoleUser(String roleCode, String userName);
	User findUserByEmail(String email);
	User findUserByUsername(String username);
	User findUserByEmailAndPassword(String userName, String password);
}
