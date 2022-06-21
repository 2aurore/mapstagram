package com.treatTrip.app.board;


import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;
import com.treatTrip.app.board.dao.BoardDAO;
import com.treatTrip.app.board.dao.MapPositionDAO;
import com.treatTrip.app.board.vo.BoardVO;
import com.treatTrip.app.board.vo.MapPositionVO;

public class BoardViewOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 지도에서 선택한 좌표에 있는 게시글을 불러오기 위해서 해당 좌표의 serial 번호가 필요함
		int serial = Integer.parseInt(request.getParameter("serial"));
		//System.out.println(request.getParameter("serial"));
		
		PrintWriter out = response.getWriter();
		BoardDAO b_dao = new BoardDAO();
		//넘겨받은 시리얼을 통해 게시글을 조회하도록 dao 메소드에 전달
		BoardVO b_vo = b_dao.selectBoard(serial);	//테스트 게시글 42번 
		
		MapPositionDAO mp_dao = new MapPositionDAO();
		//넘겨받은 시리얼이 가지고 잇는 도로명/지번 주소를 가져오도록 함
		MapPositionVO mp_vo = mp_dao.selectBoardJuso(serial);
		
		JSONObject jObj = new  JSONObject();
		//게시글의 정보를 jsonObject 객체에 담아서 ajax 통신
		jObj.put("member_id", b_vo.getMember_id());
		jObj.put("board_num", b_vo.getBoard_num());
		jObj.put("board_title", b_vo.getBoard_title());
		jObj.put("board_contents", b_vo.getBoard_contents());
		jObj.put("board_hidden", b_vo.getBoard_hidden());
		jObj.put("board_date", b_vo.getBoard_date());
		jObj.put("board_cnt", b_vo.getBoard_cnt());
		jObj.put("board_heart_cnt", b_vo.getBoard_heart_cnt());
		jObj.put("position_serial", b_vo.getPosition_serial());
		
		jObj.put("juso_1", mp_vo.getJuso_1());
		jObj.put("juso_2", mp_vo.getJuso_2());
		
		//System.out.println(jObj.toJSONString());
		//ajax로 넘어갈 json 데이터를 인코딩하여 전송
		out.println(URLEncoder.encode(jObj.toJSONString(), "UTF-8"));
		out.close();
		return null;
	}
}
