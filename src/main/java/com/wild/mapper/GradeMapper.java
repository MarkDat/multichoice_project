package com.wild.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.wild.models.Grade;

public class GradeMapper implements RowMapper<Grade>{

	@Override
	public Grade mapRow(ResultSet rs) {
		try {
			Grade gr = new Grade();
			gr.setIdGrade(rs.getLong("idgrade"));
			gr.setNameGrade(rs.getString("namegrade"));
			
			
			
			return gr;
		} catch (SQLException e) {
			System.out.println("Loi mapper Grademapper");
			return null;
		}	
	}

}
