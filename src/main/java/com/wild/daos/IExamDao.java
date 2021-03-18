package com.wild.daos;

import java.util.List;

import com.wild.models.Exam;

public interface IExamDao extends GenericDAO<Exam>{
	List<Exam> findAll();
	
	//Tim de thi theo id mon
	List<Exam> findExamsBySubjectId(Long idSubject,Long idUser,Boolean isHaveSession);
	
	int addNewExam(Exam ex);
	
	Exam findExamById(Long idSubject);
 }
