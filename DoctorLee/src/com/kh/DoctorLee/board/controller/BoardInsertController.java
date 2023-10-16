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
		
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String category = request.getParameter("category");
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		
		Board b = new Board();
		b.setBoardTitle(boardTitle);
		b.setBoardContent(boardContent);
		b.setBoardName(category);
		
		System.out.println("인서트 보드 컨트롤러에서 category " + category + b);
		
		int result = new BoardService().insertBoard(b, memNo);
		
		if(result > 0) { // 게시글 작성 성공
			// 나중에 게시글 상세보기 만들어지면 거기로 리다이렉트하기, 지금은 그냥 게시판 리스트로
			request.setAttribute("alertMsg", "게시글 작성에 성공하였습니다.");
			response.sendRedirect(request.getContextPath() + "/list.bo?cpage=1&type="+ category);
		} else { // 게시글 작성 실패
			request.setAttribute("alertMsg", "게시글 작성에 성공하였습니다.");
			response.sendRedirect(request.getContextPath() + "/list.bo?cpage=1&type="+ category);
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
