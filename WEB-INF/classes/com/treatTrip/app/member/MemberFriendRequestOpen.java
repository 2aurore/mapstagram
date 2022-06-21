package com.treatTrip.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;
import com.treatTrip.app.member.dao.MemberDAO;

public class MemberFriendRequestOpen implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		HttpSession session = request.getSession();
//		ActionForward forward = new ActionForward();
		
		MemberDAO m_dao = new MemberDAO();
		
		//세션에서 받아온 로그인된 회원의 아이디
		String member_id = (String) session.getAttribute("member_id");
//		String member_id = request.getParameter("member_id");
//		System.out.println("회원아이디 : " + member_id);
		
		//내가보낸 친구요청과 받은 친구요청을 받은 JSONArray
		JSONArray requestFriend = m_dao.getRequestFriendInfo(member_id);
		
		//보낸 친구요청 수
		session.setAttribute("sendCnt", m_dao.sendRequestCnt(member_id));
		//받은 친구요청 수
		session.setAttribute("receiveCnt", m_dao.receiveRequestCnt(member_id));
		
		PrintWriter out = response.getWriter();
		out.print(requestFriend);
		out.close();
		
		return null;
	}

}
