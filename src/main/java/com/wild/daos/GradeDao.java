//package com.wild.daos;
//
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//import com.wild.models.Grade;
//import com.wild.utils.DBConnectionUtil;
//
//public class GradeDao extends AbstractDAO{
//
//	
//	//Lấy id,tên khối
//	public List<Grade> getAll() {
//		List<Grade> list = new ArrayList<Grade>();
//		final String sql = "SELECT * FROM `grade` WHERE 1";
//		conn = DBConnectionUtil.getConnection();
//		try {
//			st = conn.createStatement();
//			rs = st.executeQuery(sql);
//			while (rs.next()) {
//				Grade gr = new Grade(rs.getLong("idgrade"), rs.getString("namegrade"));
//				list.add(gr);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBConnectionUtil.close(conn, rs, st);
//		}
//		return list;
//		
//	}
//	
//	
//}
