package com.kh.DoctorLee.quize.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.quize.model.service.QuizeService;
import com.kh.DoctorLee.quize.model.vo.Quize;

/**
 * Servlet implementation class QuizeListController
 */
@WebServlet("/list.qz")
public class QuizeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuizeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int listCount = new QuizeService().selectListCount();
		int currentPage = 1;
		//currentPage = Integer.parseInt(request.getParameter("cpage"));
		System.out.println("QuizeListController 에서currentPage  " + currentPage);
		int pageLimit = 10;
		int boardLimit = 5;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage= startPage + pageLimit - 1;
		System.out.println("listCount" + listCount);
		if(endPage > maxPage ) endPage = maxPage;
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit,boardLimit, maxPage, startPage, endPage);
		
		
		ArrayList<Quize> list = new QuizeService().selectList(pi);
		
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.getRequestDispatcher("views/quize/quizeListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
