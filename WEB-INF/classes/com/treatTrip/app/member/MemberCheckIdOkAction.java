package com.treatTrip.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;
import com.treatTrip.app.member.dao.MemberDAO;

public class MemberCheckIdOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("member_id");
		MemberDAO m_dao = new MemberDAO();

		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		if(m_dao.checkId(id)) {
			out.println("not-ok");	
		}else {
			out.println("ok");
		}
		out.close();
		return null;
	}
}














