package com.treatTrip.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;
import com.treatTrip.app.board.dao.BoardDAO;
import com.treatTrip.app.board.vo.BoardReplyVO;

public class BoardReplySaveAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		BoardDAO b_dao = new BoardDAO();
		BoardReplyVO br_vo = new BoardReplyVO();
		
		//ajax를 통해 가지고 온 댓글 데이터 
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		br_vo.setBoard_num(board_num);
		br_vo.setReply_memberId(request.getParameter("reply_id"));
		br_vo.setReply_contents(request.getParameter("reply_content"));
		
		if (!b_dao.insertReply(br_vo)) {
			// DB에 댓글 저장이 실패할 경우 들어옴
			out.println("<script>");
			out.println("alert('댓글 저장 실패. 잠시 후 다시 시도해주세요');");
			out.println("</script>");
		}
		
		//System.out.println("boardReplySave");	
		out.close();
		return null;
	}
}
