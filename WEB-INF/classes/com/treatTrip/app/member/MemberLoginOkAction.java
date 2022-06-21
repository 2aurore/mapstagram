package com.treatTrip.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;
import com.treatTrip.app.member.dao.MemberDAO;

public class MemberLoginOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=utf-8");
		
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		MemberDAO m_dao = new MemberDAO();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String member_id = m_dao.login(id, pw);
		
		if(member_id != null) {
			//로그인 성공
			session.setAttribute("member_id", member_id);	
			forward.setRedirect(true);
			forward.setPath(request.getContextPath()+"/app/board/userDirections.jsp");
		}else {
			
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디나 비밀번호를 확인해주세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		
		}
		return forward;
	}
}
















