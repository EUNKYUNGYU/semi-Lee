package com.kh.DoctorLee.hospital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.hospital.model.service.HospitalService;
import com.kh.DoctorLee.hospital.model.vo.Hospital;

/**
 * Servlet implementation class HosSchToIndexController
 */
@WebServlet("/hosSch.dy")
public class HosSchToIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HosSchToIndexController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// paging
		int listCount = new HospitalService().hosCount(); // 병원 입점 개수 조회
		int currentPage = Integer.parseInt(request.getParameter("hkeyP"));
		// localhost:8765/DoctorLee/hosSch.dy?search=&hkey=1
		int pageLimit = 5;
		int hosLimit = 3;
		int maxPage = (int)Math.ceil((double)listCount / hosLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) endPage = maxPage;
		
		PageInfo pInfo = new PageInfo(listCount, currentPage, pageLimit, hosLimit, maxPage, startPage, endPage);
		
		String search = request.getParameter("search");
		String hkeyH = request.getParameter("hkeyH");
		
		ArrayList<Hospital> list = new HospitalService().schToIndex(search, hkeyH);
		
		// 앞단에서 널체크
		request.setAttribute("list", list);
		request.setAttribute("pInfo", pInfo);
		
		request.getRequestDispatcher("views/hospital/hosSearch.jsp").forward(request, response);
		// response.sendRedirect(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
