package com.treatTrip.app.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.treatTrip.app.board.vo.BoardReplyVO;
import com.treatTrip.app.board.vo.BoardVO;
import com.treatTrip.mybatis.config.SqlMapConfig;

public class BoardDAO {
	
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public BoardDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	
	//게시글 업로드 및 조회 관련 메소드
	public BoardVO selectBoard(int position_serial) {
		return sqlsession.selectOne("Board.selectBoard", position_serial);
	}

	public List<BoardVO> searchBoards(String keyword) {
		return sqlsession.selectList("Board.searchBoards", keyword);
	}
	
	public boolean insertBoard(BoardVO board) {
		if(sqlsession.insert("Board.insertBoard", board) == 1) {
			return true;
		}
		return false;
	}
	
	public void updateBoardCount(int board_num) {
		sqlsession.update("Board.updateReadCount", board_num);
	}
	
	
	//게시글의 댓글 관련 메소드
	public JSONArray selectAllReply(int board_num) {
		List<BoardReplyVO> datas = sqlsession.selectList("Board.selectAllReply", board_num);
		//System.out.println("들어옴ㄴ");
		//System.out.println(board_num);
		
		JSONObject obj;
		JSONArray jArray = new JSONArray();
		for (int i = 0; i < datas.size(); i++) {
			BoardReplyVO br_vo = datas.get(i);
			obj  = new JSONObject();
			obj.put("reply_id", br_vo.getReply_memberId());
			obj.put("reply_contents", br_vo.getReply_contents());
			obj.put("reply_date", br_vo.getReply_date());
			jArray.add(obj);
		}
		return jArray;
	}
	
	public boolean insertReply(BoardReplyVO br_vo) {
		if (sqlsession.insert("Board.insertReply", br_vo) == 1) {
			return true;
		}
		return false;
	}
	
}
