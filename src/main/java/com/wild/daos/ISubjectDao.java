package com.wild.daos;

import java.util.List;

import com.wild.models.Subject;

public interface ISubjectDao extends GenericDAO<Subject>{
	List<Subject> findAll();
	List<Subject> findSubjectsByIdGrade(Long idG);
	List<Subject> listSubject();
	
}
