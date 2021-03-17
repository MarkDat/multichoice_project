package com.wild.daos.impl;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import com.wild.daos.IQuestionDao;
import com.wild.mapper.GradeMapper;
import com.wild.mapper.QuestionMapper;
import com.wild.models.Question;

public class QuestionDao extends AbstractDAO<Question> implements IQuestionDao{

	@Override
	public List<Question> findListQuesByIdExam(Long exam) {
		String sql = "SELECT * FROM `question` WHERE idexam=?";
		return query(sql, new QuestionMapper(),exam);
	}

	@Override
	public Long addNewQuesByIdExam(Question qs) {
		StringBuilder sql = new StringBuilder("INSERT INTO question (");
		sql.append("idexam, createddate, modifieddate,content, img,rsa,rsb,rsc,rsd,rs)");
		sql.append(" VALUES(?,?,?,?,?,?,?,?,?,? )");
		
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(System.currentTimeMillis());
		return insert(sql.toString(), qs.getIdExam(),formatter.format(date),formatter.format(date),qs.getContent(),
				qs.getImg(),qs.getRsA(),qs.getRsB(),qs.getRsC(),qs.getRsD(),qs.getRs());
	}

	@Override
	public int deleteQuesById(Long id) {
		String sql = "DELETE FROM question WHERE idq = ?";
		return update(sql, id);
	}

//	@Override
//	public int editQues(Question q) {
//		StringBuilder sql = new StringBuilder("UPDATE question SET ");
//		sql.append("modifieddate = ?,content = ?, img = ?,rsa=?,rsb=?,rsc=?,rsd=?,rs=? ");
//		sql.append("WHERE idq = ?");
//		
//		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
//		Date date = new Date(System.currentTimeMillis());
//		return update(sql.toString(),formatter.format(date),q.getContent(),q.getImg(),
//				q.getRsA(),q.getRsB(),q.getRsC(),q.getRsD(),q.getRs(),q.getIdQ());
//	}
	
	@Override
	public int editQues(Question q) {
		StringBuilder sql = new StringBuilder("UPDATE question SET ");
		sql.append("modifieddate = ?,content = ?, rsa=?,rsb=?,rsc=?,rsd=?");
		sql.append("WHERE idq = ?");
		
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(System.currentTimeMillis());
		return update(sql.toString(),formatter.format(date),q.getContent(),
				q.getRsA(),q.getRsB(),q.getRsC(),q.getRsD(), q.getIdQ());
	}

	@Override
	public Question editQuesById(int idQ) {
		String sql = "SELECT * FROM `question` WHERE idq=?";
		return query(sql, new QuestionMapper(), idQ).get(0);
	}

	@Override
	public int addListQuestionByIdExam(List<Question> lq) {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder("INSERT INTO question ( ");
		sql.append("idexam, createddate, modifieddate,content, img,rsa,rsb,rsc,rsd,rs) ");
		sql.append("VALUES(?,?,?,?,?,?,?,?,?,? )");
		
		int count = 0;
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(System.currentTimeMillis());
		
		for (int i = 0; i < lq.size(); i++) {
			Question qs = lq.get(i);
			count += insert(sql.toString(), qs.getIdExam(),formatter.format(date),formatter.format(date),qs.getContent(),
					qs.getImg(),qs.getRsA(),qs.getRsB(),qs.getRsC(),qs.getRsD(),qs.getRs());
		}

		return count;
	}

	
	
}
