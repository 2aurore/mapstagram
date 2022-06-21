package com.treatTrip.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;

public class MemberLogOutAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		
		session.invalidate();
		out.println("<script>");
		out.println("alert('로그아웃 되었습니다.');");
		out.println("location.href="+"\""+request.getContextPath()+"/LoginForm.jsp\";");
		out.println("</script>");

		out.close();
		
		return null;
	}
}
