package com.kh.DoctorLee.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.DoctorLee.board.model.service.BoardService;
import com.kh.DoctorLee.board.model.vo.Board;


/**
 * Servlet implementation class BoardInsertController
 */
@WebServlet("/insert.bo")
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String category = request.getParameter("category");
		
		Board b = new Board();
		b.setBoardTitle(boardTitle);
		b.setBoardContent(boardContent);
		b.setBoardName(category);
		
		int result = new BoardService().insertBoard(b, memNo);
		
		HttpSession session = request.getSession();
		
		if(result > 0) { // 게시글 작성 성공
			// 나중에 게시글 상세보기 만들어지면 거기로 리다이렉트하기, 지금은 그냥 게시판 리스트로
			//session.setAttribute("alertMsg", "게시글 작성에 성공하였습니다.");
			request.getRequestDispatcher("/list.bo?cpage=1&type="+ category).forward(request, response);
		} else { // 게시글 작성 실패
			session.setAttribute("alertMsg", "게시글 작성에 실패하였습니다.");
			request.getRequestDispatcher("/list.bo?cpage=1&type="+ category).forward(request, response);
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
