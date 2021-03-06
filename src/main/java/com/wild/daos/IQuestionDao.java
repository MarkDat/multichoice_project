package com.wild.daos;

import java.util.List;

import com.wild.models.Question;

public interface IQuestionDao extends GenericDAO<Question>{
		List<Question> findListQuesByIdExam(Long exam);
		Long addNewQuesByIdExam(Question qs);
		int deleteQuesById(Long idQ);
		int editQues(Question qModel);
}
