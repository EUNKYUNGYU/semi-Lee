package com.kh.DoctorLee.quiz.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.quiz.model.service.QuizService;
import com.kh.DoctorLee.quiz.model.vo.Quiz;

/**
 * Servlet implementation class QuizListController
 */
@WebServlet("/list.qz")
public class QuizListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuizListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int listCount = new QuizService().selectListCount();
		int currentPage = currentPage = Integer.parseInt(request.getParameter("cpage"));
		System.out.println("QuizListController 에서currentPage  " + currentPage);
		int pageLimit = 10;
		int boardLimit = 5;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage= startPage + pageLimit - 1;
		System.out.println("listCount" + listCount);
		if(endPage > maxPage ) endPage = maxPage;
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit,boardLimit, maxPage, startPage, endPage);
		
		
		ArrayList<Quiz> list = new QuizService().selectList(pi);
		
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.getRequestDispatcher("views/quiz/quizListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
