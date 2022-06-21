package com.treatTrip.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;

public class MemberChangeProfilePictureAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		//바꾸기로 선택한 이미지 파일명
		String img = "";
		
		session.setAttribute("imgsrc", img);
		
		PrintWriter out = response.getWriter();
		out.print(img);
		out.close();
		
		return null;
	}

}
