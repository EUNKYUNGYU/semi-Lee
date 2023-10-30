package com.kh.DoctorLee.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.board.model.service.BoardServiceImpl;

/**
 * Servlet implementation class BoardDeleteController
 */
@WebServlet("/delete.bo")
public class BoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		int result = new BoardServiceImpl().deleteBoard(boardNo);
		
		if(result > 0) { // 게시글 삭제에 성공 한 경우
			request.getSession().setAttribute("alertMsg", "게시글이 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.bo?cpage=1&type=20");
			
		} else { // 게시글 삭제에 실패 한 경우
			request.getSession().setAttribute("alertMsg", "게시글 삭제에 실패하셨습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.bo?boardNo=" + boardNo);
			
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
