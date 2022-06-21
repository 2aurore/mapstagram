package com.treatTrip.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;
import com.treatTrip.app.board.dao.BoardDAO;
import com.treatTrip.app.board.dao.BoardPictureDAO;
import com.treatTrip.app.board.dao.MapPositionDAO;
import com.treatTrip.app.board.vo.BoardVO;

public class BoardWriteSaveAction implements Action {
	//해당 클래스에 static b_vo 객체를 가져오기 위해  선언
	public static PositionAddOkAction posAdd = new PositionAddOkAction();
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();
		
		BoardDAO b_dao = new BoardDAO();
		//positionAction에 전달 된 작성 게시글의 내용을 담고 잇는 b_vo 객체를 전달받음
		BoardVO b_vo = posAdd.b_vo;
		MapPositionDAO mp_dao = new MapPositionDAO();
		
		//작성한 게시글을 저장하기 위해 가장 최신에 작성한 게시글의 좌표를 불러오는 메소드 사용
		b_vo.setPosition_serial(mp_dao.selectPositionSerial());
		
		if (b_dao.insertBoard(b_vo)) {
			//System.out.println("boardWriteSave");
			forward.setRedirect(true);
			//게시글 등록이 성공하면 메인 지도 페이지로 이동시킴
			forward.setPath(request.getContextPath() + "/board/boardSaveOk.bo");
			return forward;
		}
		
		out.println("<script>");
		out.println("alert('게시글 등록 실패. 잠시 후 다시 시도해주세요');");
		out.println("</script>");
		out.close();
		
		return forward;
	}

}
