package com.wild.daos.impl;

import java.sql.Date;
import java.text.SimpleDateFormat;

import com.wild.daos.GenericDAO;
import com.wild.daos.IResultDao;
import com.wild.mapper.QuestionMapper;
import com.wild.mapper.ResultMapper;
import com.wild.models.Result;

public class ResultDao extends AbstractDAO<Result> implements IResultDao{

	@Override
	public Boolean checkExistResultByIdExamAndUser(Long idExam, Long idUser) {
		String sql = "SELECT * FROM `result` WHERE iduser = ? and idexam = ?";
		return query(sql, new ResultMapper(),idUser,idExam).size() !=0 ? true:false;
	}

	@Override
	public int addResutlByIdExam(Long idExam, Long idUser,float mark) {
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(System.currentTimeMillis());
		String dateConver = formatter.format(date);
		System.out.println(idUser+" "+idExam);
		System.out.println(checkExistResultByIdExamAndUser(idExam,idUser));
		
		if(!checkExistResultByIdExamAndUser(idExam,idUser)) {
			StringBuilder sql = new StringBuilder("INSERT INTO result (");
			sql.append("iduser,idexam,createddate,modifieddate,testday,mark) ");
			sql.append("VALUES(?,?,?,?,?,?)");
			System.out.println(sql.toString());
			return update(sql.toString(),idUser,idExam,dateConver,dateConver,dateConver,mark);
		}
		return 0;
	}

		
}
