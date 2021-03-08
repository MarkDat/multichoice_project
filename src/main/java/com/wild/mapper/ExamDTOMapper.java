package com.wild.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.wild.dtos.ExamDTO;
import com.wild.models.Exam;

public class ExamDTOMapper implements RowMapper<ExamDTO>{

	@Override
	public ExamDTO mapRow(ResultSet rs) {
		try {
			ExamDTO ex = new ExamDTO();
			ex.setIdExam(rs.getLong("idexam"));
			ex.setIdGrade(rs.getLong("idgrade"));
			ex.setIdSubject(rs.getLong("idsubject"));
			ex.setCreatedDate(rs.getDate("createddate"));
			ex.setModifiedDate(rs.getDate("modifieddate"));
			ex.setTitleExam(rs.getString("titleexam"));
			ex.setNameGrade(rs.getString("namegrade"));
			ex.setNameSubject(rs.getString("namesubject"));
			
			return ex;
		} catch (SQLException e) {
			System.out.println("Loi mapper ExamDTO");
			return null;
		}	
	}

}
