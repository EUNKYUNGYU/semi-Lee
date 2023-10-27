package com.kh.DoctorLee.hospital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.common.Pagination;
import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.hospital.model.service.HospitalService;
import com.kh.DoctorLee.hospital.model.service.HospitalServiceImpl;
import com.kh.DoctorLee.hospital.model.vo.Hospital;

/**
 * Servlet implementation class HosSchToIndexController
 */
@WebServlet("/hosSearch.do")
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
		HospitalServiceImpl hosService = new HospitalServiceImpl();
		String keyword = request.getParameter("keyword");
		
		int listCount = hosService.selectHosCount(keyword); // 전체 병원 개수 조회
		int page = Integer.parseInt(request.getParameter("page"));
		int pageLimit = 5;
		int hosLimit = 3;

		PageInfo pi = Pagination.getPageInfo(listCount, page, pageLimit, hosLimit); 
		
		ArrayList<Hospital> hosList = hosService.selectHosList(pi, keyword);
		request.setAttribute("pi", pi);
		request.setAttribute("hosList", hosList);
		request.setAttribute("keyword", keyword);
		request.getRequestDispatcher("views/hospital/hosSearch.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
