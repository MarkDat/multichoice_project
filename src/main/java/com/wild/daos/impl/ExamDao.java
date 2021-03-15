package com.wild.daos.impl;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import com.wild.daos.IExamDao;
import com.wild.mapper.ExamMapper;
import com.wild.models.Exam;

public class ExamDao extends AbstractDAO<Exam> implements IExamDao{

	@Override
	public List<Exam> findAll() {
		String sql = "SELECT * FROM `exam`";
		return query(sql,new ExamMapper());
	}

	@Override
	public List<Exam> findExamsBySubjectId(Long idSubject) {
		String sql = "SELECT * FROM `exam` WHERE idsubject=?";
		return query(sql,new ExamMapper(),idSubject);
	}

	@Override
	public Long addNewExam(Exam ex) {
		StringBuilder sql = new StringBuilder("INSERT INTO exam (");
		sql.append("idsubject,createddate,modifieddate,titleexam)");
		sql.append(" VALUES(?,?,?,? )");
		
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(System.currentTimeMillis());
		return insert(sql.toString(), ex.getIdSubject(),formatter.format(date),formatter.format(date),ex.getTitleExam());
	}

	
	
	@Override
	public Exam findExamById(Long idE) {
		String sql = "SELECT * FROM `exam` WHERE idexam=?";
		return query(sql, new ExamMapper(),idE).get(0);
	}
	

}
