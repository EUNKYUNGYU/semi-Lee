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
 * Servlet implementation class BoardUpdateForm
 */
@WebServlet("/updateForm.bo")
public class BoardUpdateForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		System.out.println("보드 업데이트 폼 컨트롤러  boardNo" + boardNo);
		Board b = new BoardService().selectBoard(boardNo);
		System.out.println("보드 업데이트 폼 컨트롤러 b받아왔나" + b);
		
		if(b != null) { // 게시글 정보 가져오기 성공
			
			request.setAttribute("b", b);
			request.getRequestDispatcher("views/board/boardUpdateForm.jsp").forward(request, response);
			
		} else { // 게시글 정보 가져오기 실패
			request.setAttribute("alertMsg", "게시글 수정에 실패하였습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.bo?" + boardNo);
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
