package com.wild.daos.impl;

import java.util.List;

import com.wild.daos.IHistoryDao;
import com.wild.mapper.GradeMapper;
import com.wild.mapper.HistoryMapper;
import com.wild.models.History;

public class HistoryDao extends AbstractDAO<History> implements IHistoryDao{

	@Override
	public List<History> getListHistoryByIdUser(int idUser) {
		StringBuffer sql = new StringBuffer("SELECT result.iduser,exam.titleexam,result.modifieddate,result.mark FROM ");
		sql.append(" result, exam WHERE result.idexam=exam.idexam and iduser = ?");
		return query(sql.toString(), new HistoryMapper(),idUser);
	}

}
