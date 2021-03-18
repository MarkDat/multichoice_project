package com.wild.daos;

import com.wild.models.Result;

public interface IResultDao extends GenericDAO<Result>{
		Boolean checkExistResultByIdExamAndUser(Long idExam,Long idUser);
		int addResutlByIdExam(Long idExam,Long idUser,float mark);
}
