package com.kh.DoctorLee.mpBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.DoctorLee.member.model.vo.Member;
import com.kh.DoctorLee.mpBoard.model.service.DiaryService;
import com.kh.DoctorLee.mpBoard.model.vo.FamDiary;
import com.kh.DoctorLee.mpBoard.model.vo.MyDiary;

/**
 * Servlet implementation class DiaryListController
 */
@WebServlet("/list.di")
public class DiaryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		
		
		
		
		ArrayList<MyDiary> list = new DiaryService().selectMyDiary(memNo);
		request.setAttribute("list", list);
		ArrayList<FamDiary> famList = new DiaryService().selectFamDiary();
		request.setAttribute("famList", famList);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/myPage/diary.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
