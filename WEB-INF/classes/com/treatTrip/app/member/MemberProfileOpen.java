package com.treatTrip.app.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;
import com.treatTrip.app.board.vo.BoardVO;
import com.treatTrip.app.member.dao.MemberDAO;
import com.treatTrip.app.member.vo.MemberVO;

public class MemberProfileOpen implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain;charset=utf-8");

		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		MemberDAO m_dao = new MemberDAO();
		String member_id = (String) session.getAttribute("member_id");
		
		String friend_id = request.getParameter("friend_id");
		
		List<MemberVO> friendList = m_dao.getFriends(member_id);
		List<BoardVO> boardList = m_dao.getBoardById(member_id);
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
		
		session.setAttribute("member_id", member_id);	
		session.setAttribute("myfriendCnt", m_dao.getMyfriendCnt(member_id));	
		session.setAttribute("myboardCnt", m_dao.getMyBoardCnt(member_id));	
		session.setAttribute("mInfo", m_dao.getInfo(member_id));
		
		session.setAttribute("boardList", m_dao.getBoardById(member_id));
		session.setAttribute("srcList", srcList);
		session.setAttribute("friendList", friendList);
		
		//보낸 친구요청 수
		session.setAttribute("sendCnt", m_dao.sendRequestCnt(member_id));
		//받은 친구요청 수
		session.setAttribute("receiveCnt", m_dao.receiveRequestCnt(member_id));

		
		forward.setRedirect(false);
		
		if(friend_id != null) {
			MemberVO friend = m_dao.getIdInfo(friend_id);
			request.setAttribute("friend", friend);
			request.setAttribute("friend_cnt", m_dao.getMyfriendCnt(friend_id));
			request.setAttribute("board_cnt", m_dao.getMyBoardCnt(friend_id));
			forward.setPath("/app/board/profile/friend/friend_profile.jsp");
		}else {
			forward.setPath("/app/board/profile.jsp");
		}
		
		return forward;
	}

}
