package com.kh.DoctorLee.cou.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.cou.model.service.CouService;
import com.kh.DoctorLee.cou.model.vo.CouVideo;

/**
 * Servlet implementation class couVideoListController
 */
@WebServlet("/couVideoList.cou")
public class CouVideoListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouVideoListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 페이징 처리
		int listCount; // 현재 게시판의 게시글 총 개수
		int currentPage; //현재 페이지(사용자가 요청한 페이지)
		int pageLimit; // 페이지 하단에 보여질 페이장비의 최대 개수(10개)
		int boardLimit; // 한 페이지에 보여질 게시글의 최대 개수(5개)
		
		int maxPage; // 가장 마지막 페이지가 몇 번 페이지인지(총 페이지의 개수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작 수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝 수
		
		// 총 게시글 수
		listCount = new CouService().selectVideoListCount();
		
		// 현재 페이지
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		// 페이징바의 최대 개수
		pageLimit = 10;
		
		// 한 페이지에 보여질 게시글의 최대 개수
		boardLimit = 5;
		
		// 가장 마지막 페이지가 몇 번 페이지인지
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		// 페이지 하단에 보여질 페이징바의 시작 수
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		
		// 페이지 하단에 보여질 페이징바의 끝 수
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<CouVideo> list = new CouService().selectVideoList(pi);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		request.getRequestDispatcher("views/cou/couVideoListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
