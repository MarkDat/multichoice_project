package com.wild.daos;

import java.util.List;

import com.wild.dtos.ExamDTO;

public interface IExamDTO extends GenericDAO<ExamDTO>{

	List<ExamDTO> findExamsDTOAll();
	List<ExamDTO> findExamsBySubject(Long idS);
	List<ExamDTO> findExamsByGrade(Long idG);
}
