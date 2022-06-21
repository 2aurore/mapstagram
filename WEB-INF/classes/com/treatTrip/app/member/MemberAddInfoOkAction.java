package com.treatTrip.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;
import com.treatTrip.app.member.dao.MemberDAO;
import com.treatTrip.app.member.vo.MemberVO;

public class MemberAddInfoOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		MemberDAO m_dao = new MemberDAO();
		MemberVO m_vo = new MemberVO();
		
		String str_birth = request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day");
		
		if(!request.getParameter("month").equals("월")) {
			m_vo.setBirth(str_birth);
		}else {
			m_vo.setBirth("");
		}
		
		m_vo.setMember_id((String)session.getAttribute("member_id"));
		m_vo.setMember_tel(request.getParameter("member_tel"));
		m_vo.setMember_postCode((String)request.getParameter("member_postCode"));
		m_vo.setAddr(request.getParameter("addr"));
		m_vo.setAddr_detail(request.getParameter("addr_detail"));
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if(!m_dao.addInfo(m_vo)) {
			//실패
			out.println("<script>");
			out.println("alert('정보 저장에 실패했습니다. 잠시 후 다시 시도해주세요');");
			out.println("</script>");
			out.close();
			return null;
		}

		session.setAttribute("mInfo", m_dao.getInfo((String)session.getAttribute("member_id")));
		
		out.println("<script>");
		out.println("alert('정보가 변경되었습니다.');");
		out.println("location.href="+"\""+request.getContextPath()+"/app/board/profileSet.jsp\";");
		out.println("</script>");
		out.close();

		return null;
	}
}


















