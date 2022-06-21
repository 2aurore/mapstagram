package com.treatTrip.app.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.treatTrip.action.ActionForward;

public class BoardFrontController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	public BoardFrontController() {;}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	//분기처리
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		ActionForward forward = null;
		
		PrintWriter out = resp.getWriter();
		//out.println("frontController");
		
		switch (command) {
		case "/board/SummernoteImgUploadOk.bo":	//이미지 경로 지정 설정
			try {
				forward = new SummernoteImgUploadOk().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/board/PositionAddOk.bo":		//게시글 작성버튼 클릭 시 지도좌표 우선 DB등록
			try {
				forward = new PositionAddOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/board/boardWriteSave.bo":	//게시글 DB 등록 
			try {
				forward = new BoardWriteSaveAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}			
			break;
		case "/board/boardSaveOk.bo":		//게시글 DB 저장 정상 
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath( req.getContextPath() + "/app/board/boardMapPage.jsp");
			break;
			
		case "/board/BoardView.bo":			//게시글 불러오기 
			try {
				forward = new BoardViewOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		case "/board/SearchBoards.bo":			//Search
			try {
				forward = new SearchBoardsAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/board/MainMapPage.bo":		//메인 페이지로 이동하는 url
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(req.getContextPath()+"/app/board/boardMapPage.jsp");
			break;
			
		case "/board/BoardReplyOk.bo":		//댓글 등록 저장하는 url
			try {
				forward = new BoardReplySaveAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		
		case "/board/ShowAllReply.bo":	//해당 게시글의 모든 댓글 뿌리기
			try {
				forward = new BoardReplyViewAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/map/allPosition.bo":			//모든 회원이 작성한 게시글의 위치 가져오기
			try {
				forward = new GetAllPosition().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}break;
		default:				//에러 페이지로 이동
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath( req.getContextPath() + "/app/error/error404.html");
			break;
		}
		
		
		
		
		if(forward != null) {
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
	}
	
	
	
	
	
	
	
}
