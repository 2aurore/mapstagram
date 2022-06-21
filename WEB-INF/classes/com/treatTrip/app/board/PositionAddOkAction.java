package com.treatTrip.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;
import com.treatTrip.app.board.dao.MapPositionDAO;
import com.treatTrip.app.board.vo.BoardVO;
import com.treatTrip.app.board.vo.MapPositionVO;

public class PositionAddOkAction implements Action{
	
	public static BoardVO b_vo = new BoardVO();
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		MapPositionVO mp_vo = new MapPositionVO();
		MapPositionDAO mp_dao = new MapPositionDAO();
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();

		//위도와 경도는 double 형태로 작성
		Double lat = Double.parseDouble(request.getParameter("lat"));
		Double lng = Double.parseDouble(request.getParameter("lng"));
		
		b_vo.setMember_id(request.getParameter("member_id"));
		b_vo.setBoard_title(request.getParameter("board_title"));
		b_vo.setBoard_contents(request.getParameter("board_contents"));
		b_vo.setBoard_hidden(request.getParameter("priority"));
		
		//System.out.println("1:"+request.getParameter("member_id"));
		
		if(lat != null) {
			mp_vo.setLat(lat);
			mp_vo.setJuso_1(request.getParameter("juso_1"));
		}
		if (lng != null) {
			mp_vo.setLng(lng);
			mp_vo.setJuso_2(request.getParameter("juso_2"));
		}
		
		
		if (mp_dao.insertPosition(mp_vo)) {
			System.out.println("positionAdd");
			forward.setRedirect(true);
			forward.setPath(request.getContextPath()+"/board/boardWriteSave.bo");
			return forward;
		}
		
		out.println("<script>");
		out.println("alert('게시글 위치 등록 실패. 잠시 후 다시 시도해주세요');");
		out.println("</script>");
		out.close();
		
		return forward;
	}
}
