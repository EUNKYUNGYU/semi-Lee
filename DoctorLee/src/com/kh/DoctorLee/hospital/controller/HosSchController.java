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
 * Servlet implementation class HosSchController
 */
@WebServlet("/hosSch.dy")
public class HosSchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HosSchController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String indexSch = request.getParameter("index_search");
		
		ArrayList<Hospital> list = new HospitalService().schHosList();
		
			
			if(!list.isEmpty()) {
				
				if(indexSch.equals("")) {
				
					request.setAttribute("list", list);
					request.getRequestDispatcher("views/hospital/hosSearch.jsp").forward(request, response);
				} else {
					
					ArrayList<Hospital> schList = new HospitalService().searchHos(indexSch);
					request.setAttribute("schList", schList);
					response.sendRedirect("views/hospital/hosSearch.jsp");
					
				}
				
			} else {
				
				request.setAttribute("error", "병원 검색창, 병원 리스트 불러오기 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp");
			}
			
			request.setAttribute("indexSch", indexSch);
			
			
			System.out.println("?????????");
		

	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
