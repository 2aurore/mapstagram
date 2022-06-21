package com.treatTrip.app.board;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;
import com.treatTrip.app.board.dao.BoardDAO;

public class BoardReplyViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//게시글에 작성된 댓글을 가지고 오기 위해 우선 게시글의 번호를 가지고 와서 integer.parse
		int board_num = Integer.parseInt(request.getParameter("board_num")) ;
		
		PrintWriter out = response.getWriter();
		BoardDAO b_dao = new BoardDAO();
		
		//해당 게시글 번호를 가지고 있는 댓글들을 모두 가지고 옴
		JSONArray jArray = b_dao.selectAllReply(board_num);
		//json데이터로 ajax로 데이터를 넘겨줌, 한글 깨짐 방지를 위해 URLEncoder 사용
		out.println(URLEncoder.encode(jArray.toJSONString(), "UTF-8"));
		out.close();
		return null;
	}
}
