package com.treatTrip.app.board;

import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.treatTrip.action.Action;
import com.treatTrip.action.ActionForward;


public class SummernoteImgUploadOk implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain;charset=utf-8");
		
		
		PrintWriter out = response.getWriter();
		
		//실제 이미지를 업로드 시킬 임시 폴더 경로
//		String uploadTmpPath = "D:\\GB_0900_JIEUN\\JSP\\workspace\\Treat_Trip\\WebContent\\app\\uploadPath\\temp";
		String uploadTmpPath = "D:\\GB_0900_07_KDK\\JSP프로젝트\\workspace\\Treat_Trip\\WebContent\\app\\uploadPath\\temp";
		
		int fileSize = 10 * 1024 * 1024; //첨부파일 크기 10MB 제한
		String fileName ="";

		//서버 객체 (파일 업로드)선언
		MultipartRequest multi = null;
		try {
			//DefaultFileRenamePolicy : 파일 업로드 및 다운로드 정책(같은 이름이 존재하면 자동으로 이름이 변경되도록 한다)
			multi = new MultipartRequest(request, uploadTmpPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			String file = (String)files.nextElement();
			fileName = multi.getFilesystemName(file);
			
			//System.out.println(1);
			//out.println("fileName: "+fileName);
			
		} catch (Exception e) {
			e.printStackTrace();
			out.println("이미지 경로 변경 실패");
		}
		
		uploadTmpPath = request.getContextPath() + "/app/uploadPath/temp/" + fileName;
		//System.out.println(2);
		//out.print("<img style='width=200px;' src='");
		System.out.println(uploadTmpPath);
		out.print(uploadTmpPath);
		//out.println("' >");
		//System.out.println("경로 수정 : "+uploadTmpPath);
		out.close();
		return null;
	
	}
	
}
