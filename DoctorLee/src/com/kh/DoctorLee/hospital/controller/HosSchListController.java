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
 * Servlet implementation class HosSchListController
 */
@WebServlet("/sch_hos.dy")
public class HosSchListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HosSchListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String keyword = request.getParameter("sch_bar");
		
		ArrayList<Hospital> hosList = new HospitalService().searchHos(keyword);

		if(hosList.isEmpty()) {
			
			request.setAttribute("error", "에러");
			request.getRequestDispatcher("views/common/errorPage.jsp");
		} else {
			request.getSession().setAttribute("hosList", hosList);
			response.sendRedirect("/DoctorLee/hosSearch.jsp");
			
			// request.setAttribute("hosList", hosList);
			// request.getRequestDispatcher("views/hostpital/hosSearch.jsp").forward(request, response);
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
