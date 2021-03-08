package com.wild.daos.impl;

import java.util.List;

import com.wild.daos.ISubjectDao;
import com.wild.mapper.SubjectMapper;
import com.wild.models.Subject;

public class SubjectDao extends AbstractDAO<Subject> implements ISubjectDao{

	@Override
	public List<Subject> findAll() {
		String sql = "SELECT * FROM `subject` WHERE 1";
		return query(sql, new SubjectMapper());
	}

	//CALL getListSubjectsByIdGrade(idG)
	@Override
	public List<Subject> findSubjectsByIdGrade(Long idG) {
		String sql = "CALL getListSubjectsByIdGrade(?)";
		return query(sql, new SubjectMapper(),idG);
	}


}
