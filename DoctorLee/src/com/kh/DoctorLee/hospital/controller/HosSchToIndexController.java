package com.kh.DoctorLee.hospital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		//int currentPage = Integer.parseInt(request.getParameter("page"));
		//System.out.println(currentPage);
		
		
		
		String schKeyword = request.getParameter("index_search");
		String hkey = request.getParameter("hkey");
		
		ArrayList<Hospital> list = new HospitalService().schToIndex(schKeyword, hkey);
		
		// System.out.println(list);
		
		if(!list.isEmpty()) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/hospital/hosSearch.jsp").forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath());
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