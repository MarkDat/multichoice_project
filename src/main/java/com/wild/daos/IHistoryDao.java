package com.wild.daos;

import java.util.List;

import com.wild.models.History;

public interface IHistoryDao extends GenericDAO<History>{
		List<History> getListHistoryByIdUser(int idUser);
}
