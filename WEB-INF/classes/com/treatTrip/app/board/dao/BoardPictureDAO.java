package com.treatTrip.app.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.treatTrip.mybatis.config.SqlMapConfig;

public class BoardPictureDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public BoardPictureDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	
}
