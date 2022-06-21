package com.treatTrip.app.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.treatTrip.app.member.MemberLoginOkAction;
import com.treatTrip.action.ActionForward;

public class MemberFrontController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//��泥��� URI
		String requestURI = req.getRequestURI();
		
		//諛�蹂듬���� 湲곕낯 寃쎈�(www.naver.com, treatTrip ��)
		String contextPath = req.getContextPath();
		
		//��泥��� URI���� 諛�蹂듬���� 湲곕낯 寃쎈�瑜� ���명�� 寃쎈�(�ъ�⑹�� ��泥� 醫�瑜�瑜� ���명�� �� ����)
		String command = requestURI.substring(contextPath.length());
		
		//���〓갑��, ���듦꼍濡�媛� ���몃�� �대����
		ActionForward forward = null;
		
		//遺�湲� 泥�由�(�ъ�⑹���� ��泥��� 留��� ���듭�� ����)
		switch(command) {
		case "/member/MemberJoin.me": //����媛��� ���댁�濡� �대��
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/member/joinForm.html");
			break;
		case "/member/MemberJoinOk.me": //����媛��� ��猷� 踰��� �대┃ ��
			try {
				forward = new MemberJoinOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/member/MemberCheckIdOk.me" : //����媛��� �� ���대�� 以�蹂듭껜��
			try {
				forward = new MemberCheckIdOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/member/MemberCheckEmailOk.me" : //����媛��� �� �대��� 以�蹂듭껜��
			try {
				forward = new MemberCheckEmailOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/member/MemberSendEmail.me" : //비밀번호를 잊으셨나요? 클릭 시 
			try {
				forward = new MemberSendEmailAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/member/MemberLogin.me": // 濡�洹몄�� ���댁�濡� �대��
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("../LoginForm.jsp");
			break;
		case "/member/MemberLoginOk.me": //濡�洹몄�� 踰��� �대┃ �� 
			try {
				forward = new MemberLoginOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/member/MemberUpdateInfoOk.me": //湲곕낯 ��蹂� ���� ��猷� 踰��� �대┃ ��
			try {
				forward = new MemberUpdateInfoOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;	
		case "/member/MemberChangeProfilePictureAction.me": //�ъ�蹂�寃� ��瑜� ��
			try {
				forward = new MemberUpdateInfoOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;	
		case "/member/MemberAddInfoOk.me": //異�媛� ��蹂� ���� ��猷� 踰��� �대┃ ��
			try {
				forward = new MemberAddInfoOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;	
		case "/member/MemberChangePwOk.me": //鍮�諛�踰��� 蹂�寃� �대┃ ��
			try {
				forward = new MemberChangePwOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;	
		case "/member/MemberLogOut.me":	//濡�洹몄���� �대┃ ��
			try {
				forward = new MemberLogOutAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/member/MemberProfileOpen.me":	//留��댄���댁� �대┃��
			try {
				forward = new MemberProfileOpen().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/member/MemberFindfriendOpen.me":	//移�援ъ갼湲� �대┃��
			try {
				forward = new MemberFindfriendOpen().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/member/MemberSearchfriendAction.me":	//移�援ъ갼湲곗갹���� search�대┃��
			try {
				forward = new MemberSearchfriendAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/member/MemberFriendRequestAction.me":	//移�援ъ�媛� 踰��� ��瑜쇱��
			try {
				forward = new MemberFriendRequestAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/member/MemberFriendRequestOpen.me":	//移�援ъ��泥�蹂닿린 ��瑜쇱��
			try {
				forward = new MemberFriendRequestOpen().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/member/MemberRequestCancle.me":	//蹂대�� 移�援� ��泥� 痍⑥��
			try {
				forward = new MemberRequestCancle().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/member/MemberRequestAccept.me":	//諛��� 移�援� ��泥� ����
			try {
				forward = new MemberRequestAccept().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/member/MemberRequestRefuse.me":	//諛��� 移�援� ��泥� 嫄곗��
			try {
				forward = new MemberRequestRefuse().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		default: // 鍮��������� 寃쎈��� 寃쎌��(��紐삳�� 寃쎈��� 寃쎌��)
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/error/404.jsp");
		}
		
		//forward媛� null�� �����쇰㈃, ���듭�� �� 怨녹���� 泥�由ы��寃��ㅻ�� ��誘몄�대��.
		if(forward != null) {
			if(forward.isRedirect()) {
				//���〓갑���� redirect�� 寃쎌��
				resp.sendRedirect(forward.getPath());
			}else {
				//���〓갑���� forward�� 寃쎌��
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
	}
}





















