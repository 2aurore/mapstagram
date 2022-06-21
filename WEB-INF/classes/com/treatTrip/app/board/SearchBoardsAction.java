package com.treatTrip.app.board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;
import com.treatTrip.app.board.dao.BoardDAO;
import com.treatTrip.app.board.vo.BoardVO;

public class SearchBoardsAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		BoardDAO b_dao = new BoardDAO();
		String keyword = request.getParameter("search");
		List<BoardVO> boardList = b_dao.searchBoards(keyword);
		List<String> srcList = new ArrayList<>();
		//게시글에 이미지가 있으면 해당 img src 저장
		for(BoardVO board : boardList) {
			String content = board.getBoard_contents();
			if(content.contains("<img")) {
				String temp = content.substring(content.indexOf("\"") + 1);
				srcList.add(temp.substring(0, temp.indexOf("\"")));
			}else {
				srcList.add(null);
			}
		}
		
		session.setAttribute("searchBoardList", b_dao.searchBoards(keyword));
		session.setAttribute("searchSrcList", srcList);
		System.out.println(request.getContextPath());
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/app/board/search.jsp");
		return forward;
	}

}
