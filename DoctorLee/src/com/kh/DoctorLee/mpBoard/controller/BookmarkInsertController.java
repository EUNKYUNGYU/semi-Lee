package com.kh.DoctorLee.mpBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.hospital.model.vo.Hospital;
import com.kh.DoctorLee.mpBoard.model.service.BookmarkService;
import com.kh.DoctorLee.mpBoard.model.vo.Bookmark;

/**
 * Servlet implementation class BookmarkInsertController
 */
@WebServlet("/insert.bm")
public class BookmarkInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookmarkInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hosnameWord = request.getParameter("hn");
		//int memNo = Integer.parseInt(request.getParameter("memNo"));
		
		Hospital hos = new BookmarkService().selectHosWord(hosnameWord);
		int result = new BookmarkService().insertBookmark(hosnameWord);
		ArrayList<Bookmark> list = new BookmarkService().selectBookmark();
		request.setAttribute("list", list);
		request.setAttribute("hos", hos);
		request.getRequestDispatcher("views/myPage/bookmark.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
