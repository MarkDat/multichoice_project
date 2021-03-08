package com.wild.daos.impl;

import java.util.List;

import com.wild.daos.IGradeDao;
import com.wild.mapper.GradeMapper;
import com.wild.models.Grade;

public class GradeDao extends AbstractDAO<Grade> implements IGradeDao{

	@Override
	public List<Grade> getAll() {
		String sql = "SELECT * FROM `grade` WHERE 1";
		return query(sql, new GradeMapper());
	}
	
}
