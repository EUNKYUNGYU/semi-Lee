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
		

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String diaryNo = request.getParameter("diaryNo");
		String diaryTitle = request.getParameter("title");
		String createDate = request.getParameter("createDate");
		
		MyDiary md = new MyDiary();
		new DiaryService().insertMyDiary(md);
		
		
	}

}
