package com.treatTrip.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;
import com.treatTrip.app.member.dao.MemberDAO;
public class MemberChangePwOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
//		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		MemberDAO m_dao = new MemberDAO();
		
		String id = (String)session.getAttribute("member_id");
		String pw = request.getParameter("newPw");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if(!m_dao.changePw(id, pw)) {
			//실패
			out.println("<script>");
			out.println("alert('정보 저장에 실패했습니다. 잠시 후 다시 시도해주세요');");
			out.println("</script>");
			out.close();
			return null;
		}

		session.setAttribute("mInfo", m_dao.getInfo((String)session.getAttribute("member_id")));

		out.println("<script>");
		out.println("alert('비밀번호가 변경되었습니다.');");
		out.println("location.href="+"\""+request.getContextPath()+"/app/board/profileSet.jsp\";");
		out.println("</script>");
		out.close();
		
		
		return null;
	}
}


















