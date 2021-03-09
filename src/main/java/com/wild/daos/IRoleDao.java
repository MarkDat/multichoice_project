package com.wild.daos;

import com.wild.models.Role;

public interface IRoleDao extends GenericDAO<Role>{
	Role getRoleByCode(String Code);
}
