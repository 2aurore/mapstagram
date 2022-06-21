package com.treatTrip.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;
import com.treatTrip.app.member.dao.MemberDAO;

public class MemberCheckEmailOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("member_email");
		MemberDAO m_dao = new MemberDAO();

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(m_dao.checkEmail(email)) {
			out.println("fail");	
		}else {
			out.println("success");
		}
		out.close();
		return null;
	}
}














