package com.wild.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.wild.models.Grade;
import com.wild.models.History;

public class HistoryMapper implements RowMapper<History>{

	@Override
	public History mapRow(ResultSet rs) {
		try {
			History hs = new History();
			hs.setIdUser(rs.getLong("iduser"));
			hs.setTittleExam(rs.getString("titleexam"));
			hs.setTestDay(rs.getDate("testday"));
			hs.setMark(rs.getFloat("mark"));
			
			
			return hs;
		} catch (SQLException e) {
			System.out.println("Loi mapper HistoryMapper");
			return null;
		}	
	}

}
