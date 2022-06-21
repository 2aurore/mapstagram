package com.treatTrip.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;
import com.treatTrip.app.member.dao.MemberDAO;

public class MemberFriendRequestAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		
		MemberDAO m_dao = new MemberDAO();
		
		//친구요청 보낸아이디
		String send_id = request.getParameter("send_id");
		//친구요청 받은아이디
		String receive_id = request.getParameter("receive_id");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		if(send_id.equals(receive_id)) {
			out.println("<script>");
			out.println("alert('본인에게는 친구요청 할 수 없습니다.');");
			out.println("location.href="+"\""+request.getContextPath()+"/member/MemberFindfriendOpen.me?member_id="+member_id+"\";");
			out.println("</script>");
			out.close();
			return null;
		}
		
		if(m_dao.checkFriend(send_id, receive_id) == 1) {
			out.println("<script>");
			out.println("alert('이미 친구입니다.');");
			out.println("location.href="+"\""+request.getContextPath()+"/member/MemberFindfriendOpen.me?member_id="+member_id+"\";");
			out.println("</script>");
			out.close();
			return null;
		}
		
		if(m_dao.checkRequested(send_id, receive_id) == 1) {
			out.println("<script>");
			out.println("alert('이미 친구요청 했습니다.');");
			out.println("location.href="+"\""+request.getContextPath()+"/member/MemberFindfriendOpen.me?member_id="+member_id+"\";");
			out.println("</script>");
			out.close();
			return null;
		}
		
		if(!m_dao.friendrequest(send_id, receive_id)) {
			//실패
			out.println("<script>");
			out.println("alert('친구요청 실패. 잠시 후 다시 시도해주세요');");
			out.println("location.href="+"\""+request.getContextPath()+"/member/MemberFindfriendOpen.me?member_id="+member_id+"\";");
			out.println("</script>");
			out.close();
			return null;
		}
		
		

		out.println("<script>");
		out.println("alert('친구요청이 완료되었습니다.');");
		out.println("location.href="+"\""+request.getContextPath()+"/member/MemberFindfriendOpen.me?member_id="+member_id+"\";");
		out.println("</script>");
		out.close();
		return null;
		
	}

}
