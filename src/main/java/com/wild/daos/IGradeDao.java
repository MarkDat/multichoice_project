package com.wild.daos;

import java.util.List;

import com.wild.models.Grade;
public interface IGradeDao extends GenericDAO<Grade>{
		List<Grade> getAll();
		
}
