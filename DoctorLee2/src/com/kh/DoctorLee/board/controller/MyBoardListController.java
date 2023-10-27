package com.kh.DoctorLee.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.board.model.service.BoardService;
import com.kh.DoctorLee.board.model.vo.Board;
import com.kh.DoctorLee.common.model.vo.PageInfo;

/**
 * Servlet implementation class MyBoardListController
 */
@WebServlet("/list.mbo")
public class MyBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyBoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		
		int listCount = new BoardService().selectListCountMyBoard(memNo);
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageLimit = 10;
		int boardLimit = 15;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage= startPage + pageLimit - 1;
		if(endPage > maxPage ) endPage = maxPage;
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit,boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Board> list = new BoardService().selectMyBoardList(memNo, pi);
		
		
		request.setAttribute("memId", list.get(0).getMemId());
		request.setAttribute("nickname", list.get(0).getWriter());
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("memNo", memNo);
		
		request.getRequestDispatcher("views/board/myBoardListView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
