package com.kh.DoctorLee.comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.comment.model.service.CommentService;
import com.kh.DoctorLee.comment.model.vo.Comment;
import com.kh.DoctorLee.member.model.vo.Member;

/**
 * Servlet implementation class AjaxCommentInsertController
 */
@WebServlet("/coInsert.co")
public class AjaxCommentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCommentInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String commentContent = request.getParameter("content");
		String memNo = String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getMemNo());
		
		Comment c = new Comment();
		c.setBoardNo(boardNo);
		c.setCommentContent(commentContent);
		c.setWriter(memNo);
				
		int result = new CommentService().insertComment(c);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(result);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
