package com.wild.daos;

import com.wild.models.User;

public interface IUserDao extends GenericDAO<User> {
	int editInfor(User user);

	int editInforByParameter(Long iduser, String fullname, String email, String address, String phone);

	int editPass(User user);

	int changePass(Long iduser, String pwd);

	int addNewUser(User user);

	int isActiveUser(User user);

	int addRoleUser(String roleCode, String userName);

	User findUserByEmail(String email);

	User findUserByUsername(String username);

	User findUserByEmailAndPassword(String userName, String password);
}
