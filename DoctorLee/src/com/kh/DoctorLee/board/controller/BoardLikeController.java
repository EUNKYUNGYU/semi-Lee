package com.kh.DoctorLee.board.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.board.model.service.BoardService;
import com.kh.DoctorLee.board.model.service.BoardServiceImpl;

/**
 * Servlet implementation class BoardLikeController
 */
@WebServlet("/like.bo")
public class BoardLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardLikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		HashMap<String, Integer> map = new HashMap();
		map.put("memNo", memNo);
		map.put("boardNo", boardNo);
		
		int resultLike = new BoardServiceImpl().selectLike(map);
		int result = 0;
		System.out.println("좋아요컨트롤러 memNo " + memNo + "boardNo" + boardNo + "resultLike " + resultLike);
		
		if(resultLike > 0) { // 좋아요가 이미 되어 있을 경우 -> 좋아요 취소
			result = new BoardServiceImpl().deleteLike(map);
			if(result > 0) { // 좋아요  취소가 된 경우
				System.out.println("좋아요 취소 ");
				response.sendRedirect(request.getContextPath() + "/detail.bo?memNo=" + memNo + "&boardNo=" + boardNo);
			} else { // 좋아요 취소가 안 된 경우
				request.setAttribute("alertMsg", "다시 시도해주십시오.");
				response.sendRedirect(request.getContextPath() + "/detail.bo?memNo=" + memNo + "&boardNo=" + boardNo);
			}
			
		} else { // 좋아요가 되어 있지 않은 경우 -> 좋아요 누르기
			result = new BoardServiceImpl().insertLike(map);
			if(result > 0) { // 좋아요  누르기가 된 경우
				System.out.println("좋아요 ");
				response.sendRedirect(request.getContextPath() + "/detail.bo?memNo=" + memNo + "&boardNo=" + boardNo);
			} else { // 좋아요 누르기가 안 된 경우
				response.sendRedirect(request.getContextPath() + "/detail.bo?memNo=" + memNo + "&boardNo=" + boardNo);
			}
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
