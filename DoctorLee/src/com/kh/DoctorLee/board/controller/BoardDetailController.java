package com.kh.DoctorLee.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.board.model.service.BoardService;
import com.kh.DoctorLee.board.model.vo.Board;

/**
 * Servlet implementation class BoardDetailView
 */
@WebServlet("/detail.bo")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String type = String.valueOf(request.getParameter("type"));
		int memNo = 0;
		memNo =  Integer.parseInt(request.getParameter("memNo"));
		Board b = new BoardService().selectBoard(boardNo, memNo);
		
		if(b != null) { // 게시글 조회에 성공 했을 경우
			
			request.setAttribute("b", b);
			request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
			
		} else { // 게시글 조회 실패 했을 경우
			request.getSession().setAttribute("alertMsg", "게시글 조회에 실패 했습니다. 다시 시도해주십시오.");
			response.sendRedirect(request.getContextPath() + "/list.bo");
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
