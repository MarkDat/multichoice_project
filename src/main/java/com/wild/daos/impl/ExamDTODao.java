package com.wild.daos.impl;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import com.wild.daos.IExamDTO;
import com.wild.dtos.ExamDTO;
import com.wild.mapper.ExamDTOMapper;
import com.wild.mapper.ExamMapper;

public class ExamDTODao extends AbstractDAO<ExamDTO> implements IExamDTO{

//	SELECT e.idexam,s.idsubject,g.idgrade,e.createddate,e.modifieddate,e.titleexam ,s.namesubject,g.namegrade 
//	FROM exam e, grade g, subject s,sub_g_s sgs 
//	WHERE g.idgrade=sgs.idgrade AND s.idsubject=sgs.idsubject AND e.idsubject = s.idsubject 
//	Group BY e.idexam ORDER BY e.modifieddate DESC
	//CALL findExamsDTOAll()
	@Override
	public List<ExamDTO> findExamsDTOAll() {
		String sql = "CALL findExamsDTOAll()";
		return query(sql,new ExamDTOMapper());
	}

	//CALL getListExamsByIdSubject(idS)
	@Override
	public List<ExamDTO> findExamsBySubject(Long idS) {
		String sql = "CALL getListExamsByIdSubject(?)";
		return query(sql,new ExamDTOMapper(),idS);
	}
	
	//CALL getListExamsByIdGrade(idG)
	@Override
	public List<ExamDTO> findExamsByGrade(Long idG) {
		String sql = "CALL getListExamsByIdGrade(?)";
		return query(sql,new ExamDTOMapper(),idG);
	}

	
	@Override
	public long addNewExam(ExamDTO examDTO) {
		StringBuilder sql = new StringBuilder("INSERT INTO exam (");
		sql.append("idsubject,createddate,modifieddate,titleexam)");
		sql.append(" VALUES(?,?,?,? )");
		
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(System.currentTimeMillis());
		return insert(sql.toString(), examDTO.getIdSubject(),formatter.format(date),formatter.format(date) ,examDTO.getTitleExam());
	}

	
}
