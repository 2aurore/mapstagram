package com.treatTrip.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;
import com.treatTrip.app.member.dao.MemberDAO;
import com.treatTrip.app.member.vo.MemberVO;
//컨트롤러(Controller)
//회원가입 완료 시 DB와 연동
public class MemberJoinOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		MemberDAO m_dao = new MemberDAO();
		MemberVO m_vo = new MemberVO();
		
		m_vo.setMember_id(request.getParameter("member_id"));
		m_vo.setMember_pw(request.getParameter("member_pw"));
		m_vo.setMember_name(request.getParameter("member_name"));
		m_vo.setMember_email(request.getParameter("member_email"));
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if(!m_dao.join(m_vo)) {
			//실패
			out.println("<script>");
			out.println("alert('회원가입 실패. 잠시 후 다시 시도해주세요');");
			out.println("</script>");
			out.close();
			return null;
		}
		
	/*	forward.setRedirect(false);
		forward.setPath("/member/MemberLogin.me");
		return forward;*/

		out.println("<script>");
		out.println("alert('회원가입이 완료되었습니다.');");
		out.println("window.close();");
		out.println("</script>");
		out.close();
		return null;
		
	}
}


















