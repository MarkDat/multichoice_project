package com.wild.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.wild.models.RankUser;

public class RankUserMapper implements RowMapper<RankUser>{

	@Override
	public RankUser mapRow(ResultSet rs) {
		try {
			RankUser s = new RankUser();
			s.setName(rs.getString("fullname"));
			s.setTotalMark(rs.getInt("totalmark"));
			return s;
		} catch (SQLException e) {
			System.out.println("Loi mapper RankUserMapper");
			return null;
		}	
	}
 
}
