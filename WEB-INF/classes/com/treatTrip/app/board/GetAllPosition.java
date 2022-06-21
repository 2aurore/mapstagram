package com.treatTrip.app.board;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;
import com.treatTrip.app.board.dao.MapPositionDAO;

public class GetAllPosition implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		MapPositionDAO mp_dao = new MapPositionDAO();
		
		//DB에 가지고 있는 모든 위치의 좌표와 주소 정보를 가지고 옴
		JSONArray jArray = mp_dao.selectAllLatLng();
		
//		out.println(jArray.toJSONString());
		//비동기 통신으로 해당 좌표를 모두 전송함
		out.println(URLEncoder.encode(jArray.toJSONString(), "UTF-8"));
		out.close();
		return null;
	}
}
