package com.wild.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.wild.models.Question;
import com.wild.models.Subject;

public class SubjectMapper implements RowMapper<Subject>{

	@Override
	public Subject mapRow(ResultSet rs) {
		try {
			Subject s = new Subject();
			s.setIdSubject(rs.getLong("idsubject"));
			s.setNameSubject(rs.getString("namesubject"));
			s.setCreatedDate(rs.getDate("createddate"));
			s.setModifiedDate(rs.getDate("modifieddate"));
			s.setImg(rs.getString("img"));
			return s;
		} catch (SQLException e) {
			System.out.println("Loi mapper Subject");
			return null;
		}	
	}
	
}
