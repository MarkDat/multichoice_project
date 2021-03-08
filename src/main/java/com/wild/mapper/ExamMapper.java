package com.wild.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.wild.models.Exam;

public class ExamMapper implements RowMapper<Exam>{

	@Override
	public Exam mapRow(ResultSet rs) {
		try {
			Exam ex = new Exam();
			ex.setIdExam(rs.getLong("idexam"));
			ex.setIdSubject(rs.getLong("idsubject"));
			ex.setCreatedDate(rs.getDate("createddate"));
			ex.setModifiedDate(rs.getDate("modifieddate"));
			ex.setTitleExam(rs.getString("titleexam"));
			
			return ex;
		} catch (SQLException e) {
			System.out.println("Loi mapper Exammaper");
			return null;
		}	
	}
	
}
