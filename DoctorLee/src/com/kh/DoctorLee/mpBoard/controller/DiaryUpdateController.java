package com.kh.DoctorLee.mpBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.mpBoard.model.service.DiaryService;
import com.kh.DoctorLee.mpBoard.model.vo.MyDiary;

/**
 * Servlet implementation class DiaryUpdateController
 */
@WebServlet("/update.di")
public class DiaryUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int diaryNo = Integer.parseInt(request.getParameter("dno"));
		String diaryTitle = request.getParameter("title");
		String diaryContent=request.getParameter("content");
		
		MyDiary md = new MyDiary();
		md.setDiaryNo(diaryNo);
		md.setDiaryTitle(diaryTitle);
		md.setDiaryContent(diaryContent);
		
		int result = new DiaryService().updateDiary(md);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/detail.di?dno=" + diaryNo);
		} else {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);;
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
