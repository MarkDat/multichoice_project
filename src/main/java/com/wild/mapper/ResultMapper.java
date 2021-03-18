package com.wild.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.wild.models.RankUser;
import com.wild.models.Result;

public class ResultMapper implements RowMapper<Result>{

	@Override
	public Result mapRow(ResultSet rs) {
		try {
			Result r = new Result();
			r.setIdUser(rs.getLong("iduser"));
			r.setIdExam(rs.getLong("idexam"));
			r.setCreatedDate(rs.getDate("createddate"));
			r.setModifiedDate(rs.getDate("modifieddate"));
			r.setMark(rs.getFloat("mark"));
			return r;
		} catch (SQLException e) {
			System.out.println("Loi mapper RankUserMapper");
			return null;
		}
	}
	
}
