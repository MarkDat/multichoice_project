package com.wild.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.wild.models.Grade;
import com.wild.models.Question;

public class QuestionMapper implements RowMapper<Question>{

	@Override
	public Question mapRow(ResultSet rs) {
		try {
			Question qs = new Question();
			qs.setIdQ(rs.getLong("idq"));
			qs.setIdExam(rs.getLong("idexam"));
			qs.setCreatedDate(rs.getDate("createddate"));
			qs.setModifiedDate(rs.getDate("modifieddate"));
			qs.setContent(rs.getString("content"));
			qs.setImg(rs.getString("img"));
			qs.setRsA(rs.getString("rsa"));
			qs.setRsB(rs.getString("rsb"));
			qs.setRsC(rs.getString("rsc"));
			qs.setRsD(rs.getString("rsd"));
			qs.setRs(rs.getString("rs"));
			return qs;
		} catch (SQLException e) {
			System.out.println("Loi mapper Question");
			return null;
		}	
	}

}
