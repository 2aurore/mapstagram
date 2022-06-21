package com.treatTrip.app.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.treatTrip.app.board.vo.MapPositionVO;
import com.treatTrip.mybatis.config.SqlMapConfig;

public class MapPositionDAO {
	
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public MapPositionDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	public int selectPositionSerial() {
		return sqlsession.selectOne("Map.selectSeq");
	}
	
	public MapPositionVO selectBoardJuso(int position_serial) {
		return sqlsession.selectOne("Map.selectJuso", position_serial);
	}
	
	public boolean insertPosition(MapPositionVO mp_vo) {
		if(sqlsession.insert("Map.insertPosition", mp_vo) == 1) {
			System.out.println("insert true");
			return true;
		}
		System.out.println("insert false");
		return false;
	}
	
	
	//지도에 뿌릴 핀 모두 가져오기 (모든 회원)
	public JSONArray selectAllLatLng() {
		List<MapPositionVO> datas =  sqlsession.selectList("Map.selectAllLatLng");
		
		//System.out.println("안녕 "+ datas);
		JSONObject obj;
		JSONArray jArray = new JSONArray();
	
		for (int i = 0; i < datas.size(); i++) {
			MapPositionVO mp_vo = datas.get(i);
			obj  = new JSONObject();
			obj.put("position_serial", mp_vo.getPosition_serial());
			obj.put("lat", mp_vo.getLat());
			obj.put("lng", mp_vo.getLng());
			obj.put("juso_1", mp_vo.getJuso_1());
			obj.put("juso_2", mp_vo.getJuso_2());
			jArray.add(obj);
		}
		//System.out.println("selectAllLatLng 실행");
		//System.out.println(jArray);
		
		return jArray;
	}
	
}
