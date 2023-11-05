package com.kh.DoctorLee.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.board.model.service.BoardServiceImpl;
import com.kh.DoctorLee.board.model.vo.Board;

/**
 * Servlet implementation class BoardUpdateCotroller
 */
@WebServlet("/update.bo")
public class BoardUpdateCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateCotroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int boardType = Integer.parseInt(request.getParameter("boardType"));
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		
		Board b = new Board();
		
		b.setBoardType(boardType);
		b.setBoardTitle(boardTitle);
		b.setBoardContent(boardContent);
		b.setBoardNo(boardNo);
		
		System.out.println("보드 업데이트 컨트롤러 boardType 받아 왔는지" + b);
		int result = new BoardServiceImpl().updateBoard(b);
		
		if(result > 0) { // 게시글 업데이트 성공
			request.setAttribute("alertMsg", "게시글 수정에 성공하였습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.bo?boardNo=" + boardNo + "&memNo=" + memNo);
		} else { // 게시글 업데이트 실패
			request.setAttribute("alertMsg", "게시글 수정에 실패하였습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.bo?boardNo=" + boardNo + "&memNo=" + memNo);
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
