package com.treatTrip.app.member;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;
import com.treatTrip.app.member.dao.MemberDAO;
import com.treatTrip.app.member.vo.MemberVO;

public class MemberFindfriendOpen implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		MemberDAO m_dao = new MemberDAO();
		
		//세션에서 받아온 로그인된 회원의 아이디
//		String member_id = (String) session.getAttribute("member_id");
		String member_id = request.getParameter("member_id");

		//친구의친구 정보를 arraylist로 받아옴
		ArrayList<MemberVO> ff_Array = m_dao.getMyFriendOfFriendInfo(member_id);
		
		List<MemberVO> f_List = m_dao.getFriends(member_id);
		
		Set<MemberVO> ff_Set = new HashSet<>();
		boolean flag = true;
		for (int i = 0; i < ff_Array.size(); i++) {
			flag = true;
			for(int j = 0; j < f_List.size(); j++) {
				if(ff_Array.get(i).equals(f_List.get(j))) {
					flag = false;
					break;
				}
			}
			if(flag) {
				ff_Set.add(ff_Array.get(i));
			}
		}
		//회원의 친구의 친구 수
		int ffcnt = ff_Set.size();
//		System.out.println("친친수 : " + ffcnt);
		
		//세션에 친구의친구 수 를 넘김
		request.setAttribute("ffcnt", ffcnt);
		//세션에 내 아이디를 넘김
		session.setAttribute("member_id", member_id);
		//세션에 내 친구의친구들 정보를 넘김
		request.setAttribute("ff_Set", ff_Set);
		
		
//		PrintWriter out = response.getWriter();
//		out.print(m_jsonArray);
//		out.close();
		
		forward.setRedirect(false);
		forward.setPath("/app/board/findFriend.jsp");
		
		return forward;
	}

}
