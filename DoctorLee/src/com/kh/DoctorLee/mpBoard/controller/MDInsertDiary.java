package com.kh.DoctorLee.mpBoard.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.mpBoard.model.service.DiaryService;
import com.kh.DoctorLee.mpBoard.model.vo.MyDiary;

/**
 * Servlet implementation class MDInsertDiary
 */
@WebServlet("/myInsert.di")
public class MDInsertDiary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MDInsertDiary() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String diaryTitle = request.getParameter("title");
		String diaryContent = request.getParameter("content");
		
		MyDiary md = new MyDiary();
		
		md.setDiaryTitle(diaryTitle);
		md.setDiaryContent(diaryContent);
		
		int result = new DiaryService().insertMyDiary(md);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/myEnroll.di");
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
