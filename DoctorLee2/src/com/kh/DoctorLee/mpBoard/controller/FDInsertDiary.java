package com.kh.DoctorLee.mpBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.mpBoard.model.service.DiaryService;
import com.kh.DoctorLee.mpBoard.model.vo.FamDiary;

/**
 * Servlet implementation class FDInsertDiary
 */
@WebServlet("/famInsert.di")
public class FDInsertDiary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FDInsertDiary() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		String famDirTitle = request.getParameter("title");
		String famDirContent = request.getParameter("content");
		
		FamDiary fd = new FamDiary();
		
		fd.setFamDirTitle(famDirTitle);
		fd.setFamDirContent(famDirContent);
		
		int result = new DiaryService().insertFamDiary(fd);
		
		
		
		
		
		
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/list.di");
		}else {
			request.setAttribute("errorMsg", "등록 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp");
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
